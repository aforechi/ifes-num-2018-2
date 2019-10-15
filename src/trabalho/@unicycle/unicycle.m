function obj = unicycle(L, dt, speedmax, accelmax)
    data.L = L;
    data.dt = dt;
    data.speedmax = speedmax;
    data.accelmax = accelmax;
    data.vprev = 0;
    obj = class (data, "unicycle");
end