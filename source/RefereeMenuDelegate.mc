import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class RefereeMenuDelegate extends WatchUi.MenuInputDelegate {
    var _view;

    function initialize(view) {
        MenuInputDelegate.initialize();
        _view = view;
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :homeScored) {
            _view.homeScore = _view.homeScore + 1;
            _view._listGoals.add(new MatchEvent("H", _view.seconds, "[" + _view.homeScore + "] - " + _view.awayScore, "goal"));
        } else if (item == :awayScored) {
            _view.awayScore = _view.awayScore + 1;
            _view._listGoals.add(new MatchEvent("H", _view.seconds, + _view.homeScore + " - [" + _view.awayScore + "]", "goal"));
        } else if (item == :halfEnd) {
            _view._isHalfTime = true;
            _view.seconds = _view.halfLength * 60;
            _view.secondsSecodaryClock = 0;
            _view._hasBeenHalfTime = true;
        } else if (item == :gameEnd){
            // Make the 'GameDoneViewMenu'
            var endGameView = new GameDoneView(_view._listGoals);
            var delegate;
            delegate = new GameDoneDelegate(_view._listGoals); // a WatchUi.MenuInputDelegate
            WatchUi.switchToView(endGameView, delegate, WatchUi.SLIDE_IMMEDIATE);
        }
    }
}