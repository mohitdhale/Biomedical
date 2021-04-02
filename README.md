# Biomedical
Some simple experiments code of Biomedical. 

Mainly it contains 2 folders
1. Bio-medical_Exp
2. bio_medical

1. Bio-medical_Exp
It contains some basic codes and ecg_lfn.dat file which is a Electrocardiogram(ECG) data of Low Frequency Noise having sampling rate of 1000Hz.
ex1.m :- This program is of addition and convolution of sine and traingluar wave in which frequency is taken from user.

ex1a.m :- This program is of addition and convolution of 2 sine waves in which frequency is taken from user.

ex1b.m :- This program is of addition and convolution of sine and square wave in which frequency is taken from user.

exp2.m :- This program is about creation of an ECG signal by default values (i.e. of ideal values/default specifications) else by selecting other option in which user can give input values to create an ECG signal from values. Input values are amplitude, duration and interval of the different wave.

exp3.m :- This program is the extension of the ECG signal in which convolution is done along with Noisy signal and then it's filter out using butterworth having different order and frequnecy. 

exp4.m :- This program contains ECG creation code and Butterworth High and low pass filter along with derivative filter generation is there and using these filters signal is filtered out.

exp5.m :- Filter ECG Signal with Baseline Wandering (high Frequency Noise) Using high pass butterworth filter with order 2 and cutoff freuency 0.5 to 5 Hz. Analyse changes on ECG.

exp6.m :- Noise Removal from ECG Signal using band pass filter of order 3 cutoff= 5-15Hz.
