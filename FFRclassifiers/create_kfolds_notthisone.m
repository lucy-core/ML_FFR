

function [trainfolds,testfolds]=create_kfolds2(input,classesid,params)
           
    classes = input.classes;
    passiveactive = input.passiveactive;

    idx = find(classes==classesid);
    idx = idx(1:params.totsize);
        
    d = floor(params.totsize/params.avesize);
    ons = 1;
    ofs = params.avesize;
    
    for i=1:d
      
        testfolds{i} = mean(passiveactive(idx(ons:ofs),:)); 
        temp = setdiff(idx,idx(ons:ofs));
        trainfolds{i} = passiveactive(temp,:);
        ons = ofs + 1;
        ofs = ofs + params.avesize;
        
    end
                                               
end
