function self = update(obj, current_time, current_velocity, desired_velocity)
    if ~isa(obj, "pidcontrol")
        error("Object is not an PID.")
    end
    self = obj;
    
    delta_time = current_time - self.last_time;
    
    current_error = desired_velocity - current_velocity;
    
    delta_error = current_error - self.last_error;
    
    if (delta_time >= self.dt)
        self.PTerm = self.Kp * current_error;
        self.ITerm = self.ITerm + current_error * delta_time;

        if (self.ITerm < -self.windup_guard)
            self.ITerm = -self.windup_guard;
        elseif (self.ITerm > self.windup_guard)
            self.ITerm = self.windup_guard;
        end
        
        self.DTerm = 0.0;
        if delta_time > 0
            self.DTerm = delta_error / delta_time;
        end
        
        self.last_time = current_time;
        self.last_error = current_error;

        self.acceleration = self.PTerm + (self.Ki * self.ITerm) + (self.Kd * self.DTerm);
    end
end