function val = get (obj, prop)

  if (nargin ~= 2)
    print_usage ();
  end

  if ~isa(obj, "waypoints")
    error("Object is not a PID.")
  end
    
  if ~ischar(prop)
    error ("@waypoints/get: PROPERTY must be a string");
  end

  switch (prop)
    case "waypoints"
      val = obj.waypoints;
    case "current"
      val = obj.current;
    case "velocity"
      val = obj.velocity;
    otherwise
      error ('@waypoints/get: invalid PROPERTY "%s"', prop);
  end
end