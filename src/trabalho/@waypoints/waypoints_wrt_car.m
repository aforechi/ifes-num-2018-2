function waypoints = waypoints_wrt_car(obj, x)
    if ~isa(obj, "waypoints")
        error("Object is not an PID.")
    end
    
    theta = -x(3);

    transform = [cos(theta) -sin(theta);
                 sin(theta) cos(theta)];

    waypoints = obj.waypoints(:,1:2);
    waypoints = waypoints - [x(1) x(2)];
    waypoints = (transform * waypoints')';
end