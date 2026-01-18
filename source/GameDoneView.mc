import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.System;

class GameDoneView extends WatchUi.Menu2 {

    function initialize(events) {
        Menu2.initialize({:title => "GAME"});

        for (var i = 0; i < events.size(); i++) {
            var e = events[i];
            var text = ((e.time / 60) + 1) + "' | " + e.score;

            System.println(i);
            addItem(
                new WatchUi.MenuItem(
                    text,
                    null,
                    null,
                    {:team => e.team, :time => e.time, :score => e.time, :eventType => e.eventType}
                )
            );
        }
        addItem(new WatchUi.MenuItem("Restart", null, "Restart", {:function => "restart"}));
        // new WatchUi.MenuItem(Name/Label (Displayed), Sub-Label (Displayed), Id (N-Dispaled), {:function => "restart"}))
    }
}
