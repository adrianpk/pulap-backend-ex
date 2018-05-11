port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RealEstate exposing (..)
import Navigation exposing (..)


-- Model


type alias Model =
    { page : Page
    , realEstate : RealEstate.Model
    }


type Page
    = NotFound
    | RealEstatePage


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            hashToPage location.hash

        ( realEstateInitModel, realEstateInitCmd ) =
            RealEstate.init

        initModel =
            { page = page
            , realEstate = realEstateInitModel
            }

        commands =
            Cmd.batch
                [ Cmd.map RealEstateMsg realEstateInitCmd
                ]
    in
        ( initModel, commands )



-- update


type Msg
    = Navigate Page
    | ChangePage Page
    | RealEstateMsg RealEstate.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate page ->
            ( { model | page = page }, Navigation.newUrl <| pageToHash page )

        ChangePage page ->
            ( { model | page = page }, Cmd.none )

        RealEstateMsg msg ->
            let
                ( realEstateModel, cmd ) =
                    RealEstate.update msg model.realEstate
            in
                ( { model | realEstate = realEstateModel }
                , Cmd.map RealEstateMsg cmd
                )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        realEstateSub =
            RealEstate.subscriptions model.realEstate
    in
        Sub.batch
            [ Sub.map RealEstateMsg realEstateSub
            ]


hashToPage : String -> Page
hashToPage hash =
    case hash of
        "#/" ->
            RealEstatePage

        "" ->
            RealEstatePage

        _ ->
            NotFound



-- view


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                RealEstatePage ->
                    Html.map RealEstateMsg
                        (RealEstate.view model.realEstate)

                NotFound ->
                    div [ class "main" ]
                        [ h1 []
                            [ text "Page Not Found!" ]
                        ]
    in
        div []
            [ pageHeader model
            , page
            ]


pageHeader : Model -> Html Msg
pageHeader model =
    header [ class "tabs" ]
        [ ul
            []
            [ li [ class "is-active" ]
                [ a [ onClick (Navigate RealEstatePage) ] [ text "Real Estate" ]
                ]
            , li [ class "is-active" ]
                [ a [ href "#" ] [ text "Publications" ]
                ]
            ]
        ]



-- Init


pageToHash : Page -> String
pageToHash page =
    case page of
        RealEstatePage ->
            "#/realestate"

        NotFound ->
            "#notfound"


locationToMsg : Navigation.Location -> Msg
locationToMsg location =
    location.hash
        |> hashToPage
        |> ChangePage


main : Program Never Model Msg
main =
    Navigation.program locationToMsg
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
