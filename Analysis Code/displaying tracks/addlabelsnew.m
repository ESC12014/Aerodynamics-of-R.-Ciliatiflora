hold on
run = 'BB'
runvar = BB
for i=1:size(runvar,2)
    label = [run,num2str(i)];
    track = genvarname(label);
    scatter(runvar(:,1),runvar(:,2),10,runvar(:,3))
    text(runvar(size(runvar{i},1),1),runvar(size(runvar{i},1),2),label,'BackgroundColor','y');
end