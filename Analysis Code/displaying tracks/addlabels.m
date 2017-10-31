hold off
imshow(video(:,:,:,450))
hold on
run = 'AA';
runvar = AA;
for i=1:size(runvar,2)
    label = [run,num2str(i)];
    track = genvarname(label);
    scatter(runvar{i}(:,1),runvar{i}(:,2),10,runvar{i}(:,3))
    text(runvar{i}(size(runvar{i},1),1),runvar{i}(size(runvar{i},1),2),label,'BackgroundColor','y');
end
% run = 'AAR';
% runvar = AAR;
% for i=1:size(runvar,2)
%     label = [run,num2str(i)];
%     track = genvarname(label);
%     scatter(runvar{i}(:,1),runvar{i}(:,2),10,runvar{i}(:,3))
%     text(runvar{i}(size(runvar{i},1),1),runvar{i}(size(runvar{i},1),2),label,'BackgroundColor','y');
% end