%Makes a histogram for a set of data of one analyte
%set threshold and variable bin size

%Find threshold
THRESH=6;
%Set # of bins
NUMBINS=20;

%Find <Tbound>s, excluding first and last interval
BoundTimes=zeros(length(Current),1); %How long each bound interval is
BTCounter=1;
StartMark=0;
EndMark=0;

KeepTrigger=0;

%0=high/unbound, 1=low/bound
BindTrigger=0;
for m = 1:length(Current)
    
    if Current(m) > THRESH %High
        if BindTrigger==1  %Stop binding event
            EndMark = Time(m); %previous time stamp
            BindTrigger=0;
            %Evaluate Interval
            BoundTimes(BTCounter)=(EndMark-StartMark);
            BTCounter = BTCounter + 1;
        end
    else %Low/Bound
        if BindTrigger==0  %Start binding event
            StartMark = Time(m);
            BindTrigger=1;
        end
        
                 
    end
end

(sum(BoundTimes))/BTCounter

BoundSize = find(BoundTimes,1,'last');%relevant size of BoundTimes
IntervalLengths = (BoundTimes(1:BoundSize));%cropped vector

%Now we have an array of interval lengths

BINS=zeros(NUMBINS,1);

LongInt = max(IntervalLengths); %Longest Interval (last bin)
Binsize = LongInt/NUMBINS; %Time interval per bin

for m = 1:BoundSize
    x = IntervalLengths(m);
    BinIndex = ceil(x/Binsize);
    BINS(BinIndex)=BINS(BinIndex)+1;
end
