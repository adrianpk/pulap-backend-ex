module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)


-- import Debug exposing (log)


type alias ListResponse =
    { all : List RealEstate
    }

type alias ItemResponse =
    { item : Maybe RealEstate
    }

type alias RealEstate =
    { id : String
    , name : String
    , description : String
    }


sampleListResponse : ListResponse
sampleListResponse =
    ListResponse [] 


sampleItemResponse : Maybe ItemResponse
sampleItemResponse = Nothing

-- Model


type alias Model =
    { selected : String
    , list : List RealEstate
    , item : Maybe RealEstate
    , error : String
    }


initModel : Model
initModel =
    { selected = ""
    , list = []
    , item = Maybe.Nothing
    , error = ""
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchRealEstateList )


decodeRealEstateListResponse : Decoder ListResponse
decodeRealEstateListResponse =
    Json.Decode.map ListResponse (list decodeRealEstate)
        |> at [ "data" ]


decodeRealEstate : Decoder RealEstate
decodeRealEstate =
    decode RealEstate
        |> required "id" string
        |> required "name" string
        |> required "description" string


fetchRealEstateList : Cmd Msg
fetchRealEstateList =
    let
        url =
            "/api/v1/real-estate"

        request =
            Http.get url decodeRealEstateListResponse

        cmd =
            Http.send FetchList request
    in
        cmd



-- Update


type Msg
    = FetchList (Result Http.Error ListResponse)
    | FetchItem (Result Http.Error ItemResponse)



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchList result ->
            case result of
                Ok listResult ->
                    ( { model | list = listResult.all }, Cmd.none )

                Err err ->
                    ( { model | error = toString (err) }, Cmd.none )

        FetchItem result ->
            case result of
                Ok itemResult ->
                    ( { model | item = itemResult.item }, Cmd.none )

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

            -- , renderRealEstateTableRows model
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
            ([ "id", "name", "description" ]
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
        |> List.map renderTableRow


renderTableRow : RealEstate -> Html Msg
renderTableRow realEstate =
    tr []
        [ td [] [ realEstate.id |> text ]
        , td [] [ realEstate.name |> text ]
        , td [] [ realEstate.description |> text ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Init


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
