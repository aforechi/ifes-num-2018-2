function obj = set (p, varargin)

  if numel (varargin) < 2 
    error ("@unicycle/set: expecting PROPERTY/VALUE pairs");
  end

  if ~isa(p, "unicycle")
    error("Object is not an Unicycle.")
  end
    
  obj = p;
  while (numel (varargin) > 1)
    prop = varargin{1};
    val  = varargin{2};
    varargin(1:2) = [];
    if ~ischar (prop)
      error ("@unicycle/get: PROPERTY must be a string");
    else
      switch (prop)
        case "L"
          obj.L = val;
        case "dt"
          obj.dt = val;
        case "speedmax"
          obj.speedmax = val;
        case "accelmax"
          obj.accelmax = val;
        otherwise
          error ('@unicycle/get: invalid PROPERTY "%s"', prop);
      end
    end
  end
end