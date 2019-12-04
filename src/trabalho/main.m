function trajectory = main(x, dt, baseline, accelmax, steermax, lookahead, viapoints)

    checkpoints = waypoints(viapoints);

    car = bicycle(baseline, accelmax, steermax);

    lateral_control = purepursuit(baseline, steermax, lookahead);

    velocity_control = pidcontrol(1, 1, 0.01, dt);

    trajectory = [];
    last_state = x;
    last_time = 0;

    while true
        current_state = last_state;
        current_time = last_time + dt;
        trajectory = [trajectory; current_state];

        checkpoints = waypoint_velocity(checkpoints, current_state);
        lateral_control = set(lateral_control, 'waypoints', checkpoints);

        if finished(checkpoints)
            break;
        end
        current_velocity = current_state(4);    
        desired_velocity = get(checkpoints, 'velocity');

        lateral_control = update(lateral_control, current_state);
        steering = get(lateral_control, 'steering');

        velocity_control = update(velocity_control, current_time, current_velocity, desired_velocity);
        acceleration = get(velocity_control, 'acceleration');

        control_command = [acceleration, steering];

        [T, Y] = ode45( @(t,x) kinematics(car, t, x, control_command), [last_time current_time], current_state);
        last_state = Y(end,:);
        last_time = current_time;
    end

end