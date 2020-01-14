function CoeffToVerilog( FilterCoeffs, fileName )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%The following section prints the coefficients to a text file
fileID = fopen(fileName, 'w');
VerilogCoeffs = round(FilterCoeffs .* (2^17));
% for i = 1:(length(VerilogCoeffs)-1)
%     if(i > 7)
%         if(VerilogCoeffs(i-7) >= 0)
%             fprintf(fileID, 'b[%d]', i-1 ); 
%             fprintf(fileID, ' =   18''sd%d;\n', VerilogCoeffs(i-7));   
%         else
%             fprintf(fileID, 'b[%d]', i-1 ); 
%             fprintf(fileID, ' =  -18''sd%d;\n', VerilogCoeffs(i-7) * -1);   
%         end
%     else
%         fprintf(fileID, 'b[%d]', i-1 ); 
%         fprintf(fileID, ' =   18''sd0;\n'); 
%     end
% end

for i = 1 : length(VerilogCoeffs)
    fprintf(fileID, 'b[%d]', i-1);
    fprintf(fileID, ' = 18''dsd%d;\n', VerilogCoeffs(i));
    
end

fclose(fileID);

end


