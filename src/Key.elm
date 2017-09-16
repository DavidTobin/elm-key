module Key exposing (Key(..), onKey, onKeyWithOptions)

{-| This library handles the modern event.key event in Elm. See [https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key)

# Definition
@docs Key

# Events
@docs onKey, onKeyWithOptions

-}

import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json


{-| Keys that can be passed from an event.
-}
type Key
    = Key String
    | Shift
    | Meta
    | Ctrl
    | Alt
    | CapsLock
    | Tab
    | Enter
    | Backspace
    | Esc



-- Public


{-| Capture events for things like text fields or text areas.
It grabs the **key** value at `event.key`
-}
onKey : (Key -> msg) -> Html.Attribute msg
onKey tagger =
    on "keydown" (Json.map tagger key)


{-| Capture events for things like text fields or text areas.
It grabs the **key** value at `event.key`. Accepts options.
-}
onKeyWithOptions : Options -> (Key -> msg) -> Html.Attribute msg
onKeyWithOptions options tagger =
    onWithOptions "keydown" options (Json.map tagger key)



-- Private


key : Json.Decoder Key
key =
    Json.at [ "key" ] keyDecoder


keyDecoder : Json.Decoder Key
keyDecoder =
    Json.map
        (\k ->
            case k of
                "Shift" ->
                    Shift

                "Meta" ->
                    Meta

                "Ctrl" ->
                    Ctrl

                "Alt" ->
                    Alt

                "CapsLock" ->
                    CapsLock

                "Tab" ->
                    Tab

                "Enter" ->
                    Enter

                "Backspace" ->
                    Backspace

                "Esc" ->
                    Esc

                _ ->
                    Key k
        )
        Json.string
