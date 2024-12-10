# Beta Bust Speech Bycycle Analysis
## Neural Engineering Master Degree Thesis Project 
## Title: "Investigation of intracranial electrophysiological dynamics  of the cortico-basal ganglia circuit in Parkinsonian patients performing intraoperative speech production tasks" 
Author: Lucia Poma  
Supervisors: R.M.Richardson, MD, A.Mazzoni  
Co-supervisors: A.Bush, A.Vergani  
Tutor: M.Vissani  
Computational Neuroengineering Lab, Sant'Anna School of Advanced Studies - Brain Modulation Lab, MGH, Harvard Medical School  

This repository can be used to compare different burst detection algorithms (among which, the approach proposed by Voyteck et al.) and assess beta burst features evolution in relation to speech performances.

## Thesis abstract
> This thesis investigates the detection of oscillatory bursts in local field potentials through a time-domain algorithm and examines their modulation during a speech production task in Parkinsonian patients. Beta frequency transient activity, called bursts, is a well-established biomarker for Parkinson’s disease, correlating with symptoms and dopamine dynamics. Speech impairments are common in this disorder; however, the role of STN-cortico connections in speech production are not yet fully understood. I analyzed intracranial cortico-subthalamic simultaneous data from patients undergoing deep brain stimulation (DBS) implantation surgery, compared the performances of three burst detection approaches, and investigated burst features evolution before, during and after speech. Employing a cycle-by-cycle burst analysis allowed for a more reliable output and obtaining more informative features, notably burst frequency and time symmetries. My study contributes to a comprehensive beta activity characterization, encompassing speech-related modulations, with the intent to advance towards a more effective and personalized therapy for Parkinson’s disease and a refinement in scientific knowledge about a complex, uniquely human behaviour that is speech.

Keywords: Parkinson’s, speech, subthalamic nucleus, beta bursts, cycle-by-cycle

## Task, features and metrics considered
**Task**  
As visible in fig 3.10, participants performed a syllable repetition task intraoperatively. Subjects heard consonant-vowel-consonant (CVC) syllable triplets through earphones and were instructed to repeat them. Triplets were presented at either low ( 50dB SPL) or high ( 70dB SPL) volume. The absolute intensity was adjusted to each participant’s comfort level, keeping the difference between low and high-volume stimuli fixed at 25dB SPL. Participants were instructed to repeat the low-volume syllable triplets at normal conversation level and the high-volume triplets at increased volume, ”as if speaking to someone across the room”. The syllables were composed of a combination of either of the 4 English consonants (/v/, /t/, /s/, /g/) and either of the 3 cardinal vowels (/i/, /a, /u/), resulting in 12 unique CV syllables. For more details see the manuscript.
  
**Epoching**  
Epochs are set from -1.4s before the beginning of the acoustic cue until +1.4s after the end of the speech, and contained the following experimental windows: baseline, stimulus, (prespeech), speech, postspeech (or rebound). For more detailes see the manuscript.
  
**Beta burst features**  
The following beta bursts features are considered in this study: power, voltage, number of bursts, burst probability, duration, frequency, time symmetries.

**Speech metrics**  
The following speech metrics are identified using the Praat app:
 - Volume: acoustic stimulation volume in dB
 - Reaction time: average time in sec between the end of the acoustic stimulus and the beginning of the speech
 - Accuracy: speech acoustic with respect to the acoustic stimulus in percentage  

The following speech metrics are identified using the TELL (Toolkit to Examine Lifelike Language) app:
 - Shimmer (mean and CV):  short-term variability in the amplitude of vocal signals
 - Jitter (mean and CV): short-term variability in the pitch or frequency of vocal signals
 - Speech rate: number of syllable spoken in a second
  
## Dependencies
The code depends on these repositories:
* fieldtrip: toolbox to analyze electrophysiological data
* bml: fieldtrip wrapper developed by the BrainModulation Lab.
You need to manually download and include (only the main folder!) them in your MATLAB dependencies. After that just run these commands in MATLAB to manage dependencies:
```
bml_defaults
ft_defaults
```
Before running the project, ensure you have the following installed:
- MATLAB 2022a 
- FieldTrip toolbox
- BML toolbox
- python 3.8 or higher
- FOOOF 1.0 wrap for MATLAB
- Bycycle 1.0 wrap for MATLAB

## Structure of the project:
Scripts and Figures directories have the following subfolders:
 -  1 explorative  
 -  2 preprocessing                   
 -  3 timefrquency analysis            
 -  4 beta bursts identification
 -  5 beta bursts bycycle features trends
 -  6 beta bursts bycycle speech metrics  
 All the related functions are in the folder "functions"

README.md files will be present in the scripts' subfolders, describing also the correspective figures.
  
  
Author: Lucia Poma

