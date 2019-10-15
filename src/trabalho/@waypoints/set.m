function obj = set (p, varargin)

  if numel (varargin) < 2 
    error ("@waypoints/set: expecting PROPERTY/VALUE pairs");
  end

  if ~isa(p, "waypoints")
    error("Object is not a PID.")
  end
    
  obj = p;
  while (numel (varargin) > 1)
    prop = varargin{1};
    val  = varargin{2};
    varargin(1:2) = [];
    if ~ischar(prop)
      error ("@waypoints/get: PROPERTY must be a string");
    else
      switch (prop)
        case "waypoints"
          obj.waypoints = val;
        otherwise
          error ('@waypoints/get: invalid PROPERTY "%s"', prop);
      end
    end
  end
end