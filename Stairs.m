function StairsClaimbed=Stairs(Climbing)
sum1=0;
L1=length(Climbing);
for i= 1:(L1-1)
if Climbing (i+1)>=(0.016+Climbing(i))
   sum1=sum1+1;
else
   sum1=sum1+0;
end
end

StairsClaimbed=sum1;
return;
end
