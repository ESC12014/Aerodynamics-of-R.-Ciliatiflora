function plotLiftDragCoefficients(time, liftCoefficients, dragCoefficients)
    figure;
    hold on;
    title('Lift and Drag Coefficients vs. Time');
    xlabel('time (s)');
    ylabel('Coefficient (m^-1)');
    plot(time,[liftCoefficients,dragCoefficients]);
    legend('Lift','Drag');
end