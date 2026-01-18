import Toybox.Lang;
import Toybox.WatchUi;

class RefereeDelegate extends WatchUi.BehaviorDelegate {
    var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() {
        var menu = new WatchUi.Menu();
        var delegate;
        menu.setTitle("Action");
        menu.addItem("Home Scored", :homeScored);
        menu.addItem("Away Scored", :awayScored);
        if (!_view._hasBeenHalfTime){
            menu.addItem("End half", :halfEnd);
        } else {
            menu.addItem("End game", :gameEnd);
        }
        delegate = new RefereeMenuDelegate(_view); 
        WatchUi.pushView(menu, delegate, WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    function onKey(evt){
        if (evt.getKey() == WatchUi.KEY_ENTER){
            if (_view._isHalfTime){
                _view._isHalfTime = false;
            } else {
                //System.println("Enter Pressed - Time Wasteing ");
                _view._isTimeWaste = !_view._isTimeWaste;
            }
            return true;
        } else if (evt.getKey() == WatchUi.KEY_DOWN){
            onMenu();
            return true;
        }
        return false;
    }
}