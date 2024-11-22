function R = DBS_referencing(E)
% This function applies bipolar referencing to DBS data both on vertical and horizontal level.
% It accepts as input a fieldtrip structure containing data, and returns a structure with referenced data.

chan_all=E.label;
cfg=[];
cfg.channel     ={'dbs_L*'};
chan_side=ft_selectdata(cfg,E).label;

if numel(chan_side)>4 && numel(chan_all)>8 % 8 electrodes both L and R
    switch char(E.label(2))
    case {'dbs_L2A','dbs_R2A'}
        labels={'dbs_L2A-dbs_L1','dbs_L2B-dbs_L1','dbs_L2C-dbs_L1','dbs_L3A-dbs_L4','dbs_L3B-dbs_L4','dbs_L3C-dbs_L4','dbs_L2A-dbs_L3A','dbs_L2B-dbs_L3B','dbs_L2C-dbs_L3C',...
            'dbs_L2A-dbs_L2B','dbs_L2B-dbs_L2C','dbs_L2C-dbs_L2A','dbs_L3A-dbs_L3B','dbs_L3B-dbs_L3C','dbs_L3C-dbs_L3A',...
            'dbs_R2A-dbs_R1','dbs_R2B-dbs_R1','dbs_R2C-dbs_R1','dbs_R3A-dbs_R4','dbs_R3B-dbs_R4','dbs_R3C-dbs_R4','dbs_R2A-dbs_R3A','dbs_R2B-dbs_R3B','dbs_R2C-dbs_R3C',...
            'dbs_R2A-dbs_R2B','dbs_R2B-dbs_R2C','dbs_R2C-dbs_R2A','dbs_R3A-dbs_R3B','dbs_R3B-dbs_R3C','dbs_R3C-dbs_R3A'};
        
    case {'dbs_L2','dbs_R2'}
        labels={'dbs_L2-dbs_L1','dbs_L3-dbs_L1','dbs_L4-dbs_L1','dbs_L5-dbs_L8','dbs_L6-dbs_L8','dbs_L7-dbs_L8','dbs_L2-dbs_L5','dbs_L3-dbs_L6','dbs_L4-dbs_L7',...
            'dbs_L2-dbs_L3','dbs_L3-dbs_L4','dbs_L4-dbs_L2','dbs_L5-dbs_L6','dbs_L6-dbs_L7','dbs_L7-dbs_L5',...
            'dbs_R2-dbs_R1','dbs_R3-dbs_R1','dbs_R4-dbs_R1','dbs_R5-dbs_R8','dbs_R6-dbs_R8','dbs_R7-dbs_R8','dbs_R2-dbs_R5','dbs_R3-dbs_R6','dbs_R4-dbs_R7',...
            'dbs_R2-dbs_R3','dbs_R3-dbs_R4','dbs_R4-dbs_R2','dbs_R5-dbs_R6','dbs_R6-dbs_R7','dbs_R7-dbs_R5'};
    end

elseif numel(chan_side)>4 && ~(numel(chan_all)>8) % 8 electrodes only L 
    switch char(E.label(2))
    case 'dbs_L2A'
        labels={'dbs_L2A-dbs_L1','dbs_L2B-dbs_L1','dbs_L2C-dbs_L1','dbs_L3A-dbs_L4','dbs_L3B-dbs_L4','dbs_L3C-dbs_L4','dbs_L2A-dbs_L3A','dbs_L2B-dbs_L3B','dbs_L2C-dbs_L3C'...
            'dbs_L2A-dbs_L2B','dbs_L2B-dbs_L2C','dbs_L2C-dbs_L2A','dbs_L3A-dbs_L3B','dbs_L3B-dbs_L3C','dbs_L3C-dbs_L3A'};
    case 'dbs_L2'
        labels={'dbs_L2-dbs_L1','dbs_L3-dbs_L1','dbs_L4-dbs_L1','dbs_L5-dbs_L8','dbs_L6-dbs_L8','dbs_L7-dbs_L8','dbs_L2-dbs_L5','dbs_L3-dbs_L6','dbs_L4-dbs_L7',...
            'dbs_L2-dbs_L3','dbs_L3-dbs_L4','dbs_L4-dbs_L2','dbs_L5-dbs_L6','dbs_L6-dbs_L7','dbs_L7-dbs_L5'};
    end


elseif ~(numel(chan_side)>4) && numel(chan_all)>4 % 4 electrodes both L and R 
    labels={'dbs_L01-dbs_L02','dbs_L02-dbs_L03','dbs_L03-dbs_L04','dbs_R01-dbs_R02','dbs_R02-dbs_R03','dbs_R03-dbs_R04'};

elseif ~(numel(chan_side)>4) && ~(numel(chan_all)>4) % 4 electrodes only L
    labels={'dbs_L01-dbs_L02','dbs_L02-dbs_L03','dbs_L03-dbs_L04'};
else
    warning('Control DBS data structure!')

end

% create new fieldtrip object
n_trials = numel(E.trial);
R=[];
R.label=labels';
R.fsample=E.fsample;
R.trial=cell(1,n_trials);
R.time=cell(1,n_trials);

% update data
for i=1:numel(E.trial)
    for j=1:numel(labels)
        chan=char(labels(j));
        minuend=char(chan(1:strfind(chan,'-')-1));
        subtrahend=char(chan(strfind(chan,'-')+1:end));
        R.trial{i}(j,:)=E.trial{i}( find(strcmp(E.label,minuend)) ,:)  -  E.trial{i}( find(strcmp(E.label,subtrahend)) ,:);
    end
    R.time{i}=E.time{i};
end

end
