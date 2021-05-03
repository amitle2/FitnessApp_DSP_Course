function TotalSteps=StepCounter(Ttime,Xacc,Yacc,Zacc)
L=length(Ttime);

figure(1)
plot(Ttime,Xacc,Ttime,Yacc,Ttime,Zacc)
legend('X', 'Y', 'Z');
xlabel('Relative time (s)');
ylabel('Acceleration (m/s^2)');
x = Xacc(:,1);
y = Yacc(:,1);
z = Zacc(:,1);
mag = sqrt(sum(x.^2 + y.^2 + z.^2, 2));

figure(2)
plot(Ttime,mag);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
magNoG = mag - mean(mag);

figure(3)
plot(Ttime,magNoG);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
minPeakHeight = std(magNoG);

[pks,locs] = findpeaks(magNoG,'MINPEAKHEIGHT',minPeakHeight);
numSteps = numel(pks);
hold on;
figure(4)
plot(Ttime(locs), pks, 'r', 'Marker', 'v', 'LineStyle', 'none');
title('Counting Steps');
xlabel('Time (s)');
ylabel('Acceleration Magnitude, No Gravity (m/s^2)');
hold off;

TotalSteps=numSteps;
return;
end