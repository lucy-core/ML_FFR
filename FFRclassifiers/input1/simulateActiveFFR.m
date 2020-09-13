

%This function takes the FFR matrix called 'passive' (use the ffrs matrix from 
%the subject's .mat file) and creates a new matrix called 'active' that 
%simulates the values of the FFR had it been collected while particpants were 
%producing the sounds (active) rather than listening to them (passive) 

function [active] = simulateActiveFFR (passive)
%get the size of the matrix 'passive', store the size of the 'passive'
%matrix in the variables 'prows' and 'pcols'
%p stands for passive; prows is the number of rows in the 'passive' matrix
%pcols is the number of columns in the 'passive' matrix 
[prows, pcols] = size(passive);
%declaring the output matrix 'active', initialize it with an array of zeros
%(will get updated later) that is the same size as the 'passive' matrix
active = zeros(prows,pcols);
%generate random array called 'randmat' that has the same number of elements as
%rows in the 'passive' FFR matrix 
mean = 1.08768;
stdev = 1.00693;
%This is a random seed. It ensures that every time the function is run, the
%same set of random numbers are generated. 
rng(0);
%calculate random matrix with values from a Gaussian distribution where the
%mean and st dev are the numbers above 
randmat = stdev.*(randn(prows,1)+mean)
%hist(randmat);
%randmat = [1;2;3];
%loop through elements of the matrix 'passive' 
%looping through all rows of 'passive', r refers to which row of 'passive'
%you are on
for r = 1:prows
    %loop through all columns of 'passive', c refers to which column of
    %'passive' you are on
    for c = 1:pcols
     %all elements of row r in the 'passive' matrix are multiplied by the single 
     %element in row r of the 'randmat' matrix
     new = passive(r,c)*randmat(r,1);
     %adding the 'new' element to the 'active' matrix in the same position that we are in
     %for the 'passive' matrix 
     active (r,c) = new;
    end
end
%hist(active);

