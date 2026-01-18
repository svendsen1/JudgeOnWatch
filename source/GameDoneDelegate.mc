import Toybox.Lang;
import Toybox.WatchUi;

class GameDoneDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function restart() as [Views, InputDelegates] {
        var selTimeView = new SelTimeView();
        return [ selTimeView, new SelTimeDelegate( selTimeView) ];
    }
     function onSelect(item as MenuItem) as Void {
        System.println("OnMenuItem: " + item.getLabel());

        if (item.getLabel().equals("Restart")) {
            var newGame = restart();
            WatchUi.switchToView(newGame[0], newGame[1], WatchUi.SLIDE_IMMEDIATE);
        } 
    }
}