function display(obj)
    if ~isa(obj, "bicycle")
        error("Object is not an Bicycle.")
    end
    printf("Bicycle: %s = <L=%f, amax=%f, smax=%f>\n", inputname(1), obj.baseline, obj.accelmax, obj.steermax);
end