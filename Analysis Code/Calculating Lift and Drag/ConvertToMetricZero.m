function zeroedMetricSeedTrack = ConvertToMetricZero(Tracks,metersPerPx, framesPerSecond)
%Invert so the positive y is up
Tracks(:,2) = 800 - Tracks(:,2);
%Columns 1,2 are x,y respectively in meters
metricSeedTrack(:,1:2) = Tracks(:,1:2) * metersPerPx;
%Column 3 is time in seconds
metricSeedTrack(:,3) = Tracks(:,3) / framesPerSecond;
%Set t0 = x0 = y0 = 0, and translate into txy 
zeroedMetricSeedTrack(:,1) = metricSeedTrack(:,1) - metricSeedTrack(1,1);
zeroedMetricSeedTrack(:,2) = metricSeedTrack(:,2) - metricSeedTrack(1,2);
zeroedMetricSeedTrack(:,3) = metricSeedTrack(:,3) - metricSeedTrack(1,3);
end