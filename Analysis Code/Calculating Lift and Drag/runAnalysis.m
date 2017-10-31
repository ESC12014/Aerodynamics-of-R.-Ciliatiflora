function [velocities, speed, cDrag, cLift] = runAnalysis(metricSeedTrack, SeedName, plotsOn,saveOn)
    if nargin < 4
        saveOn = 0;
    end
    if nargin < 3
        plotsOn = 1;
    end
    if nargin < 2
        SeedName = 'Seed';
    end
    %number timesteps over which to calculate acceleration and velocity
    n = 40;
    %Test plot of seedtrack
    if plotsOn
        figure;
        hold on;
        title(['Track of ', SeedName]);
        xlabel('X Position (m)');
        ylabel('Y Position (m)');
        scatter(metricSeedTrack(:,1),metricSeedTrack(:,2),10,metricSeedTrack(:,3));
        colorbar;
        plotComponentGraphs(metricSeedTrack);
    end
    %find raw velocities, found with differences between sucessive
    %timepoints
    velocitiesRawInstant = findVelocities(metricSeedTrack,1);
    %find velocities smoothed over n datapoints
    velocities = findVelocities(metricSeedTrack,n);
    %plot raw velocities
    if plotsOn
        plotVelocityComponentGraphs(velocitiesRawInstant)
        %plot smoothed velocities
        plotVelocityComponentGraphs(velocities)
    end
    %calculate and display average velocities
    averageVelocity = mean(velocitiesRawInstant(:,1:2))
    %calculate and display average acceletations from linear fits of the velocity graph
    slopeVxT = polyfit(velocitiesRawInstant(:,3),velocitiesRawInstant(:,1),1)
    slopeVyT = polyfit(velocitiesRawInstant(:,3),velocitiesRawInstant(:,2),1)
    %Find Accelerations
    accelerations = FindInstantAccelerations(metricSeedTrack, n);
    %plot Acceleration Graph
    if plotsOn
        plotAccelerationComponentGraphs(accelerations);
    end
    %calculate and display average acceleration (second calculation method)
    averageAcceleration = mean(accelerations(:,1:2))
    averageAccelerationDueToAir = averageAcceleration - [0 -9.8]
    %plot velocity and acceleration vectors
    if plotsOn
        plotVelocityAccelerationVectors(averageVelocity, averageAcceleration);
        plotVelocityAccelerationVectors(averageVelocity, averageAccelerationDueToAir);
    end
    %Calculate Lift and Drag
    LiftDrag = FindLiftDrag(metricSeedTrack, n);
    %Plot Lift and Drag
    if plotsOn
        plotLiftDrag(LiftDrag);
    end
    %Calculate and Display average lift and drag
    averageLiftDrag = mean(LiftDrag(:,1:2))
    %Calculate Lift and Drag Coefficients
    [LtoDratio, cLift, cDrag, time] = CoeffientsV2(metricSeedTrack, n);
    speed = sqrt(velocities(:,1).^2+velocities(:,2).^2);
    averageSpeed = mean(speed)
    if plotsOn
        %plot lift and drag coefficients
        plotLiftDragCoefficients(time, cLift,cDrag);
        plotLiftDragvSpeed(LiftDrag,speed)
    end
    %calulate and display average lift, average drag and average ratio
    averageLiftCoeffiecient = mean(cLift)
    averageDragCoeffiecient = mean(cDrag)
    averageDragToLift = mean(LtoDratio)
    
    %Save local analysis variables
    if saveOn
        save(['Data Analysis of ', SeedName,'.mat']);
    end
    
    
end