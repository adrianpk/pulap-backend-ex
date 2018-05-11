module RealEstate exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Html.Events exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Decode as Dec exposing (..)
import Json.Encode as Enc exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)
import Validate exposing (..)


type alias ListResponse =
    { all : List ItemResponse
    }


type alias ItemResponse =
    { id : String
    , name : String
    , description : String
    }


sampleListResponse : ListResponse
sampleListResponse =
    ListResponse []



-- Model


type alias Model =
    { selectedId : Maybe String
    , list : List ItemResponse
    , item : Maybe ItemResponse
    , error : String
    , name : String
    , description : String
    , response : Maybe String
    , focus : Maybe FormField
    , showErrors : Bool
    , formState : FormState
    , formErrors : List FormError
    }


type FormField
    = Name
    | Description


type FormState
    = Editing
    | Fetching


type alias FormError =
    ( FormField, ErrorMessage )


type alias ErrorMessage =
    String


initModel : Model
initModel =
    { selectedId = Maybe.Nothing
    , list = []
    , item = Maybe.Nothing
    , error = ""
    , name = ""
    , description = ""
    , response = Maybe.Nothing
    , focus = Maybe.Nothing
    , showErrors = False
    , formState = Editing
    , formErrors = []
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchList )


decodeListResponse : Decoder ListResponse
decodeListResponse =
    Dec.map ListResponse (Dec.list decodeItem)
        |> Dec.at [ "data" ]


decodeItemResponse : Decoder ItemResponse
decodeItemResponse =
    decodeItem |> at [ "data" ]


decodeItem : Decoder ItemResponse
decodeItem =
    decode ItemResponse
        |> required "id" Dec.string
        |> required "name" Dec.string
        |> required "description" Dec.string


fetchList : Cmd Msg
fetchList =
    let
        url =
            "/api/v1/real-estate"

        request =
            Http.get url decodeListResponse

        cmd =
            Http.send ShowList request
    in
        cmd


fetchItem : String -> Cmd Msg
fetchItem selectedId =
    let
        url =
            "/api/v1/real-estate/" ++ selectedId

        request =
            Http.get url decodeItemResponse

        cmd =
            Http.send ShowItem request
    in
        cmd



-- Update


type Msg
    = NoOp
    | FetchList
    | FetchItem String
    | ShowList (Result Http.Error ListResponse)
    | ShowItem (Result Http.Error ItemResponse)
    | SetField FormField String
    | OnFocus FormField
    | OnBlur FormField
    | SubmitForm
    | Response (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        NoOp ->
            ( model, Cmd.none )

        FetchList ->
            ( model, fetchList )

        FetchItem id ->
            ( model, fetchItem (id) )

        ShowList result ->
            case result of
                Ok listResult ->
                    ( { model | list = listResult.all }, Cmd.none )

                Err err ->
                    ( { model | error = toString (err) }, Cmd.none )

        ShowItem result ->
            case result of
                Ok itemResult ->
                    ( { model | item = Just itemResult, selectedId = Just itemResult.id }, Cmd.none )

                Err err ->
                    ( { model | error = toString (err) }, Cmd.none )

        SetField field value ->
            ( model
                |> setField field value
                |> setErrors
            , Cmd.none
            )

        OnFocus formField ->
            ( { model | focus = Just formField }, Cmd.none )

        OnBlur formField ->
            ( { model | focus = Nothing }, Cmd.none )

        SubmitForm ->
            case validateModel model of
                [] ->
                    ( { model | formErrors = [], response = Nothing, formState = Fetching }
                    , Http.send Response (postRequest model)
                    )

                errors ->
                    ( { model | formErrors = errors, showErrors = True }
                    , Cmd.none
                    )

        Response result ->
            case result of
                Ok submitResult ->
                    ( { model | response = Just submitResult, formState = Editing }, Cmd.none )

                Err error ->
                    ( { model | response = Just (toString error), formState = Editing }, Cmd.none )



-- Helpers


setErrors : Model -> Model
setErrors model =
    case validateModel model of
        [] ->
            { model | formErrors = [] }

        errors ->
            { model | formErrors = errors }


setField : FormField -> String -> Model -> Model
setField field value model =
    case field of
        Name ->
            { model | name = value }

        Description ->
            { model | description = value }


validateModel : Model -> List FormError
validateModel model =
    validate modelValidator model


modelValidator : Validator ( FormField, String ) Model
modelValidator =
    Validate.all
        [ Validate.ifBlank .name ( Name, "Name can't be blank." )
        , Validate.ifBlank .description ( Description, "Description can't be blank." )
        ]


onEnter : msg -> Attribute msg
onEnter msg =
    keyCode
        |> Dec.andThen
            (\key ->
                if key == 13 then
                    Dec.succeed msg
                else
                    Dec.fail "Not enter"
            )
        |> on "keyup"


postRequest : Model -> Http.Request String
postRequest model =
    let
        body =
            Enc.object
                [ ( "name", Enc.string model.name )
                , ( "description", Enc.string model.description )
                ]
                |> Http.jsonBody
    in
        Http.request
            { method = "POST"
            , headers = []
            , url = "http://localhost:4000"
            , body = body
            , expect = Http.expectString
            , timeout = Nothing
            , withCredentials = False
            }



-- View


view : Model -> Html Msg
view model =
    case model.selectedId of
        Just id ->
            itemView model

        Maybe.Nothing ->
            indexView model


indexView : Model -> Html Msg
indexView model =
    div
        [ style [ ( "padding", "2rem" ) ] ]
        [ div [] [ text "Real Estate" ]
        , div []
            [ renderTable model
            ]
        ]


itemView : Model -> Html Msg
itemView model =
    case model.item of
        Just item ->
            renderItem item

        Maybe.Nothing ->
            "not found" |> text


renderTable : Model -> Html Msg
renderTable model =
    table [ class "table is-striped is-narrow is-hoverable" ]
        (List.concat
            [ [ renderTableHeader ]
            , [ renderTableBody model ]
            ]
        )


renderTableHeader : Html Msg
renderTableHeader =
    let
        th1 field =
            th [] [ text field ]
    in
        thead []
            ([ "name", "description" ]
                |> List.map th1
            )


renderTableBody : Model -> Html Msg
renderTableBody model =
    let
        rows =
            renderTableRows model
    in
        tfoot [] rows


renderTableRows : Model -> List (Html Msg)
renderTableRows model =
    model.list
        |> List.map (renderTableRow model)


renderTableRow : Model -> ItemResponse -> Html Msg
renderTableRow model item =
    tr [ onClick (FetchItem item.id), class (rowClass model item) ]
        [ td [] [ item.name |> text ]
        , td [] [ item.description |> text ]
        ]


rowClass : Model -> ItemResponse -> String
rowClass model item =
    if model.selectedId == Just (item.id) then
        "is-selected"
    else
        ""


renderItem : ItemResponse -> Html Msg
renderItem item =
    div [ class "content" ]
        [ h1 []
            [ item.name |> text
            ]
        , p []
            [ item.description |> text
            ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
