function plotVelocityComponentGraphs(metricVelocities)
    figure;
    hold on;
    title('X and Y Velocity Component Graphs');
    xlabel('time (s)');
    ylabel('Velocity (m/s)');
    plot(metricVelocities(:,3),[metricVelocities(:,1),metricVelocities(:,2)]);
    legend('x-velocity','y-velocity');
end