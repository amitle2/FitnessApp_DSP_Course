 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAIN
%% Data From Sensors
load 600-100.mat
%% Details Of Our Data
Xacc = Acceleration.X;
Yacc = Acceleration.Y;
Zacc = Acceleration.Z;
Climbing=Position.altitude;
AvgSpeed=Position.speed;
Tacc=Acceleration.Timestamp;
Ttime= timeElapsed(Tacc);
L=length(Ttime);
L1=length(AvgSpeed);
%% Data Of Our Client
Height = input('Please Insert your height (in cm) 
?\n') ;
Weight = input('Please Insert your weight (in kg) 
?\n') ;
Height= Height*10e-3;%[m]
Gender = input('1 you are man O you are Woman ?\n') ;
while(Gender~=1 && Gender~=0)
 Gender = input('Your reponse is not correct 
\nPlease Insert 0 for man 1 for woman\n');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Step Counter
TotalSteps=StepCounter(Ttime,Xacc,Yacc,Zacc);
disp('Your Steps:');
disp(TotalSteps);
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Route counter/Distance
if Gender==1
Route_man=TotalSteps*(Height*0.415);%m
disp('Total Distance is:');
disp(Route_man);8
else
Route_woman=TotalSteps*(Height*0.413);%m
disp('Total Distance is:');
disp(Route_woman);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Burned Calories
Totalcalories=Calories(L1,AvgSpeed);%The function 
calculating Calories without Weight.
Totalcaloriesburned=Totalcalories*Weight;
disp('Total calories burned:');
disp(Totalcaloriesburned);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Time counter
TimeTraining=Ttime(L,1);
disp('Trainig Time:');
disp(TimeTraining);
%%%%%%%%%%%%%%%%%% StepCounter 
function TotalSteps=StepCounter(Ttime,Xacc,Yacc,Zacc)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%% Fourier
L=length(magNoG);
X=fft(magNoG,L);
Y=abs(X);
figure(3)9
nexttile
plot(0:L-1,Y)
xlabel('k')
ylabel('x[k]')
[pks,locs]=findpeaks(Y);
[maxpks,idx] = maxk(pks,1);
StepCounter = locs(idx)-1;
TotalSteps=StepCounter;
return;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%% Calories 
function Totalcalories=Calories(Time,AvgSpeed)
Sum=0;
Lavgspeed=length(AvgSpeed);
for i=1:Lavgspeed
Sum=Sum+AvgSpeed(i);
end
AvgSpeed=Sum/Lavgspeed;
MET=0;
if AvgSpeed<=3.218
 MET=1;
elseif (AvgSpeed>=3.218 && AvgSpeed<=4.023)
 MET=2.5;
elseif (AvgSpeed>=4.023&& AvgSpeed<=4.8280)
 MET=3;
elseif (AvgSpeed>=4.8280&& AvgSpeed<=5.633)
 MET=3.5;
elseif (AvgSpeed>=5.633&& AvgSpeed<=6.438)
 MET=4;
elseif (AvgSpeed>=6.43&& AvgSpeed<=8.048)
 MET=4.5;
elseif (AvgSpeed>=8.048&& AvgSpeed<=8.3685)
 MET=8;
elseif (AvgSpeed>=8.3685&& AvgSpeed<=9.6560)
 MET=9;
elseif (AvgSpeed>=9.6560&& AvgSpeed<=10.7826)
 MET=10;
elseif (AvgSpeed>=10.7826&& AvgSpeed<=11.2654)
 MET=11;
elseif (AvgSpeed>=11.2654&& AvgSpeed<=12.0700)10
 MET=11.5;
elseif (AvgSpeed>=12.0700&& AvgSpeed<=12.874)
 MET=12.5;
elseif (AvgSpeed>=12.874&& AvgSpeed<=13.8403)
 MET=13.5;
elseif (AvgSpeed>=13.8403&& AvgSpeed<=14.0484)
 MET=14;
elseif (AvgSpeed>=14.0484&& AvgSpeed<=16.093)
 MET=15;
elseif (AvgSpeed>=16.093&& AvgSpeed<=17.541)
 MET=16;
elseif AvgSpeed > 17.541
 MET=18;
end
%%%%%%%%%%%%%%%%%%%%%%%%%% The formula of burning calories
Totalcalories= ((Time/60)*MET*3.5)/(200);
return;
end
%%%%%%%%%%%%%%%%%%%%%% TEMP 
function [Heures,Minutes,Secondes] = Temps(Ttime)
L=length(Ttime)
TimeTraining=Ttime(L,1);
Tsecondes=mod(TimeTraining,60)
Tsecondesaff = round(Tsecondes)
Tmin=(TimeTraining-Tsecondes)/60;
Trestehours=mod(Tmin,60)
Thours=(Trestehours-Tmin)/60;
Secondes = Tsecondesaff;
Minutes = Tmin;
Heures = Thours;
end11
%%%%%%%%%%%%%%%%%% Distance
function TotalDistance = 
distance(TotalSteps,Height,Gender)
Height= Height*10e-3
if Gender==1
Route_man=TotalSteps*(Height*0.415);%m
TotalDistance = Route_man
else if Gender == 0
Route_woman=TotalSteps*(Height*0.413);%m
TotalDistance = Route_woman
 end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Meters to Km
TotalDistance = TotalDistance/1000
end
%%%%%%%%%%%%%%%%%%%%%%% GPSposition
function GPS = GPSposition (latitude,longitude)
figure('Name',' GPS Position ','NumberTitle','off')
plot(latitude, longitude, '-
b',latitude(1),longitude(1),'*g',latitude(end),longit
ude(end),'*r','LineWidth',2, 'MarkerSize',10 );
return;
end
%%%%%%%%%%%%%%%SpeedCounter
function [SpeedMax,AverageSpeed] = 
SpeedCounter(Speed)
L=length(Speed)
SAverageSpeed=0;
SpeedMax=0
for i=1:L
 if(Speed(i)>SpeedMax)
 SpeedMax=Speed(i);
 end
SAverageSpeed=SAverageSpeed+Speed(i);
 
end
SpeedMax=SpeedMax*3.6
AverageSpeed=(SAverageSpeed/L)*3.6;
end
