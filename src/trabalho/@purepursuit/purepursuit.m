function obj = purepursuit(baseline, steermax, lookahead_distance)
    data.baseline = baseline;
    data.steermax = steermax;
    data.lookahead_distance = lookahead_distance;
    data.steering = 0;
    data.velocity = 0;
    data.waypoints = [];
    obj = class (data, 'purepursuit');
end