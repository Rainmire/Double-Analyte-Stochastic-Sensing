%Find threshold
THRESH=8.5;
%Set # of bins
NUMBINS=20;

%Find <Tunbound>s, excluding first and last interval
BoundTimes=zeros(length(Current2),1); %How long each bound interval is
BTCounter=1;
StartMark=Time(1);
EndMark=0;

%0=high/unbound, 1=low/bound
BindTrigger=0;

for m = 1:length(Current2)
    if Current2(m) < THRESH %start binding
        if BindTrigger==0 
            EndMark = Time(m); %time stamp
            BindTrigger=1;
            %Evaluate Interval
            BoundTimes(BTCounter)=(EndMark-StartMark);
            BTCounter = BTCounter + 1;
        end
    else %start unbound event
        if BindTrigger==1  %Start binding event
            StartMark = Time(m);
            BindTrigger=0;
        end
        
                 
    end
end

(sum(BoundTimes))/BTCounter
