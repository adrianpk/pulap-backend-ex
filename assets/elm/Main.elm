module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)


-- import Debug exposing (log)


type alias RealEstateListResponse =
    { all : List RealEstate
    }


type alias RealEstate =
    { id : String
    , name : String
    , description : String
    }


realEstateSampleResponse : RealEstateListResponse
realEstateSampleResponse =
    RealEstateListResponse
        [--RealEstate "1" "RealEstate1" "RealEstate1 description"
         -- , RealEstate "2" "RealEstate2" "RealEstate2 description"
        ]



-- Model


type alias Model =
    { selected : String
    , list : RealEstateListResponse
    , listString : String
    , error : String
    }


initModel : Model
initModel =
    { selected = ""
    , list = realEstateSampleResponse
    , listString = ""
    , error = ""
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchRealEstateList )


decodeRealEstateListResponse : Decoder RealEstateListResponse
decodeRealEstateListResponse =
    Json.Decode.map RealEstateListResponse (list decodeRealEstate)
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
            Http.send FetchRealEstateList request
    in
        cmd



-- Update


type Msg
    = FetchRealEstateList (Result Http.Error RealEstateListResponse)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchRealEstateList (Ok result) ->
            ( { model | list = result }, Cmd.none )

        FetchRealEstateList (Err err) ->
            ( { model | error = toString (err) }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div
        [ style [ ( "padding", "2rem" ) ] ]
        [ div [] [ text "Real Estate List:" ]
        , div []
            [ renderRealEstateTable model
            ]
        ]


renderRealEstateTable : Model -> Html Msg
renderRealEstateTable model =
    table []
        (List.concat
            [ [ renderTableHeader ]
            , renderRealEstateTableRows model
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


renderRealEstateTableRows : Model -> List (Html Msg)
renderRealEstateTableRows model =
    model.list.all
        |> List.map renderRealEstateRow


renderRealEstateRow : RealEstate -> Html Msg
renderRealEstateRow realEstate =
    tr []
        [ td [] [ realEstate.id |> text ]
        , td [] [ realEstate.name |> text ]
        , td [] [ realEstate.description |> text ]
        ]


renderRealEstateList : Model -> Html Msg
renderRealEstateList model =
    model.list.all
        |> List.map renderRealEstate
        |> ul []


renderRealEstate : RealEstate -> Html Msg
renderRealEstate realEstate =
    li []
        [ text (realEstate.id ++ " - " ++ realEstate.name ++ " - " ++ realEstate.description)
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
 
