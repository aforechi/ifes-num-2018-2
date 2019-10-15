function obj = set (self, varargin)

  if numel (varargin) < 2 
    error ("@bicycle/set: expecting PROPERTY/VALUE pairs");
  end

  if ~isa(self, "bicycle")
    error("Object is not an Bicycle.")
  end
    
  obj = self;
  while (numel (varargin) > 1)
    prop = varargin{1};
    val  = varargin{2};
    varargin(1:2) = [];
    if ~ischar(prop)
      error ("@bicycle/get: PROPERTY must be a string");
    else
      switch (prop)
        case "baseline"
          obj.baseline = val;
        case "accelmax"
          obj.accelmax = val;
        case "steermax"
          obj.steermax = val;
        otherwise
          error ('@bicycle/get: invalid PROPERTY "%s"', prop);
      end
    end
  end
end