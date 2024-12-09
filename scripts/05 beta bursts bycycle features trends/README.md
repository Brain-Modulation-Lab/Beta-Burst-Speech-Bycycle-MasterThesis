 - **annot_anova1_ttest.m** creates an annotation table (in the form of a txt file) for each subject for each bycycle burst feature saving the ANOVA 1 way F-statistic and correspective p value (indicative of how strongly the feature is changing during the trials of a single electrode), and the t-statistic and the corresponding p value result of the comparison of the activity of every exerimental window with respect to the baseline (indicative of how the feature is changing in each experimental window).
  
 - **electrode_anova1_ttest.m** depits at the single electrode level the continuous and the discrete trend of each bycycle burst feature plotting also the F-statistic and t-statistics explained above.  (see fig "DBS3011 ecog 131 bycycle features.jpg")
  
 - **cortex_anova1_ttest.m** plots over the anatomical substrates each bycycle burst features' significant (p<0.05) F-statistic and t-statistics explained above (see fig "cortex ... .jpg")
  
 - **areas_scatterplots.m** creates, for each area, scatterplots having on the y-axis the experimental window t-statistic values to compare and on the x-axis the baseline values. (see "... speech.jpg" and "... rebound.jpg")
   
 - **areas_stacked_bars.m** creates, for each area, a stacked bar plot in which every bar represent the amount of positive, negative and not-significant t-statistics related to a bycycle burst feature. (see "... speech.jpg" and "... rebound.jpg")
  
For main results see "summary.jpg"
