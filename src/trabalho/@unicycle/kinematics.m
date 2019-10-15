function [dx, vnext] = kinematics(obj, t, x, u)
    % to be called from a continuous time integrator such as ode45 or Simulink

    if ~isa(obj, "unicycle")
        error("Object is not an Unicycle.")
    end
    
    % implement acceleration limit if required
    if ~isinf(obj.accelmax)
        if (u(1) - obj.vprev)/obj.dt > obj.accelmax
            u(1) = obj.vprev + obj.accelmax * obj.dt;
        elseif (u(1) - obj.vprev)/obj.dt < -obj.accelmax
            u(1) = obj.vprev - obj.accelmax * obj.dt;
        end
        vnext = u(1);
    end

    % implement speed and steer angle limits
    u(1) = min(obj.speedmax, max(u(1), -obj.speedmax));

    % compute the derivative
    dx = zeros(3,1);
    dx(1) = u(1)*cos(x(3));
    dx(2) = u(1)*sin(x(3));
    dx(3) = u(2)/obj.L;
end  