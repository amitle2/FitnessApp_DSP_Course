clear

%% Data From Sensors
load('abcde.mat');

%% Details Of Our Data
Xacc = Acceleration.X;
Yacc = Acceleration.Y;
Zacc = Acceleration.Z;

Climbing=Position.altitude;

AvgSpeed=Position.speed;

Tacc=Acceleration.Timestamp;
Ttime= timeElapsed(Tacc);

L=length(Ttime);
L1=length(Climbing);
L2=length(AvgSpeed);

%% Data Of Our Client
Height = input('Insert height (in cm) ?\n') ;
Weight = input('Insert weight (in kg) ?\n') ;
Height= Height*10e-3;%[m]

Gender = input('1 for man O for Woman ?\n') ;
while(Gender~=1 && Gender~=0)
    Gender = input('Your reponse is not correct \nInsert 0 for man 1 for woman\n');
end

%% Step Counter
TotalSteps=StepCounter(Ttime,Xacc,Yacc,Zacc);

%% Stairs Counter
StairsClaimbed=Stairs(Climbing);

%% Route counter/Distance
if Gender==1
Route_man=TotalSteps*(Height*0.415);%m
else
Route_woman=TotalSteps*(Height*0.413);%m
end

%% Burned Calories
Totalcalories=Calories(L2,AvgSpeed);%The function calculating Calories without Weight.

Totalcaloriesburned=Totalcalories*Weight;

%% Time counter
TimeTraining=Ttime(L,1);