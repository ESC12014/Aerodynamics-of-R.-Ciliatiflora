function plotAccelerationComponentGraphs(metricAccelerations)
    figure;
    hold on;
    title('X and Y Acceleration Component Graphs');
    xlabel('time (s)');
    ylabel('Acceleration (m/s^2)');
    plot(metricAccelerations(:,3),[metricAccelerations(:,1),metricAccelerations(:,2)]);
    legend('x-acceleration','y-acceleration');
end