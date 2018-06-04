clear all
close all
clc

sPrim = [1045 1040 1040;
    1110 1120 1110;
    1155 1150 1160;
    1000 1005 1000;
    1070 1070 1065;]

M = [10 10 10.2;
    10.7 11 10.9;
    11.5 11.5 11.3;
    9.5 9.7 9.5;
    10.5 10 10]

i = 1;
while i<6
    sPrimStreck(i,1) = mean(sPrim(i,:));
    MStreck(i,1) = mean(M(i,:));
    i = i+1;
end

%  f = s´/(M+1)
i = 1;
while i<6
    f(i,1) = sPrimStreck(i,1)/ (MStreck(i,1)+1);
    i = i+1;
end
f = f

dS = (sPrim-sPrimStreck).^2;
dM = (M-MStreck).^2;

i = 1;
while i<6
    deltaSPrim(i,1) = (1/3)*sqrt(sum(dS(i,:)));
    deltaM(i,1) = (1/3)*sqrt(sum(dM(i,:)));
    i = i+1;
end

relativFelSPrim = deltaSPrim./sPrimStreck
relativFelM = deltaM./MStreck
relativFelF = relativFelSPrim + relativFelM

p = polyfit(sPrimStreck,MStreck,1);
f = polyval(p,sPrimStreck);

plot(sPrimStreck,f)
hold on
plot(sPrim,M,'*')
xlabel('Bildavstånd [mm]')
ylabel('Förstoring')


