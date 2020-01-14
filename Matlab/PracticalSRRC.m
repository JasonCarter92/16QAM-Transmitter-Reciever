function [ CoeffsOut ] = PracticalSRRC %( numCoeffs, rollOff, WindowBeta )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

numCoeffs = 161;%61;
rollOff = 0.09;%0.12;
N = numCoeffs - 1;
symbolRate = 1.5625e6;
Fc = (symbolRate * 4) / 2;
Fs = 25e6;

%Generation of the SRRC Coefficients
SRRC_Coeffs = firrcos(N, Fc, rollOff, Fs, 'rolloff', 'sqrt');

%Windowing
beta = 2.3;%0.01;
Win = kaiser(numCoeffs, beta);
SRRC_Coeffs = SRRC_Coeffs .* Win';

%Headroom Scaling Variables
maxVal = 1-(2^-17);
minVal = -1;
WorstCaseInput = SRRC_Coeffs;



%Scaling the coefficients for headroom
for i = 1 : length(SRRC_Coeffs)
    if(SRRC_Coeffs(i) >= 0)
        WorstCaseInput(i) = maxVal;
    else
        WorstCaseInput(i) = minVal;
    end
end


MaxOutput = sum(SRRC_Coeffs .* WorstCaseInput);
HeadRoomScale = maxVal / MaxOutput;

CoeffsOut = SRRC_Coeffs .* HeadRoomScale;

LUTGeneration(CoeffsOut, 'PracticalPulse_LUT.txt', 0.25);


end

