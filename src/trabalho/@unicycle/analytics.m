function [dx,u] = analytics(obj, t, x, u)
    if ~isa(obj, "unicycle")
        error("Object is not an Unicycle.")
    end

    L = obj.L;
    
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

    if abs(u(2)) > eps 
        x_t = @(t,u,x) + L.*u(1)./u(2) .* (sin(u(2).*t./L + x(3))-sin(x(3)));
        y_t = @(t,u,x) - L.*u(1)./u(2) .* (cos(u(2).*t./L + x(3))-cos(x(3)));
        t_t = @(t,u,x) + t.*u(2)./L ;
    else
        x_t = @(t,u,x) + t.*u(1).*cos(x(3));
        y_t = @(t,u,x) + t.*u(1).*sin(x(3));
        t_t = @(t,u,x) zeros(1,length(t)); 
    end

    % compute the derivative
    dx = zeros(3,1);
    dx(1) = x_t(t,u,x);
    dx(2) = y_t(t,u,x);
    dx(3) = t_t(t,u,x);

end


