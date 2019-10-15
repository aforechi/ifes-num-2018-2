function obj = bicycle(baseline, accelmax, steermax)
    data.baseline = baseline;
    data.accelmax = accelmax;
    data.steermax = steermax;
    obj = class (data, 'bicycle');
end