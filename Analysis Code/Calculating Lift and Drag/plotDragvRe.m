function plotDragvRe(velocities,cDrag) 
figure;
hold on;
Re=sqrt(velocities(:,1).^2+velocities(:,2).^2)*160;
title('Drag vs. Re');
    xlabel('Re');
    ylabel('Drag coefficient');
    plot(Re(:),cDrag(:));
   


end

