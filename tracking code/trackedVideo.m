function trackedVideo(video4D,positionsxytc)
    TrackedV = VideoWriter('trackedVideo10-9Run1.avi');
    open(TrackedV);
    NoFrames = size(video4D);
    for i = 1:NoFrames
        cla
        imshow(video4D(:,:,:,i))
        hold on
        poi = positionsxytc(:,3) < i - 5;
        scatter(positionsxytc(poi,1),positionsxytc(poi,2),10,positionsxytc(poi,4));
        frameImage = getframe(gcf);
        writeVideo(TrackedV,frameImage);
    end
end