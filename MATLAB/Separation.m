BOUND1 = 2.0005;
BOUND2 = 6.9989;
UNBOUND = 9.9994;
L = length(Time);
TimeIncr = 5.0E-4;

Current1raw = zeros(L,1);
Current2raw = zeros(L,1);

Index1 = 1;
Index2 = 1;

for m = 1:L
    c = Current(m);
    if (abs(c-BOUND1)<abs(c-BOUND2) && abs(c-BOUND1)<abs(c-UNBOUND))
        %assign to 1
        Current1raw(Index1) = c;
        Index1 = Index1 + 1;
    elseif (abs(c-BOUND2)<abs(c-BOUND1) && abs(c-BOUND2)<abs(c-UNBOUND))
        %assign to 2
        Current2raw(Index2) = c;
        Index2 = Index2 + 1;
    else
        %assign to both
        Current1raw(Index1) = c;
        Index1 = Index1 + 1;
        Current2raw(Index2) = c;
        Index2 = Index2 + 1;
    end
end

Current1 = Current1raw(1:find(Current1raw,1,'last'));
Current2 = Current2raw(1:find(Current2raw,1,'last'));
Time1 = Time(1:length(Current1));
Time2 = Time(1:length(Current2));
            