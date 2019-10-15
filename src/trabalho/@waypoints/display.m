function display(obj)
    if ~isa(obj, "waypoints")
        error("Object is not an PID.")
    end
    printf("Waypoints: %s = <size=%d>\n", inputname(1), length(obj.waypoints));
end