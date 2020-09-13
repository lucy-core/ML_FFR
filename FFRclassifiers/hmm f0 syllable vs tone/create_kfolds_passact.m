

function [trainfolds,testfolds]=create_kfolds_passact(input,clsid,params)
           
    spclasses = input.spclasses;
    speech = input.speech;
    %pnclasses = input.pnclasses;
    %piano = input.piano;

    idx = find(spclasses==clsid);
    %idx = find(pnclasses==clsid);
    
    idx = idx(1:params.totsize);
        
    d = floor(params.totsize/params.avesize);
    ons = 1;
    ofs = params.avesize;
    
    for i=1:d
      
        testfolds{i} = mean(speech(idx(ons:ofs),:)); 
        %testfolds{i} = mean(piano(idx(ons:ofs),:)); 
        
        temp = setdiff(idx,idx(ons:ofs));
        
        trainfolds{i} = speech(temp,:);
        %trainfolds{i} = piano(temp,:);
        
        ons = ofs + 1;
        ofs = ofs + params.avesize;
        
    end
                                               
end
