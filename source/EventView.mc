import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System as Sys;
import Toybox.Attention;

class EventView extends WatchUi.View {
    var _event;
    
    var _scoreLabel;
    var _timerLabel;
    var _icon;

    function initialize(event) {
        View.initialize();
        _event = event;
    }

    // Load your resources here
    function onLayout(dc as Dc) {
        setLayout(Rez.Layouts.EventLayout(dc));
        
        _scoreLabel = findDrawableById("scoreText");
        _timerLabel = findDrawableById("timeText");
        _icon = findDrawableById("eventIcon");
    }    

        function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) {
        _scoreLabel.setText(_event.score);
        var time = timeFormat(_event.time);
        _timerLabel.setText(time);
        var iconSelect = _event.eventType;
        System.println(iconSelect);

        switch (iconSelect) {
            case "goal":
                _icon.setBitmap(Rez.Drawables.footballIcon);
                break;
        }
                
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function timeFormat(seconds) {
        var minutes;
        minutes = (seconds / 60) + 1;
        return minutes + "'";    
    }
}