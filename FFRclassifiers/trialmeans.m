%Function finds the mean of each row (trial) in the inputted matrix
%The inputted matrix will be either a101 (active for subject 101) or ffrs
%(passive for the corresponding subject) from the subject's .mat file

function meansarray = trialmeans (amplitudes)
%get the size (# of rows and columns) of the inputted matrix of data points
%called "amplitudes"  
[rows,columns]= size(amplitudes); 
%create meansarray with zeros that has the same number of rows that the
%inputted matrix 'amplitudes' does. (The elements will be updated later) 
meansarray = zeros(r,1);
%loop through the rows of the 'raw' matrix, r refers to which row of 'amplitudes'
%you are on 
for r = 1:rows
  