function self = waypoint_velocity(obj, x)
    if ~isa(obj, "waypoints")
        error("Object is not an PID.")
    end
    self = obj;
    
    pts = waypoints_wrt_car(obj, x);
    dist = sqrt(sum(pts.^2, 2));

    min_idx = min(dist);
    
    min_fst = find(dist==min_idx,1,'first');

    self.velocity = obj.waypoints(min_fst,3);
    
    self.current = min_fst;

end