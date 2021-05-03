function Totalcalories=Calories(Time,AvgSpeed)
Sum=0;
L2=length(AvgSpeed);

for i=1:L2
Sum=Sum+AvgSpeed(i);
end
AvgSpeed=Sum/L2;
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
elseif (AvgSpeed>=11.2654&& AvgSpeed<=12.0700)
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

%The formula of burning calories
Totalcalories= ((Time/60)*MET*3.5)/(200);
return;
end