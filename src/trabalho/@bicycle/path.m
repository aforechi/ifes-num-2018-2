function yy = path(obj, t, u, x0)
%path Compute path for constant inputs
%
% XF = path(TF, U) is the final state of the vehicle (3x1) from the initial
% state (0,0,0) with the control inputs U (vehicle specific).  TF is  a scalar to 
% specify the total integration time.
%
% XP = path(TV, U) is the trajectory of the vehicle (Nx3) from the initial
% state (0,0,0) with the control inputs U (vehicle specific).  T is a vector (N) of 
% times for which elements of the trajectory will be computed.
%
% XP = path(T, U, X0) as above but specify the initial state.
%
% Notes::
% - Integration is performed using ODE45.
% - The ODE being integrated is given by the deriv method of the vehicle object.
%
% See also ODE45.

    if length(t) == 1
        tt = [0 t];
    else
        tt = t;
    end

    if nargin < 4
        x0 = [0 0 0 0];
    end
    
    if ~isa(obj, "bicycle")
        error("Object is not an Bicycle.")
    end
    
    out = ode45( @(t,x) kinematics(obj, t, x, u), tt, x0);

    y = out.y';
    if nargout == 0
        plot(y(:,1), y(:,2));
        grid on
        xlabel('X'); ylabel('Y')
    else
        yy = y;
        if length(t) == 1
            % if scalar time given, just return final state
            yy = yy(end,:);
        end
    end
end