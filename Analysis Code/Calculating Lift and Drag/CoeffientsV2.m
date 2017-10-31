function [LtoDratio, cLift, cDrag, time] = CoeffientsV2(metricTrack, n)
%COEFFIENTSV2 Calculate Lift and Drag Coefficients by assuming V^2 model
%   Returns vectors with the coeffiecents of lift and drag calulated at
%   for various timepoints
[LiftDrag, velocities] = FindLiftDrag(metricTrack,n);
Lift = LiftDrag(:,1);
Drag = LiftDrag(:,2);
time = LiftDrag(:,3);
speedsquared = velocities(:,1).^2 + velocities(:,2).^2;
cLift = Lift ./ speedsquared;
cDrag = Drag ./ speedsquared;
LtoDratio = cLift ./ cDrag;
end

