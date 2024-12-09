- **annot_ft_main.m** creates annotation tables (in the form of txt files) containing the average high, low and hole beta power for each experimental window.

- **plots_tf_main** creates single electrodes plots (as "DBS3011 ecog131.jpg" and "DBS3011 dbsL3B-dbsL3C.jpg") containing from left to right:
   - PSD for each experimental window over frequencies
   - average PSD for different frequency bands over time
   - wavelet spectrogram with decibel normalization
   - wavelet spectrogram with percentage normalization
   - single trial beta averaged PSD over time  
      For plots having time over the x axis, the vertical lines depict wxperimental windows limits.

 - **plots_tf_highlow.m** creates "beta-high-low-power boxplots.png" containing low beta, high beta and hole beta power (in dB) boxplots respectively for each experimental window indicated on the x axis. The average hole beta power is indicated on the right. A t-test is performed between low and high beta power and asterisk/s are plotted when getting significant results (one for alpha<0.05, two for <0.01 and three for <0.001).

 - **cortex_tf_highlow.m** creates "cortex high-low speech.jpg" and "cortex high-low rebound.jpg" plotting the avergage low, high and hole beta power respectively on the anatomical subtractes (cortex and STN) using a linear color scale from -5dB to 5dB, red if positive, and blue if negative.

 - **annot_tf_cond_db.m** creates annotation tables (in the form of txt files) containing the average high, low and hole beta power for each experimental window for a specific speech metric. The metrics taken into consideration are volume (vocal stimulus intensity), reaction time (average time between end of the stimulus and the beginning of the speech) and accuracy (speech accuracy with respect to the vocal stimulus to repeat).
