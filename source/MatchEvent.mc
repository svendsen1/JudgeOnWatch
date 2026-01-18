class MatchEvent {
    var team;
    var time;
    var score;
    var eventType;

    function initialize(team, time, score, eventType) {
        self.team  = team;
        self.time  = time;
        self.score = score;
        self.eventType = eventType;
    }
}
