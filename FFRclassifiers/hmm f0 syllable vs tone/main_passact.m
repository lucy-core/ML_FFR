
%IMPORTANT - BEFORE RUNNING THIS SCRIPT
%Cut and paste any existing .mat files in the "results" folder into a new folder 
%Otherwise, running this script the will overwrite the
%files created from the previous run. 

% Basics

    close all;
    clear all; 

    p = gcp('nocreate');
    if isempty(p)
        %changed from 3 to 2 
        parpool(2);                                                               
    end
    
    delete('results/*.mat')

    rng('shuffle');                                                            
    params = setup; 
    
    %removed 2300 (because some subjects don't have this many trials)
    %changed 50 to 48 so there can be 4 k-folds
    totsizes = [48 100 200 500 1000 1500 2000];
    avesizes = round(totsizes/4);
    
% Main

    for k=1:length(totsizes)
        
        tic
        
        params.totsize = totsizes(k);
        params.avesize = avesizes(k);
      
        subList = dir([params.ddir,'*.mat']);                                

        for i=1:length(subList)  

            % load subject ffrs

            sub = subList(i).name;
            load([params.ddir,sub]); 
            
            %Intersect spclasses or pnclasses 
            
            clsList = intersect(spclasses,spclasses);
            %clsList = intersect(pnclasses,pnclasses);
            

            % train/test kfolds
            
            %'speech' is the large matrix that contains both passive and
            %active FFRs. 'spclasses' is a column vector specifying which
            %rows of 'speech' correspond to passive (coded as 1) and which rows
            %correspond to active (coded as 2) trials. 
            
          
            input = struct('speech',speech,'spclasses',spclasses);
            %input = struct('piano',piano,'pnclasses',pnclasses);
            
            parfor j=1:length(clsList) 
            clsid = clsList(j);
            
            %Note that this script (main_passact.m) uses
            %create_kfolds_passact rather than create_kfolds (the original
            %function used by the original script main.m)
            [trainfolds{j},testfolds{j}] = create_kfolds_passact(input,clsid,params);
            end

            % move-average train folds

            parfor j=1:length(clsList)        
            trainfolds{j} = moving_average(trainfolds{j},params);           
            end

            % f0s

             for j=1:length(clsList)                                              
             trainfolds{j} = ffr2f0(trainfolds{j},params);                               
             testfolds{j} = ffr2f0(testfolds{j},params);                               
             end

            % rearrange kfolds

            [trainfolds,testfolds] = rearrange_kfolds(trainfolds,testfolds);

            % cross-validation

            pcls = [];
            rcls = [];
            plogps = [];

            for j=1:length(testfolds)

                trainfold = trainfolds{j};
                testfold = testfolds{j};
                [right, pred, logp] = hmm_modeling(trainfold,testfold,params);
                rcls = [rcls;right];
                pcls = [pcls;pred];
                plogps = [plogps;logp];

            end
            
            cm = confusionmat(rcls,pcls);
            sub
            %the confusion matrix for each subject, for each sample size will
            %display in the command window as the script is running 
            cm = 100*cm/mean(sum(cm,1))

            % save results, clear vars, toc

            %outname specifies the name of the file to be created that will be
            %located in the'results' folder 
            outname = [params.rdir,'sub',sub(1:end-4),'_nst',num2str(params.nst),...
            '_size',num2str(params.totsize),...
            '_ave',num2str(params.avesize)];   
            %save the pcls, rcls, and plogsps variables in that file 
            save(outname,'pcls','rcls','plogps');        
            clear trainfolds testfolds

        end
        
        toc
        
        %Print what round we are on (i.e. which iteration/sample size of the
        %outermost loop) in the command window.
        %There are 7 sample sizes and therefore 7 rounds. 
        %This will help us keep track of the progress of the script while
        %it is running.
        fprintf('End of round %d out of 7\n',k)
       
    
    end
    
    %WAIT! DON'T RUN THIS SCRIPT YET. CHECK create_kfolds_passact TO ENSURE THE PROPER LINES 
    %ARE UNCOMMENTED AND COMMENTED OUT DEPENDING ON WHICH DATASET YOU ARE
    %RUNNING main_passact. 

    %main_pass_act.m uses create_kfolds. We needed to modify it to run
    %the HMM for the passive vs active data. We created a copy of
    %create_kfolds called create_kfolds_passact. main_pass_act will use
    %this latter version. 
    %For speech: replaced ffrs with speech, replaced cls with spclasses
    %For piano: replaced ffrs with piano, replaced cls with pnclasses 
    
  