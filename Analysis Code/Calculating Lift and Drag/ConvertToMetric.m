%Input the tracked seeds in the form xytn
%Returns single seed track in the form xyt
function metricSeedTrack = ConvertToMetric(Tracks,metersPerPx, framesPerSecond,seedNumber)
Tracks(:,2) = 800 - Tracks(:,2);
if nargin < 4
    poi = Tracks(:,4) > 0;
else
    poi = Tracks(:,4) == seedNumber;
end
metricSeedTrack(:,1:2) = Tracks(poi,1:2) * metersPerPx;
metricSeedTrack(:,3) = Tracks(poi,3) / framesPerSecond;
if nargin < 4
    metricSeedTrack(poi,4) = Tracks(poi,4);
end
end