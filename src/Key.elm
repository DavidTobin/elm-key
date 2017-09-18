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
    | Control
    | Alt
    | AltGraph
    | CapsLock
    | Tab
    | Enter
    | Backspace
    | Esc
    | Fn
    | FnLock
    | Hyper
    | NumLock
    | ScrollLock
    | Super
    | Symbol
    | SymbolLock
    | ArrowDown
    | ArrowUp
    | ArrowLeft
    | ArrowRight
    | End
    | Home
    | PageDown
    | PageUp
    | Clear
    | Copy
    | CrSel
    | Cut
    | Delete
    | EraseEof
    | ExSel
    | Insert
    | Paste
    | Redo
    | Undo
    | Accept
    | Again
    | Attn
    | Cancel
    | ContextMenu
    | Escape
    | Execute
    | Find
    | Finish
    | Help
    | Pause
    | Play
    | Props
    | Select
    | ZoomIn
    | ZoomOut
    | BrightnessDown
    | BrightnessUp
    | Eject
    | LogOff
    | Power
    | PowerOff
    | PrintScreen
    | Hibernate
    | StandBy
    | WakeUp
    | Dead
    | F1
    | F2
    | F3
    | F4
    | F5
    | F6
    | F7
    | F8
    | F9
    | F10
    | F11
    | F12
    | F13
    | F14
    | F15
    | F16
    | F17
    | F18
    | F19
    | F20



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

                "Control" ->
                    Control

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

                "AltGraph" ->
                    AltGraph

                "Fn" ->
                    Fn

                "FnLock" ->
                    FnLock

                "Hyper" ->
                    Hyper

                "NumLock" ->
                    NumLock

                "ScrollLock" ->
                    ScrollLock

                "Super" ->
                    Super

                "Symbol" ->
                    Symbol

                "SymbolLock" ->
                    SymbolLock

                "ArrowDown" ->
                    ArrowDown

                "ArrowUp" ->
                    ArrowUp

                "ArrowLeft" ->
                    ArrowLeft

                "ArrowRight" ->
                    ArrowRight

                "End" ->
                    End

                "Home" ->
                    Home

                "PageDown" ->
                    PageDown

                "PageUp" ->
                    PageUp

                "Clear" ->
                    Clear

                "Copy" ->
                    Copy

                "CrSel" ->
                    CrSel

                "Cut" ->
                    Cut

                "Delete" ->
                    Delete

                "EraseEof" ->
                    EraseEof

                "ExSel" ->
                    ExSel

                "Insert" ->
                    Insert

                "Paste" ->
                    Paste

                "Redo" ->
                    Redo

                "Undo" ->
                    Undo

                "Accept" ->
                    Accept

                "Again" ->
                    Again

                "Attn" ->
                    Attn

                "Cancel" ->
                    Cancel

                "ContextMenu" ->
                    ContextMenu

                "Escape" ->
                    Escape

                "Execute" ->
                    Execute

                "Find" ->
                    Find

                "Finish" ->
                    Finish

                "Help" ->
                    Help

                "Pause" ->
                    Pause

                "Play" ->
                    Play

                "Props" ->
                    Props

                "Select" ->
                    Select

                "ZoomIn" ->
                    ZoomIn

                "ZoomOut" ->
                    ZoomOut

                "BrightnessDown" ->
                    BrightnessDown

                "BrightnessUp" ->
                    BrightnessUp

                "Eject" ->
                    Eject

                "LogOff" ->
                    LogOff

                "Power" ->
                    Power

                "PowerOff" ->
                    PowerOff

                "PrintScreen" ->
                    PrintScreen

                "Hibernate" ->
                    Hibernate

                "StandBy" ->
                    StandBy

                "WakeUp" ->
                    WakeUp

                "Dead" ->
                    Dead

                "F1" ->
                    F1

                "F2" ->
                    F2

                "F3" ->
                    F3

                "F4" ->
                    F4

                "F5" ->
                    F5

                "F6" ->
                    F6

                "F7" ->
                    F7

                "F8" ->
                    F8

                "F9" ->
                    F9

                "F10" ->
                    F10

                "F11" ->
                    F11

                "F12" ->
                    F12

                "F13" ->
                    F13

                "F14" ->
                    F14

                "F15" ->
                    F15

                "F16" ->
                    F16

                "F17" ->
                    F17

                "F18" ->
                    F18

                "F19" ->
                    F19

                "F20" ->
                    F20

                _ ->
                    Key k
        )
        Json.string
