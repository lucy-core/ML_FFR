
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
    
    %deleted 2300
    totsizes = [50 100 200 500 1000 1500 2000];
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
            %changed arguments to intersect from cls to classes 
            classesList = intersect(classes,classes);

            % train/test kfolds

            input = struct('passiveactive',passiveactive,'classes',classes);
            parfor j=1:length(classesList) 
            classesid = classesList(j);
            [trainfolds{j},testfolds{j}] = create_kfolds2(input,classesid,params);
            end

            % move-average train folds

            parfor j=1:length(classesList)        
            trainfolds{j} = moving_average(trainfolds{j},params);           
            end

            % f0s

             for j=1:length(classesList)                                              
             trainfolds{j} = ffr2f0(trainfolds{j},params);                               
             testfolds{j} = ffr2f0(testfolds{j},params);                               
             end

            % rearrange kfolds

            [trainfolds,testfolds] = rearrange_kfolds(trainfolds,testfolds);

            % cross-validation

            %changed these variable names 
            pclasses = [];
            rclasses = [];
            plogps2 = [];

            for j=1:length(testfolds)

                trainfold = trainfolds{j};
                testfold = testfolds{j};
                [right pred logp] = hmm_modeling(trainfold,testfold,params);
                rclasses = [rclasses;right];
                pclasses = [pclasses;pred];
                plogps2 = [plogps2;logp];

            end
            
            cm = confusionmat(rclasses,pclasses);
            sub
            %cm is the decoding accuracy derived from the confusion matrix generated
            %by the classifier 
            cm = 100*cm/mean(sum(cm,1))

            % save results, clear vars, toc

            outname = [params.rdir,'sub',sub(1:end-4),'_nst',num2str(params.nst),...
            '_size',num2str(params.totsize),...
            '_ave',num2str(params.avesize)];   
            save(outname,'pclasses','rclasses','plogps2');        
            clear trainfolds testfolds

        end
        
        toc
    
    end

