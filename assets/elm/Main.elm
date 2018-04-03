port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RealEstateIndex exposing (..)
import Navigation exposing (..)


-- Model


type alias Model =
    { page : Page
    , realEstateIndex : RealEstateIndex.Model
    }


type Page
    = NotFound
    | RealEstateIndexPage


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            hashToPage location.hash

        ( realEstateIndexInitModel, realEstateIndexInitCmd ) =
            RealEstateIndex.init

        initModel =
            { page = page
            , realEstateIndex = realEstateIndexInitModel
            }

        commands =
            Cmd.batch
                [ Cmd.map RealEstateIndexMsg realEstateIndexInitCmd
                ]
    in
        ( initModel, commands )



-- update


type Msg
    = Navigate Page
    | ChangePage Page
    | RealEstateIndexMsg RealEstateIndex.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate page ->
            ( { model | page = page }, Navigation.newUrl <| pageToHash page )

        ChangePage page ->
            ( { model | page = page }, Cmd.none )

        RealEstateIndexMsg msg ->
            let
                ( realEstateIndexModel, cmd ) =
                    RealEstateIndex.update msg model.realEstateIndex
            in
                ( { model | realEstateIndex = realEstateIndexModel }
                , Cmd.map RealEstateIndexMsg cmd
                )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        realEstateIndexSub =
            RealEstateIndex.subscriptions model.realEstateIndex
    in
        Sub.batch
            [ Sub.map RealEstateIndexMsg realEstateIndexSub
            ]


hashToPage : String -> Page
hashToPage hash =
    case hash of
        "#/" ->
            RealEstateIndexPage

        "" ->
            RealEstateIndexPage

        _ ->
            NotFound



-- view


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                RealEstateIndexPage ->
                    Html.map RealEstateIndexMsg
                        (RealEstateIndex.view model.realEstateIndex)

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
                [ a [ onClick (Navigate RealEstateIndexPage) ] [ text "Real Estate" ]
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
        RealEstateIndexPage ->
            "#/"

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
