import Toybox.Graphics;
import Toybox.WatchUi;

class SelTimeView extends WatchUi.View {
    var time = 0;
    var _timerLabel;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.HalfDurationLayout(dc));
        _timerLabel = findDrawableById("timer");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {

    }
    // Update the view
    function onUpdate(dc as Dc) as Void {
        var minute;
        minute = (time < 10)
            ? Lang.format("0$1$", [time])
            : time;
        var timeString = Lang.format("$1$:$2$", [minute, "00"]);
        _timerLabel.setText(timeString);
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
