- **annot_ft_main.m** creates annotation tables (in the form of txt files) containing the medium beta power, high beta power and low beta power in each experimental window.

- **plots_tf_main** creates single electrodes plots (as "DBS3011 ecog131.jpg" and "DBS3011 dbsL3B-dbsL3C.jpg") containing from left to right:
   - PSD for each experimental window over frequencies
   - average PSD for different frequency bands over time
   - wavelet spectrogram with decibel normalization
   - wavelet spectrogram with percentage normalization
   - single trial beta averaged PSD over time  
      For plots having time over the x axis, the vertical lines depict wxperimental windows limits.

 - **plots_tf_highlow.m** creates "beta-high-low-power boxplots.png" containing low beta, high beta and hole beta power (in dB) boxplots respectively for each experimental window indicated on the x axis. The average hole beta power is indicated on the right. A t-test is performed between low and high beta power and asterisk/s are plotted when getting significant results (one for alpha<0.05, two for <0.01 and three for <0.001).

 - 
