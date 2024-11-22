function E = baseline_normalization(cfg,E)
% This function normalize ft data. It requires cfg with type of baseline and definition of baseline, and a fieldtrip structure with ft data. It returns the fieldtrip structure with normalize power in field powsptr

baselinetype=char(bml_getopt(cfg,'baselinetype','db'));
baselinedef=bml_getopt(cfg,'baselinedef',0);

if numel(size(E.powspctrm))>2; nTrials=size(E.powspctrm,1);
else nTrials=1;
end

pow=nan(numel(E.freq),numel(E.time));
for f=1:length(E.freq)

    if nTrials>1
        matrix_pow=squeeze(E.powspctrm(:,f,:)); 
        base_means=nan(1,nTrials);
        for j=1:nTrials
            trial_pow=matrix_pow(j,:);
            [~,idx1]=min(abs(E.time-baselinedef(j,1)));
            [~,idx2]=min(abs(E.time-baselinedef(j,2)));
            base_means(j)=mean(trial_pow(idx1:idx2),'omitnan');
        end
        base_mean=mean(base_means,'omitnan'); 
        vect_pow=mean(matrix_pow,'omitnan');
    else
        vect_pow=E.powspctrm(f,:);
    end
 
    switch baselinetype
        case 'difference'
            pow(f,:) = vect_pow- base_mean;
        case 'percentage'
            pow(f,:) = 100.*(vect_pow-base_mean) ./ (base_mean + eps);
        case 'db'
            pow(f,:) = 10*log10(vect_pow ./ (base_mean + eps));
        case 'zscore'
            pow(f,:)= (vect_pow - mean(vect_pow,'omitnan')) ./ std(vect_pow,'omitnan') ;
        otherwise
            ft_error('unsupported method for baseline normalization: %s', baselinetype);
    end
end
E.powspctrm=pow;

end

