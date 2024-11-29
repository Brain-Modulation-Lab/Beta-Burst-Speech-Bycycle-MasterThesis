function value_color = value_to_color(cfg,value)
% This functions converts p values in corresponding colors to plot over the anatomical substrate.

limits=bml_getopt(cfg,'limits','standard');
modality=string(bml_getopt(cfg,'modality','positive'));
location=bml_getopt(cfg,'location');


switch modality
    case 'positive'
        if isstruct(limits)
            min_min=limits.(strcat('min_',location));
            max_max=limits.(strcat('max_',location));
        else
            min_min=0;
            max_max=5;   
        end
    
        % in case using standard for max e min
        if value >= max_max
            value_color = 256;
        elseif value <= min_min
            value_color = 1;
        else 
            % value_to_color= 1+( log(value) - log(limits.min_ecog)) / (log(limits.max_ecog) - log(limits.min_ecog)) * (256-1);
            value_color= 1+( value - min_min) / (max_max - min_min) * (256-1);
        end
        % avoid zero as index
        if round(value_color)==0;value_color=1;end

    % --------------------------------------------------

    case 'positive-negative'
        if isstruct(limits)
            min_pos=limits.(strcat('min_pos_',location));
            min_neg=limits.(strcat('min_neg_',location));
            max_pos=limits.(strcat('max_pos_',location));
            max_neg=limits.(strcat('max_neg_',location));
        else
            min_pos=0;
            min_neg=-5;
            max_pos=5;
            max_neg=0;
        end
    
        % in case using standard for max e min - outlier
        if value >= max_pos
            value_color = 256;
        elseif value <= min_neg
            value_color = 1;
        else 
            if value<0
                if value==min_neg && value==max_neg % if there is only a value below zero
                    value_color=128/2; 
                else
                    value_color = 1+ (value - min_neg) / (max_neg - min_neg) *(128-1); 
                end
            elseif value>0
                if value==min_pos && value==max_pos % if there is only a value over zero
                    value_color=128+128/2;  
                else;value_color = 128 + 1 + ( value - min_pos ) / (max_pos - min_pos) * (128 -1);
                end
            else 
                value_color=128;
            end
        end
        % avoid zero as index
        if round(value_color)==0;value_color=1;end
end

end

