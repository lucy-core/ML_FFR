%This function loads all each subject's .mat file and finds the mean FFR
%for both the passive (ffrs) and active (affrs) matrices. It stores these means in new
%matrices called 'meanspassive' and 'meansactive' respectively and saves
%them to that subject's .mat file. 

function storeaverages 
files = dir('*.mat'); %look for all the .mat files under the folder
for i=1:length(files) %loop through each .mat file 
 load(files(i).name); %load the file
 filename = files(i).name; %store name of each file
 %subidnum = filename(1:3);
 %affrs = a*; 
 meanspassive = mean(ffrs); %get the means of the passive data 
 meansactive = mean(affrs); %get the means of the active data 
 save(filename, 'meanspassive', '-append'); %store the passive means in that subject's .mat file
 save(filename, 'meansactive', '-append'); %store the active means in that subject's .mat file
end
end
