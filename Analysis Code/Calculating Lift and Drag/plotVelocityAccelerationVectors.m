%input two 1x2 row vectors for velocity and Acceleration
function plotVelocityAccelerationVectors(Velocity, Acceleration)
    figure;
    hold on;
    title('Average Acceleration and Velocity Vectors')
    plot([0, Velocity(1)],[0,Velocity(2)]);
    plot([0, Acceleration(1)],[0,Acceleration(2)]);
    legend('velocity','acceleration');
end