function val = get (obj, prop)

  if (nargin ~= 2)
    print_usage ();
  end

  if ~isa(obj, "bicycle")
    error("Object is not an Bicycle.")
  end
    
  if ~ischar(prop)
    error ("@bicycle/get: PROPERTY must be a string");
  end

  switch (prop)
    case "baseline"
      val = obj.baseline;
    case "accelmax"
      val = obj.accelmax;
    case "steermax"
      val = obj.steermax;
    otherwise
      error ('@bicycle/get: invalid PROPERTY "%s"', prop);
  end
  
end