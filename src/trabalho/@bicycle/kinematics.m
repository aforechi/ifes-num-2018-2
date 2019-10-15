function [dx,u] = kinematics(obj, t, x, u)
    % - The parameter T is ignored but  called from a continuous time integrator such as ode45 or
    %   Simulink.

    if ~isa(obj, "bicycle")
        error("Object is not an Bicycle.")
    end
    
    % implement speed and steer angle limits
    u(1) = min(obj.accelmax, max(u(1), -obj.accelmax));
    u(2) = min(obj.steermax, max(u(2), -obj.steermax));

    % compute the derivative
    dx = zeros(4,1);
    dx(1) = x(4)*cos(x(3));
    dx(2) = x(4)*sin(x(3));
    dx(3) = x(4)/obj.baseline * tan(u(2));
    dx(4) = u(1);
end

