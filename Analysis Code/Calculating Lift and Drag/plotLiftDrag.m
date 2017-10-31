function plotLiftDrag(LiftDrag)
    figure;
    hold on;
    title('Lift and Drag vs. Time');
    xlabel('time (s)');
    ylabel('Acceleration (m/s^2)');
    plot(LiftDrag(:,3),[LiftDrag(:,1),LiftDrag(:,2)]);
    legend('Lift','Drag');
end