function plotComponentGraphs(metricTrack)
    figure;
    hold on;
    title('X and Y Position Component Graphs');
    xlabel('time (s)');
    ylabel('Displacement From Start (m)');
    plot(metricTrack(:,3),[metricTrack(:,1)-metricTrack(1,1),metricTrack(:,2)-metricTrack(1,2)]);
    legend('x-position','y-position');
end
    