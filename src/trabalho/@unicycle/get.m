function val = get (obj, prop)

  if (nargin ~= 2)
    print_usage ();
  end
  
  if ~isa(obj, "unicycle")
    error("Object is not an Unicycle.")
  end
  
  if ~ischar (prop)
    error ("@unicycle/get: PROPERTY must be a string");
  end

  switch (prop)
    case "L"
      val = obj.L;
    case "dt"
      val = obj.dt;
    case "speedmax"
      val = obj.speedmax;
    case "accelmax"
      val = obj.accelmax;
    otherwise
      error ('@unicycle/get: invalid PROPERTY "%s"', prop);
  end
end