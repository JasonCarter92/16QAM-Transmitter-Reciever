function LUTGeneration( FilterCoeffs, fileName, referencePoint )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

a = referencePoint;
ASKVals = [-3*a, -1*a, a, 3*a];

fileID = fopen(fileName, 'w');
for CoeffCounter = 1:length(FilterCoeffs)
   fprintf(fileID, 'always @ *\n'); 
   fprintf(fileID, '\tcase(xDelay[%d])\n', CoeffCounter-1);
   for ASKCounter = 1:length(ASKVals)
       LUTVal = round((FilterCoeffs(CoeffCounter) * ASKVals(ASKCounter)) * 2^17);
       fprintf(fileID, '\t   2''d%d: \n', ASKCounter);
       if(LUTVal < 0)
            fprintf(fileID, '\t      hOut[%d] = -18''sd', (CoeffCounter)-1);
            fprintf(fileID, '%d;\n', LUTVal*-1); 
       else
           fprintf(fileID, '\t      hOut[%d] = 18''sd', (CoeffCounter)-1);
            fprintf(fileID, '%d;\n', LUTVal); 
       end
   end
   fprintf(fileID, '\tendcase\n');
   fprintf(fileID, '\n');
end
fclose(fileID);


end

