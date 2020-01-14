%This function will generate the coefficients to be used in the Gold
%Standart Pulse shaping filer (Transmitter Filter) and the Gold Standard
%Matched filter (Reciever filter). 

%NOTE: The gold standard filters are not to be windowed

%NOTE: that the Pulse Shaping filter will be implemented with LookUpTables
%And the Matched filter will be implemented with multipliers

function [CoeffsOut] = GoldStandardGen

%Filter Specifications
numCoeffs = 129;
rollOff = 0.12;
N = numCoeffs - 1;
symbolRate = 1.5625e6;
Fc = (symbolRate * 4) / 2;
Fs = 25e6;

%Generation of the SRRC Coefficients
SRRC_Coeffs = firrcos(N, Fc, rollOff, Fs, 'rolloff', 'sqrt');

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

CoeffToVerilog(CoeffsOut, 'SRRC_Coeffs_Verilog.txt');
LUTGeneration(CoeffsOut, 'GoldStandardPulseLUT.txt', 0.25);

end