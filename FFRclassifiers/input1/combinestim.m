%This function takes the activespeech and passivespeech and concatenates
%the matrices to make one large matrix called 'speech'. It also creates a
%column vector called 'spclasses' for speech classes to specify which rows
%correspond to the passive condition (coded as the number 1) and which rows
%corresopnd to the active condition (coded as the number 2). It does the
%same thing for the piano data. In this case, the large matrix will be
%named 'piano' and the column vector will be call 'pnclasses'

function combinestim
files = dir('*.mat'); %look for all the .mat files under the folder
for i=1:length(files) %loop through each .mat file 
 load(files(i).name); %load the file 
 filename = files(i).name; %store name of each file
 
 %SPEECH DATA
 %get the size of passivespeech and activespeech
 %psrows stands for passivespeech rows, pscolumns stands for passivespeech
 %columns
 [psrows, pscolumns] = size(passivespeech);
 %asrows stands for activespeech rows, ascolumns stands for activespeech
 %columns
 [asrows, ascolumns] = size(activespeech);
 %create large matrix with only speech data
 speech = [passivespeech;activespeech];
 %create column vector specifying which rows are passive and which are
 %active in two steps
 spones = ones(psrows,1); %create column vector of ones
 sptwos = ones(asrows,1) + 1; %create column vector of twos 
 spclasses = [spones;sptwos]; %stack the column vectors 
 %save variables 'speech' and 'spclasses'
 save(filename,'speech','-append');
 save(filename,'spclasses','-append');
 
 %PIANO DATA
 %get the size of passivepiano and activepiano
 %pprows stands for passivepiano rows, ppcolumns stands for passivepiano
 %columns
 [pprows, ppcolumns] = size(passivepiano);
 %aprows stands for activepiano rows, apcolumns stands for activepiano
 %columns
 [aprows, apcolumns] = size(activepiano);
 %create large matrix with only piano data
 piano = [passivepiano;activepiano];
 %create column vector specifying which rows are passive and which are
 %active in two steps
 ppones = ones(pprows,1); %create column vector of ones
 pptwos = ones(aprows,1) + 1; %create column vector of twos 
 pnclasses = [ppones;pptwos]; %stack the column vectors 
 %save variables 'piano' and 'ppclasses'
 save(filename,'piano','-append');
 save(filename,'pnclasses','-append');
  
end
end

 
 