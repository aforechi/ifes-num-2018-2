function val = get (obj, prop)

  if (nargin ~= 2)
    print_usage ();
  end

  if ~isa(obj, "pidcontrol")
    error("Object is not a PID.")
  end
    
  if ~ischar(prop)
    error ('@pidcontrol/get: PROPERTY must be a string');
  end

  switch (prop)
    case "Kp"
      val = obj.Kp;
    case "Kd"
      val = obj.Kd;
    case "Ki"
      val = obj.Ki;
    case "acceleration"
      val = obj.acceleration;
    otherwise
      error ('@pidcontrol/get: invalid PROPERTY "%s"', prop);
  end
end