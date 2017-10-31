%Calculates the instantaneous lift and drag forces on the seed
%Output in for Lift, Drag, time
%Uses the average and acceletation and velocity of the n data points
%following every point to estimate instataneous Lift/Drag at that point
function [LiftDrag, velocities,accelerations] = FindLiftDrag(metricTrack,n)
    mass = 1; %Mass of seed in kg, set to 1 to give lift/drag accelerations instead
    gravity = -9.8;
    %calculate instantaneous velocities and accelerations
    velocities = findVelocities(metricTrack,n);
    accelerations = FindInstantAccelerations(metricTrack,n);
    %Pre-allocate space for LiftDrag vector
    N = size(velocities,1);
    LiftDrag = zeros(N,3);
    %Fill in the time vector column
    LiftDrag(:,3) = velocities(:,3);
    for i = 1:N
        %Select the acceleration velocity vectors from this timestep
        %Vectors are column vectors in the form [x;y]
        v = velocities(i,1:2)';
        a = accelerations(i,1:2)';
        a(2) = a(2) - gravity;
        %Make unit vector parallel to v (thrust)
        Vthrust = v ./ norm(v);
        %Make unit vector perpendicular to v (lift)
        Vlift = [0, 1;-1,0] * Vthrust;
        %calculate lift and drag
        drag = -Vthrust' * a * mass;
        lift = Vlift' * a * mass;
        LiftDrag(i,1) = lift;
        LiftDrag(i,2) = drag;
    end
end