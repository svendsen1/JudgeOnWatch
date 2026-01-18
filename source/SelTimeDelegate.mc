import Toybox.Lang;
import Toybox.WatchUi;

class SelTimeDelegate extends WatchUi.BehaviorDelegate {
    var _view;
       
    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onDown() {
        if (_view.time > 0){
        _view.time = _view.time - 1;
        }
    }
    function onUp(){
        if (_view.time < 60) {
            _view.time = _view.time + 5;
        }
    }
    public function onEnter() {
        // Pass time to ref view
        var refView = new RefereeView(_view.time);
        var refDelegate = new RefereeDelegate(refView);
        WatchUi.pushView(refView, refDelegate, WatchUi.SLIDE_IMMEDIATE);
    }

    function onKey(evt){
        // WatchUi.KEY_ENTER --> Start/Stop
        if (evt.getKey() == WatchUi.KEY_ENTER){
            // System.println("Enter Pressed - Start Game");
            onEnter();
            WatchUi.requestUpdate();
            return true;
        } else if (evt.getKey() == WatchUi.KEY_DOWN){
            onDown();
            WatchUi.requestUpdate();
            // System.println("Time is: " + _view.time);
            return true;
        } else if (evt.getKey() == WatchUi.KEY_UP){
            onUp();
            WatchUi.requestUpdate();
            // System.println("Time is: " + _view.time);
            return true;
        }
        return false;
    }
}