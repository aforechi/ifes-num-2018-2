function display(obj)
    if ~isa(obj, "purepursuit")
        error("Object is not an PID.")
    end
    printf("Pure Pursuit: %s = <baseline=%f, steermax=%f, K=%f, Ld=%f>\n", inputname(1), obj.baseline, obj.steermax, obj.K, obj.Ld);
end