function self = waypoint_velocity(obj, x)
    if ~isa(obj, "waypoints")
        error("Object is not an PID.")
    end
    self = obj;
    
    pts = waypoints_wrt_car(obj, x);
    
    [min_dist, min_idx] = min(vecnorm(pts,2,2));

    self.velocity = obj.waypoints(min_idx,3);
    
    self.current = min_idx;

end