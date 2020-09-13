% This function re-organizes the FFR data from the input1 folder into four new variables
%for each subject: passivespeech, passivepiano, activespeech, activepiano
%The function is named "splitstim" because we are splitting the data based
%on the stimulus (speech or piano). The data is already split based on
%passive vs active. 
function splitstim 
files = dir('*.mat'); %look for all the .mat files under the folder
for i=1:length(files) %loop through each .mat file 
 load(files(i).name); %load the file 
 filename = files(i).name; %store name of each file
 %REORGANIZE PASSIVE DATA 
 clsList = intersect(cls,cls);
 for j = 1:length(clsList)
     idx = find(cls==clsList(j));
     temp = ffrs(idx,:);
     if j == 1
         passivespeech = temp;
     elseif j == 2
         passivepiano = temp;
     end
 end
 %Save the new matrices in the subject's .mat file
 save(filename, 'passivespeech', '-append');
 save(filename, 'passivepiano', '-append');
 
 %REORGANIZE ACTIVE DATA 
 for j = 1:length(clsList)
     idx = find(cls==clsList(j));
     temp = affrs(idx,:);
     if j == 1
         activespeech = temp;
     elseif j == 2
         activepiano = temp;
     end
 end
 save(filename, 'activespeech', '-append');
 save(filename, 'activepiano', '-append');
end
end
