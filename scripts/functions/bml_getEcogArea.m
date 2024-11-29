function electrode = bml_getEcogArea(cfg,electrode)
% This function accepts in input a decodingtype and an annot table with electrodes label as 'electrode', template area as 'HCPMMP1_label_1', and the associated weight as 'HCPMMP1_weight_1'.
% It returns the associated area and colour based on HCPMMP1 atlas p 23 pdf 'Electrode-coords-and-labeling-20200317-small'

% cfg.decodingtype= 'basic', 'bysubject', 'weight'
% cfg.threshold_subj default 0.5
% cfg.threshold_weight default 0.005


decodingtype=bml_getopt(cfg,'decodingtype','basic');
th_subj=bml_getopt(cfg,'threshold_subj',5);
th_weight=bml_getopt(cfg,'threshold_weight',0.005);

tab=readtable("HCPMMP1toAreas.txt");

for i=1:height(electrode)
    label=string(electrode.HCPMMP1_label_1(i));
    
    % in case 'weight' not considering the classification with low weight
    if strcmp(decodingtype,'weight')
        weight=electrode.HCPMMP1_weight_1(i); 
        if weight<=th_weight
            electrode.HCPMMP1_area(i)={NaN};
            electrode.HCPMMP1_area_fullname(i)={NaN};
            electrode.HCPMMP1_color(i)={NaN};
            continue;
        end
    end
    
    % decoding
    try
        idx=find(strcmp(tab.label,label));
        electrode.HCPMMP1_area(i)=tab.area(idx);
        electrode.HCPMMP1_area_fullname(i)=tab.area_fullname(idx);
        electrode.HCPMMP1_color(i)=tab.color(idx);
   
    catch
        if strncmp(electrode.electrode(i),'ecog',4)
            if electrode.HCPMMP1_label_1(i)==""
                electrode.HCPMMP1_area(i)={'label not present'};
                electrode.HCPMMP1_area_fullname(i)={'label not present'};
                electrode.HCPMMP1_color(i)={'label not present'};
            else
                electrode.HCPMMP1_area(i)={'out of atlas'};
                electrode.HCPMMP1_area_fullname(i)={'out of atlas'};
                electrode.HCPMMP1_color(i)={'out of atlas'};
            end
        end
    end
end


% in case 'bysubject' not considering areas that appear few times
if strcmp(decodingtype,'bysubject')
    regions=unique(cellfun(@char,electrode.HCPMMP1_area,'UniformOutput', false));
    regions(find(cellfun('isempty',regions)))=[];
    regions=string(regions);
    for j=1:numel(regions)
        if sum(strcmp(electrode.HCPMMP1_area,regions(j)))<=th_subj
            idx=find( strcmp(electrode.HCPMMP1_area,regions(j)) );
            for k=1:length(idx)
                electrode.HCPMMP1_area(idx(k))={NaN};
                electrode.HCPMMP1_area_fullname(idx(k))={NaN};
                electrode.HCPMMP1_color(idx(k))={NaN};
            end
        end
    end
end


