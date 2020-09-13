function fouraverages
files = dir('*.mat'); %look for all the .mat files under the folder
for i=1:length(files) %loop through each .mat file 
 load(files(i).name); %load the file
 filename = files(i).name; %store name of each file
 %for each 