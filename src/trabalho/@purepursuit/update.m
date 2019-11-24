function self = update(obj, x)
    if ~isa(obj, "purepursuit")
        error("Object is not an PID.")
    end
    self = obj;
    
    velocity = x(4);
    
    if velocity > 0.001            
        i = get(obj.waypoints, 'current');

        waypoints = waypoints_wrt_car(obj.waypoints, x);

        coeffs = polyfit(waypoints(i:i+1,1), waypoints(i:i+1,2), 1);
        
        lookahead_distance_x = self.lookahead_distance;
        
        cte = polyval(coeffs, lookahead_distance_x);
        
        self.steering = atan(2 * self.baseline * cte / (lookahead_distance_x ^ 2));
    else
        self.steering = 0.0;
    end
    self.steering = max(-self.steermax, min(self.steering, self.steermax));
end