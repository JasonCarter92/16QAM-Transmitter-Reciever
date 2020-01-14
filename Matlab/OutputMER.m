%This Script Checks the MERS of the Filters
GoldStandardPulse = MER(GoldStandardGen, GoldStandardGen);
fprintf('Gold Stardard Pulse Shaping MER: %f\n', GoldStandardPulse);

GoldStandardMatched = MER(GoldStandardGen, GoldStandardGen);
fprintf('Gold Stardard Matched MER: %f\n', GoldStandardMatched);

PracticalPulse = MER(PracticalSRRC, GoldStandardGen);
fprintf('Practical Pulse Shaping MER: %f\n', PracticalPulse);