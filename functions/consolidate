function E = consolidate(E,Ebase)
% This function fix epoch's overlapping in time when defining epoch's boundaries.
% It accepts due fieldtrip structures, one before epoching and one after epoching, and it returns the corrected epoched structure E.
  
nTrials=numel(E.trial);
len_trial=length(E.trial{1}(1,:));
for i=1:nTrials % loop on trials
    for j=1:length(E.trial{i}(:,1)) % loop on channels
        n_nan=sum(isnan(E.trial{i}(j,:))) ;
        if n_nan>1 && n_nan<len_trial
            if n_nan<0.3*length(E.trial{i}(j,:))
                E.trial{i}(j,:)=Ebase.trial{i}(j,:);
            else
                E.trial{i}(j,:)=nan(1,length(Ebase.trial{i}(j,:)));
            end
        end
    end
end

end
