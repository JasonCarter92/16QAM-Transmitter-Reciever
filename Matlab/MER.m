function [MEROut] = MER( FilterCoeffsA, FilterCoeffsB )
%Calculates the MER of two cascaded filters given by their coefficients
%   Detailed explanation goes here

    Denominator = 0;

   % IdealResponse = [0, 0, 0, conv(FilterCoeffsA, FilterCoeffsB)];
    IdealResponse = conv(FilterCoeffsA, FilterCoeffsB);
    %IdealResponse =   conv(FilterCoeffsA, FilterCoeffsB);
    %figure(1)
    %stem(FilterCoeffsA)
    
    %figure(2)
    %stem(FilterCoeffsB)
    %hold on
    %plot(1:1:length(IdealResponse), IdealResponse)
    
    Numerator = max(IdealResponse)^2; %Numerator of the MER Equation
    center = find(IdealResponse == max(IdealResponse));
    for i = 1:length(IdealResponse)
        remainder = mod(center - i, 4);
        if(remainder == 0 && i ~= center)
            Denominator = Denominator + IdealResponse(i)^2;    
        end
        
    end
    
    MEROut = 10*log10(Numerator/Denominator);
    
end

