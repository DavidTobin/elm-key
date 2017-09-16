module Main exposing (..)

import Key exposing (..)
import Html exposing (..)


type Msg
    = Keypress Key
    | KeypressWithOptions Key


type alias Model =
    { onKeyMsgs : List String
    , onKeyWithOptionsMsgs : List String
    }


init =
    { onKeyMsgs = []
    , onKeyWithOptionsMsgs = []
    }
        ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Keypress key ->
            { model | onKeyMsgs = model.onKeyMsgs ++ [ toString key ] } ! []

        KeypressWithOptions key ->
            { model | onKeyWithOptionsMsgs = model.onKeyWithOptionsMsgs ++ [ toString key ] } ! []


main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


view model =
    div []
        [ div [] [ onKeyExample ]
        , div [] [ onKeyWithOptionsExample ]
        , div [] [ text <| String.join "\n" model.onKeyMsgs ]
        ]


onKeyExample =
    textarea [ onKey Keypress ] []


onKeyWithOptionsExample =
    let
        options =
            { stopPropagation = True
            , preventDefault = True
            }
    in
        textarea [ onKeyWithOptions options Keypress ] []
