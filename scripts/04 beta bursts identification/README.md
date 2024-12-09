 - **annot_bursts_main.m** creates three annotation tables (in the form of txt files) for each electrode (for the three beta bursts identification methods: hole beta band, fooof restricted beta band, bycycle) contanining beta bursts features. For the frequency domain the features are duration, power area, average power, maximum power. For the time domain the features are duration, voltage amplitude, voltage peak, band amplitude, ride-decay symmetry, peak-trough stmmetry, number of cycles, frequency. See the figures "hole beta.jpg", "fooof beta.jpg", and "bycycle beta.jpg" as explanation of the three beta bursts identification methods implemented in the study.
  
 - **add_windows_tag.m** adds to the annotation tables created by annot_bursts_main.m the exerimental window tag the single burst belong to based on six criterum: where the onset of the burst falls into to, where the 20%, 30%, 40%, 50% and 60% of the bursts belongs to. The 50% criterium is then used in the following analysis.
  
 - **params_frequency.m** analyzes at the single electrode level the percentile threshold chosen to be at 75. At "DBS3011 ecog131 freq params percentile.png" are visible (for both the frequency domain beta burst identification methods) the feature trends over percentile thresholds from 20 to 100, burst probability in time over percentile threshold from 20 to 100, and the trend in time of beta power and burst probability at 75 percentile.At "DBS3011 ecog131 freq params windows.png" are visible the feature trends averaged per experimental windows over percentile threshold from 20 to 100, with the 75 signed as a black vertical line.
  
 - **params_bycycle.m** analyzes at the single electrode level how the choice of the hyperparameters influence the main beta bursts features. To see the influence on duration, see figure "bycycle_duration_sensitivity.jpg". Highlighted in yellow is the combination of hyperparameters chosen in this study.
  
 - **comparison_bursts.m** analyzes the degree of coherence between the three beta burst identification methods. The figures extracted from this script are:
    - "DBS3011 ecog131 visual trial comparison.png" depicts single trials power over time with bursts highlighted in red and, on the bottom, the masked version
    - "DBS3011 ecog131 power-voltage.jpg" checks at the single electrode level the correspondance and the degree of redundancy between three measures of power/voltage for each beta burst identification method. Maximum power and voltage amplitude are the only considered for this study further steps. 
    - "DBS3011 ecog131 burst probability.png" checks at the single electrode level the burst probability given by the three beta burst identification methods.
    - "DBS3011 ecog131 stat test overlap.png" tests at the single level electrode the overlapping between the bursts identified by different methods comparing the degree of overlapping with 1000 random permutations.
  
 - **comparison_ifreq.m** analyzes the single burst frequencies identified by bycycle with the electrode frequencies identified by fooof.
    - "bycycle fooof frequencies histograms.jpg" contains a histogram comparison at the region level
    - "bycycle fooof frequencies trend.jpg" depicts the bycycle frequencies plotted over fooof frequencies for cortical areas and for the STN 
