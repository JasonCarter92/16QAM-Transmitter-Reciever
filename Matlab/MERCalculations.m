%for q = [17 : 2 : 151]

    %Generate values for MER based on filter values.
%     RCVCoeffs = GoldStandardGen(i);
    TXCoeffs = GoldStandardGen;
    Denominator = 0;

    %IdealResponse = RCVCoeffs.*TXCoeffs;
    %IdealResponse = conv(TXCoeffs, RCVCoeffs);
    IdealResponse = conv(TXCoeffs, TXCoeffs);

    Numerator = max(IdealResponse)^2; %Numerator of the MER Equation
    center = (length(IdealResponse) + 1)/2;
    %Numerator = (IdealResponse(center))^2
    for i = 1:length(IdealResponse)

        remainder = mod(center - i, 4);
        if(remainder == 0 && i ~= center)
            %display('Hello ', num2str(i))
            Denominator = Denominator + IdealResponse(i)^2;
        end
    end
    MER = 10*log10(Numerator/Denominator);
    if MER > 50 
        display('Ideal MER')
        %display(num2str(q))
        display(num2str(MER))
    end
%end