function obj = set (p, varargin)

  if numel (varargin) < 2 
    error ("@purepursuit/set: expecting PROPERTY/VALUE pairs");
  end

  if ~isa(p, "purepursuit")
    error("Object is not a PID.")
  end
    
  obj = p;
  while (numel (varargin) > 1)
    prop = varargin{1};
    val  = varargin{2};
    varargin(1:2) = [];
    if ~ischar(prop)
      error ("@purepursuit/get: PROPERTY must be a string");
    else
      switch (prop)
        case "baseline"
          obj.baseline = val;
        case "steermax"
          obj.steermax = val;
        case "lookahead_distance"
          obj.lookahead_distance = val;
        case "waypoints"
          obj.waypoints = val;
        otherwise
          error ('@purepursuit/get: invalid PROPERTY "%s"', prop);
      end
    end
  end
end