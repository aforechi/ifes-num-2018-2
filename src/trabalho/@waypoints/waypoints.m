function p = waypoints(a)
  if (nargin > 1)
    print_usage ();
  end

  if (nargin == 0)
    p.waypoints = 0;
    p = class (p, 'waypoints');
  else
    if (isa (a, 'waypoints'))
      p = a;
    elseif (isreal (a) && ismatrix (a))
      p.waypoints = a; 
      p.velocity = 0;
      p.current = 0;
      p = class (p, 'waypoints');
    else
      error ("@waypoints: A must be a real matrix");
    end
  end
end