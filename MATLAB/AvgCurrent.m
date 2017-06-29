%Manually set a middle point, then run to find average
%high (unblocked) current and average low (blocked)
%current

HIGH=zeros(length(Current),1);
LOW=zeros(length(Current),1);
HighCounter=1;
LowCounter=1;
for m = 1:length(Current)
    if Current(m) >8.5
        HIGH(HighCounter) = Current(m);
        HighCounter = HighCounter+1;
    else
        LOW(LowCounter) = Current(m);
        LowCounter = LowCounter+1;      
    end
end
        
Hsize = find(HIGH,1,'last')
Lsize = find(LOW,1,'last')

HIGHCropped = HIGH(1:Hsize);
LOWCropped = LOW(1:Lsize);

HighAvg = mean(HIGHCropped)
LowAvg = mean(LOWCropped)