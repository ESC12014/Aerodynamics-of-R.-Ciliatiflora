% imput xyt data for a single seed in metric units of meters and seconds
% outputs series of instantaneous energies with velocities calculated using
% averaging over Nsmoothing data points
function Energies = FindEnergies(track,Nsmoothing)
    mass = 1;
    gravity = 9.8;
    velocities = findVelocities(track,Nsmoothing);
    KineticEnergies = mass * (velocities(:,1).^2+velocities(:,2).^2);
    PotentialEnergies = mass * gravity * track(1:end-Nsmoothing,2);
    TotalEnergies = KineticEnergies + PotentialEnergies;
    Energies = [KineticEnergies, PotentialEnergies, TotalEnergies];
end