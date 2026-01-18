import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System as Sys;
import Toybox.Attention;

class RefereeView extends WatchUi.View {
    var halfLength;

    var seconds = 0;
    var homeScore = 0;
    var awayScore = 0;
    var _isTimeWaste = false;
    var _isHalfTime = false;
    var _hasBeenHalfTime = false;
    var secondsSecodaryClock = 0;

    var mainTime;
    var secondayTime;

    var _homeLabel;
    var _awayLabel;
    var _timerLabel;
    var _addedTimeLabel;
    var _listGoals = [];

    function initialize(initialTime) {
        View.initialize();
        halfLength = initialTime;
    }
    
    function timerCallback() as Void {
        if (!_isHalfTime) {
            seconds += 1;
            if (_isTimeWaste) {
                secondsSecodaryClock += 1;
            }
            if (seconds == halfLength*60 || seconds == halfLength*2*60) {
                var vibeData = [
                                new Attention.VibeProfile(25, 2000),
                                new Attention.VibeProfile(50, 2000),
                                new Attention.VibeProfile(100, 2000)
                                ];
                Attention.vibrate(vibeData);
            }
            WatchUi.requestUpdate();
        }
    }

    // Load your resources here
    function onLayout(dc as Dc) {
        setLayout(Rez.Layouts.MatchLayout(dc));
        _homeLabel = findDrawableById("home");
        _awayLabel = findDrawableById("away");
        _timerLabel = findDrawableById("mainTimer");
        _addedTimeLabel = findDrawableById("addedTime");

        var myTimer = new Timer.Timer();
        myTimer.start(method(:timerCallback), 1000, true);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) {
        // Update score
        _homeLabel.setText("[" + homeScore +"]");
        _awayLabel.setText("[" + awayScore +"]");

        // Update Time
        // Main Timer
        mainTime = timeFormat(seconds);
        _timerLabel.setText(mainTime);
        // Secodary Timer
        secondayTime = timeFormat(secondsSecodaryClock);
        _addedTimeLabel.setText(secondayTime);
        
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function timeFormat(timeInSeconds) {
        var timeFormated;
        var minutes = timeInSeconds / 60;
        var displaySec = timeInSeconds % 60;
        
        minutes = (minutes < 10)
            ? Lang.format("0$1$", [minutes])
            : minutes;
        displaySec = (displaySec < 10)
            ? Lang.format("0$1$", [displaySec])
            : displaySec;
        timeFormated = Lang.format("$1$:$2$", [minutes, displaySec]);
        return timeFormated;
    }

}
