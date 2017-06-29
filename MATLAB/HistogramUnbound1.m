%Makes a histogram for a set of data of one analyte
%set threshold and variable bin size

%Find threshold
THRESH=8.5;
%Set # of bins
NUMBINS=30;

%Find <Tunbound>s, excluding first and last interval
BoundTimes=zeros(length(Current1),1); %How long each bound interval is
BTCounter=1;
StartMark=Time(1);
EndMark=0;

%0=high/unbound, 1=low/bound
BindTrigger=0;

for m = 1:length(Current1)
    if Current1(m) < THRESH %start binding
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
