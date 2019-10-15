clear;
err = 0;
baseline = 4.5; % Wheels baseline (default 4.5m)
steermax = 1.22; % Maximum steering (default 0.5 radians);
accelmax = 9.5; % Tesla Model S (96Km/h em 2.8s)
dt = 1/20;
t = 0:dt:10;

trajectories;

checkpoints = eight_shaped_curve;
viapoints = get(checkpoints, 'waypoints');

car = bicycle(baseline, accelmax, steermax);

lateral_control = purepursuit(baseline, steermax, 1, 1.3);

longitudinal_control = pidcontrol(1, 1, 0.01, dt);

n = length(viapoints);
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

    err = err + abs(desired_velocity - current_velocity);

    lateral_control = update(lateral_control, current_state);
    steering = get(lateral_control, 'steering');

    longitudinal_control = update(longitudinal_control, current_time, current_velocity, desired_velocity);
    acceleration = get(longitudinal_control, 'acceleration');

    control_command = [acceleration, steering];

    [T, Y] = ode45( @(t,x) kinematics(car, t, x, control_command), [last_time current_time], current_state);
    last_state = Y(end,:);
    last_time = current_time;
end

plot(trajectory(:,1), trajectory(:,2));