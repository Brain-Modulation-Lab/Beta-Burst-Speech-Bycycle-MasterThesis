function D_preproc = preprocessing(D)
% This fun apply preprocessing steps (replacing NaN with zeros and low pass, high pass, nitch filters) to continuous raw data.
% It accepts a fieldtrip structure, and returns another fieldtrip structure with preprocessed data.

% mask the NaN values with the value of 0 
cfg=[];
cfg.value       =0;
cfg.remask_nan  =true;
D_mask=bml_mask(cfg,D);

% settings
cfg=[];
cfg.lpfilter    ='yes'; % but, hamming window
cfg.lpfreq      =200; 
cfg.lpfiltord   =5;
cfg.lpfiltdir   ='twopass';

cfg.hpfilter    ='yes'; % but, hamming window
cfg.hpfreq      =1;
cfg.hpfiltord   =5;
cfg.hpfiltdir   ='twopass';

cfg.dftfilter   ='yes';
cfg.dftfreq           = [60 120 180 240 300];
cfg.dftbandwidth      = [ 1   1   1   1   1];

D_preproc=ft_preprocessing(cfg, D_mask); 

end

