function display(obj)
    if ~isa(obj, "pidcontrol")
        error("Object is not an PID.")
    end
    printf("PID: %s = <Kp=%f, Kd=%f, Ki=%f>\n", inputname(1), obj.Kp, obj.Kd, obj.Ki);
end