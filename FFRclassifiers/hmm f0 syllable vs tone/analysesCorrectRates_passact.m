

% basics

    close all
    clear all

    pathin = 'results/';
    chance = 0.50;

% arrange results


    %go to the results folder and finds all .mat files that were generated
    %by main_passact.m
    subs = dir([pathin,'*.mat']); 

    for i=1:length(subs) %loops through all .mat files in the results folder 

      sub = subs(i).name;

      infos = regexp(sub,'[0-9]*','match');

      subids(i) = str2double(infos{1});
      %if subids(i)<200
      %grp(i) = 1;
      %else
      %grp(i) = 0;
      %end
      totsizes(i) = str2double(infos{3});

      load([pathin,sub]); %loads each .mat file in the results folder 
     
      %use the rcls and pcls variables in each subject's .mat file to get
      %the classifier performonance (i.e. decoding accuracy) for that
      %subject and that number of trials/sample size (the number of trials is specified in the
      %title of the .mat file and corresponds to infos{3})
      cp = classperf(rcls,pcls);  
      %CorrectRate (one of the outputs of the classperf function) 
      %gives us a row vector where each value is the correct rate for one subject 
      %for one of the 7 sample sizes 
      %Row vector has 182 columns (26 subjects x 7 sample sizes = 182) 
      crates(i) = cp.CorrectRate;
      
    end

% Find the 'spclasses' variable. There's one for each subject's .mat file
% located in the input1 folder. We need the current script to be access
% the 'spclasses' variable. 
% path =  '../../input1/';
% input1files = dir([path,'*.mat']); 
% for i = 1:length(input1files)
%     load(input1files(i).name); %once the  files in input1 are loaded, we can access the variables inside them 
% 
% plot results overall correct rate

    %totList is a row vector with the 7 sample sizes (50, 100, 200, 500, 1000, 1500, 2000)
    %(repeated 26 times, one for each subject)
    %The row vector will have the following dimensions: 1x182
    totList = intersect(totsizes,totsizes)
    %condList = intersect(spclasses,spclasses); 
    %condList = intersect(pnclasses,pnclasses);

    figure
    %colors = [0 0 1;1 0 0];
    
    %for j=1:length(condList)
        
        %condid = condList(j);

        for i=1:length(totList)
            
            %idx corresponds to the sample size numbers (what is on the
            %x-axis of our plot)
            %idx = find(spclasses==condList(j) & totsizes==totList(i));
            idx = find(totsizes == totList(i))
            %find the zscores of the correct rates (crates) and storing
            %only 2/3 ouputs: only the mean (mu) and st dev (sig), the
            %first output is the zscore and it is suppressed with ~
         
            [~,mu(i),sig] = zscore(crates(idx));
            sem(i) = sig/sqrt(length(idx));
            xlabels{i} = num2str(totList(i));
            %ttests{i,j} = crates(idx);

        end
        
        %arguments of errorbar function
        %1) [1:i] specifies the x axis
        %2) mu specifies the y axis which will be the mean obtained from the
        %zscore function above that uses crates
        %3) sem is specifying the distance of the error bar 
        %4) + 5) Linespec, how to format the plot  
        %use help errorbar command for more info
        errorbar([1:i],mu,sem,'linewidth',3);
        hold on
        
    %end
    
    %plotting the dashed line that represents the chance level (50%) on top
    %of the error bar plot 
    %*Pretty sure* that it's being overlayed because the figure; command
    %was not called 
    plot([1 i],[chance chance],'k--','linewidth',2);
    
%     for i=1:size(ttests,1)
%     %paired samples t-test 
%     [~,ps(i)] = ttest(ttests{i,1},ttests{i,2}); 
%     if ps(i)<0.05
%     plot(i,1,'k*','markersize',20);
%     end
%     end
    
    set(gca,'linewidth',3,'fontsize',20,'xlim',[0.5 i+0.5],...
    'xtick',[1:1:i],'xticklabels',xlabels,'ylim',[0 1]);
    box off;
    xlabel('Size','fontsize',20,'fontweight','bold');
    ylabel('CorrectRate','fontsize',20,'fontweight','bold');
    
    set(gcf,'position',[100 100 800 600])
    saveas(gcf,'figures/overalacc.tif'); 
    

  
  
%end
