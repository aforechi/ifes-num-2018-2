function obj = set (p, varargin)

  if numel (varargin) < 2 
    error ("@pidcontrol/set: expecting PROPERTY/VALUE pairs");
  end

  if ~isa(p, "pidcontrol")
    error("Object is not a PID.")
  end
    
  obj = p;
  while (numel (varargin) > 1)
    prop = varargin{1};
    val  = varargin{2};
    varargin(1:2) = [];
    if ~ischar(prop)
      error ("@pidcontrol/get: PROPERTY must be a string");
    else
      switch (prop)
        case "Kp"
          obj.Kp = val;
        case "Kd"
          obj.Kd = val;
        case "Ki"
          obj.Ki = val;
        otherwise
          error ('@pidcontrol/get: invalid PROPERTY "%s"', prop);
      end
    end
  end
end