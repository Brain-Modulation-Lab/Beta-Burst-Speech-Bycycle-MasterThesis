function value_size = value_to_size(cfg,value)
% This functions converts p values in corresponding sizes to plot over the anatomical substrate.

limits=bml_getopt(cfg,'limits'); % p values limits to specify or to keep standard
modality=string(bml_getopt(cfg,'modality','positive')); % 'positive' (for F test) or 'positive-negative' (for t test)
location=bml_getopt(cfg,'location'); 
estremes=bml_getopt(cfg,'estremes'); % size estremes

small=estremes(1);
big=estremes(2);

value=abs(value);

switch modality
    case 'positive'
    if isstruct(limits)
        min_min=limits.(strcat('min_',location));
        max_max=limits.(strcat('max_',location));
    else
        min_min=0;
        max_max=5;   
    end

    case 'positive-negative'    
    if isstruct(limits)
        min_min=min( abs(limits.(strcat('min_pos_',location))), abs(limits.(strcat('min_neg_',location))) );
        max_max=max( abs(limits.(strcat('max_pos_',location))), abs(limits.(strcat('max_neg_',location))) );
    else
        min_min=0;
        max_max=5;
    end
end

% in case using standard for max e min
if value >= max_max
    value_size = big;
elseif value <= min_min
    value_size = small;
else 
    %radius= 0.1 + (log(value) - log(limits.min_ecog)) / (log(limits.max_ecog) - log(limits.min_ecog)) * (3.5 - 0.1)
    value_size = small + (value - min_min) / (max_max - min_min) * (big - small);
end

end

