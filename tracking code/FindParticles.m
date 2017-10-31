tic;
disp('Tracking Movement');
n = 1;
greenDifs5 = squeeze(double(video(:,:,2,1:end-n)) - double(video(:,:,2,1+n:end)));
disp('Highlighting Particles');
thresholded = greenDifs5(:,:,:)>8;
disp('Finding Particle Locations');
numberOfFrames = size(thresholded,3);
Particlexyt = [0, 0, 0];
for frame = 1:numberOfFrames
    Labeled = bwlabeln(thresholded(:,:,frame));
    ParticleProperties = regionprops(Labeled,'PixelIdxList', 'PixelList','Centroid');
    TempParticlexyt = zeros(numel(ParticleProperties),3);
    TempParticlexyt(:,3) = frame;
    for i = 1:numel(ParticleProperties)
        TempParticlexyt(i,1:2) = ParticleProperties(i).Centroid;
    end
    Particlexyt = [Particlexyt; TempParticlexyt]; 
end
Particlexyt = Particlexyt(2:end,:);
figure;
scatter(Particlexyt(:,1),800-Particlexyt(:,2),10,Particlexyt(:,3));
toc;