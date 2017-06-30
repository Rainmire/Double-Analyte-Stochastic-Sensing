%From the data, it appears every sample begins with unbound and ends with
%bound, so # of bound events = # unbound events
%TotTunbound = TotTime - TotTbound - (First + last interval)
%Find (First+last interval)

%manually set THRESH
%THRESH=6;
THRESH=8.5;

StartTimer=0;
EndTimer=0;
L = length(Time);
TotTime = (Time(L)-Time(1));
for m = 1:L
    if Current(m) < THRESH %First counted binding interval
        StartTimer = Time(m);
        break;
    end
end
for m = L:-1:1
    if Current(m) > THRESH %Last counted unbinding inteval
        EndTimer = Time(m);
        break;
    end
end

%Find <Tbound>, excluding first and last interval

BoundTimes=zeros(length(Current),1); %How long each bound interval is
BTCounter=1;
StartMark=0;
EndMark=0;

%0=high/unbound, 1=low/bound
Trigger=0;
for m = 1:length(Current)
    if Current(m) > THRESH %High
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

%calculate <Tunbound>
%TotTunbound = TotTime - TotTbound - (First + last interval)
%Tunbound = TotTunbound/BTCounter

Tunbound = (TotTime - (sum(BoundTimes)) - (StartTimer - Time(1)) - (Time(L)-EndTimer))/BTCounter
    