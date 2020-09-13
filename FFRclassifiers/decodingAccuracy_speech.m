% basics

    close all
    %clear all

    pathin = 'results_speech_48/';
    %pathin = 'results/';
    chance = 0.50;
    
% arrange results


    %go to the results folder and finds all .mat files that were generated
    %by main_passact.m, creates a struct called 'subs' with this file info
    subs = dir([pathin,'*.mat']); 
    
    for i=1:length(subs) %loops through all .mat files in the results folder 

      sub = subs(i).name; %defines sub as the field called 'name' in the subs struct

      infos = regexp(sub,'[0-9]*','match'); %extracts the file name info and stores it in a cell array 

      %extracts just the subject number (e.g. 101) which is the first element 
      %of the infos cell array 
      subids(i) = str2double(infos{1}); 
      
      %defines totssizes as the number of trials specified in the
      %title of the .mat file, corresponds to infos{3}
      totsizes(i) = str2double(infos{3});

      load([pathin,sub]); %loads each subject's .mat file that is in the results folder one at a time
     
      %Define the variable cp as the output of the classperf function. 
      %This function uses the rcls and pcls variables in each subject's .mat file to get
      %the classifier performance (i.e. decoding accuracy) for that
      %subject and that number of trials/sample size 
      %This function has many different outputs.
      cp = classperf(rcls,pcls);  
      
      %Here, we are only interested in the ouput CorrectRate   
      %Define crates as a row vector where each value is the overall decoding accuracy (for all k-folds) 
      %for one subject (There is one value for each subject for each of the 7 sample sizes) 
      %crates is a row vector that has 182 columns (26 subjects x 7 sample sizes = 182) 
      crates(i) = cp.CorrectRate;
      
      %getting the number of times the HMM correctly classified the passive
      %trials and active trials 
      cpassive(i) = cp.PositivePredictiveValue;
      cactive(i) = cp.NegativePredictiveValue;
      
    end
    %for every column that contains the value 500 (or 2000) in 'totsizes', we want
    %the corresponding element in those rows in 'cpassive' and 'cactive' 
    %use this as a sanity check to ensure the sample sizes listed in totssizes are arranged in a pattern 
    

%finds all of the columns where the element in totsizes is 500
%[~,cols500] = find(totsizes == 500);

%finds all of the columns where the element in totsizes is 2000
%[~,cols2000] = find(totsizes == 2000)

%takes every 7th element starting at the 7th element of cpassive/cactive and stores it in a new array
%every 7th element corresponds to the column where there is a 500 in totsizes 
 corrpass500 = cpassive(7:7:end); 
 corract500 = cactive(7:7:end);
 crates500_speech = crates(7:7:end);

%takes every 7th element starting at the 7th element of cpassive/cactive and stores it in a new array
%every 7th element corresponds to the column where there is a 2000 in totsizes 
 corrpass2000 = cpassive(4:7:end); 
 corract2000 = cactive(4:7:end);
 crates2000_speech = crates(4:7:end);


%T-test for sample size 500
[H,P,CI, STATS] = ttest(corrpass500,corract500)

%T-test for sample size 2000
%[H,P,CI, STATS] = ttest(corrpass2000,corract2000)
    
    

%     % plot results overall correct rate
% 
%     %totList is a row vector with the 7 sample sizes (50, 100, 200, 500, 1000, 1500, 2000)
%     %(repeated 26 times, one for each subject)
%     %The row vector will have the following dimensions: 1x182
%     totList = intersect(totsizes,totsizes);
%     
%     condList = intersect(spclasses,spclasses); 
%    
% 
%     figure;
%     
%      for i=1:length(totList)
%             
%             %idx corresponds to the sample size numbers (what is on the
%             %x-axis of our plot)
%             %idx = find(spclasses==condList(j) & totsizes==totList(i));
%             idx = find(totsizes == totList(i));
%             %find the zscores of the correct rates (crates) and storing
%             %only 2/3 ouputs: only the mean (mu) and st dev (sig), the
%             %first output is the zscore and it is suppressed with ~
%          
%             [~,mu(i),sig] = zscore(crates(idx));
%             sem(i) = sig/sqrt(length(idx));
%             xlabels{i} = num2str(totList(i));
%             %ttests{i,j} = crates(idx);
% 
%      end
% 
%      %arguments of errorbar function
%      %1) [1:i] specifies the x axis
%      %2) mu specifies the y axis which will be the mean obtained from the
%      %zscore function above that uses crates
%      %3) sem is specifying the distance of the error bar 
%      %4) + 5) Linespec, how to format the plot  
%      %use help errorbar command for more info
%      errorbar([1:i],mu,sem,'linewidth',3);
%      hold on
%         
%       %plotting the dashed line that represents the chance level (50%) on top
%     %of the error bar plot 
%     %*Pretty sure* that it's being overlayed because the figure; command
%     %was not called 
%     plot([1 i],[chance chance],'k--','linewidth',2);
%     
%     
%     set(gca,'linewidth',3,'fontsize',20,'xlim',[0.5 i+0.5],...
%     'xtick',[1:1:i],'xticklabels',xlabels,'ylim',[0 1]);
%     box off;
%     xlabel('Sample Sizes (FFR Trials)','fontsize',20,'fontweight','bold');
%     ylabel('Decoding Accuracy (Proportion Correct)','fontsize',20,'fontweight','bold');
%     title('HMM Decoding Accuracy for the Speech Tone'); 
%     
%     set(gcf,'position',[100 100 800 600])
%     saveas(gcf,'figures/overalacc.tif'); 
%     
%         