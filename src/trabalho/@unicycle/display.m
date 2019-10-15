function display(obj)
  if ~isa(obj, "unicycle")
        error("Object is not an Unicycle.")
  end
  printf("Unicycle: %s = <L=%f, dt=%f, vmax=%f, amax=%f>\n", inputname(1), obj.L, obj.dt, obj.speedmax, obj.accelmax);
end