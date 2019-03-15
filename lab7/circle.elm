import Browser
import Browser.Navigation exposing (Key(..))
import GraphicSVG exposing (..)
import GraphicSVG.App exposing (..)
import Url

type Msg = Tick Float GetKeyState
         | MakeRequest Browser.UrlRequest
         | UrlChange Url.Url
         | UrlChange Url.Url

type alias Model = { size : Float} 

init : () -> Url.Url -> Key -> ( Model, Cmd Msg )
init flags url = (  { size = 10.0 } , Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = case msg of
                     Tick time keystate -> ...
                     MakeRequest req    -> ...
                     UrlChange url      -> ...

view : Model -> { title : String, body : Collage Msg }
view model = 
  let 
    title = "Stupid Circle"

    body  = collage 700 500 [ filled darkOrange <| ngon 5 model.size  ] 
  in { title = title, body = body }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
   case msg of
       Tick time getKeyState ->
           ( { model | size = model.size + 1 }, Cmd.none )

       MakeRequest req ->
           ( model, Cmd.none ) -- do nothing

       UrlChange url ->
           ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : AppWithTick () Model Msg
main = appWithTick Tick
       { init = init
       , update = update
       , view = view
       , subscriptions = subscriptions
       , onUrlRequest = MakeRequest
       , onUrlChange = UrlChange