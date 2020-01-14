function  OBECalcs( FilterCoeffs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f = 0:0.0001:0.5;
Fs = 6.25;
baseBandMin = 0;
baseBandMax = 0.875/Fs;
OB1Min = 0.875/Fs;
OB1Max = 1.095/Fs;
OB2Min = 1.095/Fs;
OB2Max = 2.625/Fs;
OB3Min = 2.625/Fs;
OB3Max = 4.395/Fs;

baseBand = f(f>=baseBandMin & f<baseBandMax);
OB1 = f(f>=OB1Min & f<OB1Max);
OB2 = f(f>=OB2Min & f<OB2Max);
OB3 = f(f>=OB3Min & f<OB3Max);

w = 2*pi*f;

[MagResponce, omega] = freqz(FilterCoeffs, 1, w);
MagResponce = abs(MagResponce).^2;

baseResponce = MagResponce(f>=baseBandMin & f<baseBandMax);
OB1Responce = MagResponce(f>=OB1Min & f<OB1Max);
OB2Responce = MagResponce(f>=OB2Min & f<OB2Max);
OB3Responce = MagResponce(f>=OB3Min & f<OB3Max);
% baseResponce = freqz(FilterCoeffs, 1, baseBand);
% OB1Responce = freqz(FilterCoeffs, 1, OB1);
% OB2Responce = freqz(FilterCoeffs, 1, OB2);
% OB3Responce = freqz(FilterCoeffs, 1, OB3);

% baseResponce = 10*log(abs(baseResponce).^2);
% OB1Responce = 10*log(abs(OB1Responce).^2);
% OB2Responce = 10*log(abs(OB2Responce).^2);
% OB3Responce = 10*log(abs(OB3Responce).^2);
% 
%  baseResponce = 10*log10(abs(baseResponce).^2);
%  OB1Responce = 10*log10(abs(OB1Responce).^2);
%  OB2Responce = 10*log10(abs(OB2Responce).^2);
%  OB3Responce = 10*log10(abs(OB3Responce).^2);
%  MagResponce = 10*log10(abs(MagResponce).^2);


hold on
plot(baseBand, baseResponce, 'b')
plot(OB1, OB1Responce, 'g')
plot(OB2, OB2Responce, 'r')
plot(OB3, OB3Responce, 'm')
%plot(f, MagResponce);

basePower = 10*log10(sum(baseResponce));
OB1Power = 10*log10(sum(OB1Responce));
OB2Power = 10*log10(sum(OB2Responce));
OB3Power = 10*log10(sum(OB3Responce));

OB1PowerSpec = basePower - OB1Power;
OB2PowerSpec = basePower - OB2Power;
OB3PowerSpec = basePower - OB3Power;


fprintf('BaseBand Power: %f\n', basePower);
fprintf('OB1 Power: %f\n', OB1Power);
fprintf('OB1 Power: %f\n', OB2Power);
fprintf('OB1 Power: %f\n', OB3Power);

fprintf('OB1 Power in reference to the signal power: %f\n', OB1PowerSpec);
fprintf('OB2 Power in reference to the signal power: %f\n', OB2PowerSpec);
fprintf('OB3 Power in reference to the signal power: %f\n', OB3PowerSpec);


end

