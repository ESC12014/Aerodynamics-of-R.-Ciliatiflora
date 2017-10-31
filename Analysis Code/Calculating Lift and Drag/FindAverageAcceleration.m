%Uses quadradic fits of x vs. t and y vs. t to find the average
%acceleration vector of the seed over the data set

function acceleration = FindAverageAcceleration(metricTrack)
    cxt = polyfit(metricTrack(:,3),metricTrack(:,1),2);
    xAcceleration = cxt(1)*2;
    cyt = polyfit(metricTrack(:,3),metricTrack(:,2),2);
    yAcceleration = cyt(1)*2;
    acceleration = [xAcceleration, yAcceleration];
end
