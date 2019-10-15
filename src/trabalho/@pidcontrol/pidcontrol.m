function obj = pidcontrol(Kp, Kd, Ki, dt)
    data.Kp = Kp; 
    data.Kd = Kd;
    data.Ki = Ki;
    data.dt = dt;
    data.PTerm = 0;
    data.ITerm = 0;
    data.DTerm = 0;
    %Integral windup, also known as integrator windup or reset windup,
    %    refers to the situation in a PID feedback controller where
    %    a large change in setpoint occurs (say a positive change)
    %    and the integral terms accumulates a significant error
    %    during the rise (windup), thus overshooting and continuing
    %    to increase as this accumulated error is unwound
    %    (offset by errors in the other direction).
    %    The specific problem is the excess overshooting.
    data.windup_guard = 0; 
    data.last_time = 0;
    data.last_error = 0;
    data.acceleration = 0;
    obj = class (data, 'pidcontrol');
end