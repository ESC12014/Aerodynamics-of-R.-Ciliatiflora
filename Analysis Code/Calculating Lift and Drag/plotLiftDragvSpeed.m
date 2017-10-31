function plotLiftDrag(LiftDrag,speed)
    figure;
    hold on;
    title('Lift and Drag vs. Speed');
    xlabel('speed (m/s)');
    ylabel('Acceleration (m/s^2)');
    plot(speed(:,1),[LiftDrag(:,1),LiftDrag(:,2)]);
    legend('Lift','Drag');
end