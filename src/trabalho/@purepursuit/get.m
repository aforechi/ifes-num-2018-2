function val = get (obj, prop)

  if (nargin ~= 2)
    print_usage ();
  end

  if ~isa(obj, "purepursuit")
    error("Object is not a PID.")
  end
    
  if ~ischar(prop)
    error ("@purepursuit/get: PROPERTY must be a string");
  end

  switch (prop)
    case "baseline"
      val = obj.baseline;
    case "steermax"
      val = obj.steermax;
    case "gain"
      val = obj.gain;
    case "lookahead_distance"
      val = obj.lookahead_distance;
    case "waypoints"
      val = obj.waypoints;
    case "steering"
      val = obj.steering;
    case "velocity"
      val = obj.velocity;
    otherwise
      error ('@purepursuit/get: invalid PROPERTY "%s"', prop);
  end
end