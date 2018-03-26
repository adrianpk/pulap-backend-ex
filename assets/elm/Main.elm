module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional)


-- import Debug exposing (log)


type alias RealEstateResponse =
    { list : List RealEstate
    }


type alias RealEstate =
    { id : String
    , name : String
    , description : String
    }


realEstateSampleResponse : RealEstateResponse
realEstateSampleResponse =
    RealEstateResponse
        [--RealEstate "1" "RealEstate1" "RealEstate1 description"
         -- , RealEstate "2" "RealEstate2" "RealEstate2 description"
        ]



-- Model


type alias Model =
    { reSelectionId : String
    , realEstateResponse : RealEstateResponse
    , reListString : String
    , error : String
    }


initModel : Model
initModel =
    { reSelectionId = ""
    , realEstateResponse = realEstateSampleResponse
    , reListString = ""
    , error = ""
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, fetchRealEstateList )


decodeRealEstateResponse : Decoder RealEstateResponse
decodeRealEstateResponse =
  Json.Decode.map RealEstateResponse (list decodeRealEstate)
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
            Http.get url decodeRealEstateResponse

        cmd =
            Http.send FetchRealEstateList request
    in
        cmd



-- Update


type Msg
    = FetchRealEstateList (Result Http.Error RealEstateResponse)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchRealEstateList (Ok result) ->
            ( { model | realEstateResponse = result }, Cmd.none )

        FetchRealEstateList (Err err) ->
            ( { model | error = toString (err) }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div
        [ style [ ( "padding", "2rem" ) ] ]
        [ div [] [ text "Real Estate List:" ]
        , div []
            [ renderRealEstateList model
            ]
        ]


renderRealEstateList : Model -> Html Msg
renderRealEstateList model =
    model.realEstateResponse.list
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
