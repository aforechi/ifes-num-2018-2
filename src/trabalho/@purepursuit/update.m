function self = update(obj, x)
    if ~isa(obj, "purepursuit")
        error("Object is not an PID.")
    end
    self = obj;
    
    waypoints = waypoints_wrt_car(obj.waypoints, x);
    
    i = get(obj.waypoints, 'current');
    
    coeffs = polyfit(waypoints(i:i+4,1), waypoints(i:i+4,2), 3);
        
    velocity = x(4);
    
    if velocity > 0.001            
        lookahead_distance_x = self.lookahead_distance * velocity;          
        cte = polyval(coeffs, lookahead_distance_x);            
        self.steering = atan((2 * self.baseline * cte / lookahead_distance_x) / (self.gain * velocity));
    else
        self.steering = 0.0;
    end
    self.steering = max(-self.steermax, min(self.steering, self.steermax));
end