%Find <Tbound>, excluding first and last interval

BoundTimes=zeros(length(Current),1); %How long each bound interval is
BTCounter=1;
StartMark=0;
EndMark=0;

%0=high/unbound, 1=low/bound
Trigger=0;
for m = 1:length(Current)
    if Current(m) >8.5 %High
        if Trigger==1  %Stop binding event
            EndMark = Time(m); %previous time stamp
            Trigger=0;
            %Evaluate Interval
            BoundTimes(BTCounter)=(EndMark-StartMark);
            BTCounter = BTCounter + 1;
        end
    else %Low/Bound
        if Trigger==0  %Start binding event
            StartMark = Time(m);
            Trigger=1;
        end
        
                 
    end
end
       
%(sum(BoundTimes))/BTCounter
(sum(BoundTimes))/(Time(length(Time))-Time(1))
