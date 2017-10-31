function PlotSeedTracks(Tracks,seedNumber)
figure;
hold on;
colorbar;
if nargin < 2
    scatter(Tracks(:,1),800-Tracks(:,2),10,Tracks(:,4));
else
    poi = Tracks(:,4) == seedNumber;
    scatter(Tracks(poi,1),800-Tracks(poi,2),10,Tracks(poi,3));
end
end