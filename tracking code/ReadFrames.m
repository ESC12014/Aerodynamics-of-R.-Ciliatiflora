tic;
fileName = 'Cilia T Flora 10-9 Trial 1.mp4';
disp(['Making Video Reader for ', fileName])
v = VideoReader(fileName);
n = 1;
disp('Reading in frames:')
while hasFrame(v)
    video(:,:,:,n) = readFrame(v);
    n = n + 1;
    if mod(n,10) == 0
        disp(n);
    end
end
toc;