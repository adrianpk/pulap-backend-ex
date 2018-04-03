module RealEstateIndex exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Html.Events exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)


-- import Debug exposing (log)


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
    }


initModel : Model
initModel =
    { selectedId = Maybe.Nothing
    , list = []
    , item = Maybe.Nothing
    , error = ""
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchList )


decodeListResponse : Decoder ListResponse
decodeListResponse =
    Json.Decode.map ListResponse (list decodeItem)
        |> at [ "data" ]


decodeItemResponse : Decoder ItemResponse
decodeItemResponse =
    decodeItem |> at [ "data" ]


decodeItem : Decoder ItemResponse
decodeItem =
    decode ItemResponse
        |> required "id" string
        |> required "name" string
        |> required "description" string


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
    = FetchList
    | FetchItem String
    | ShowList (Result Http.Error ListResponse)
    | ShowItem (Result Http.Error ItemResponse)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
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



-- View


view : Model -> Html Msg
view model =
    div
        [ style [ ( "padding", "2rem" ) ] ]
        [ div [] [ text "Real Estate " ]
        , div []
            [ renderTable model
            ]
        ]


renderTable : Model -> Html Msg
renderTable model =
    table [ class "table is-striped is-narrow is-hoverable" ]
        (List.concat
            [ [ renderTableHeader ]
            , [ renderTableBody model
              ]
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



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



