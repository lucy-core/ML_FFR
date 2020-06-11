# Learning How to Run a EEG-FFR Classifiers in MATLAB   
 
## Developped through the BrainHack School Montreal 2020

## Contributors 

-Project Developed and implemented by Isabelle Arseneau-Bruneau (McGill University)

-Original classifiers Scripts provided by Fernando Llanos, Ph.D. (University of Pittsburgh) 

-Dataset Provided by Emily B. J. Coffey, Ph.D. (Concordia University)

-Brainhack School Instructors: Pierre Bellec, Tristan Glatard, Yann Harel (BHS Montreal 2020)

## Summary 

This project is a tutorial. It aims for you to learn how to use a machine-learning classifier (the Hidden Markov Model) in MATLAB with an auditory neural signal called the Frequency Following Responses (FFRs). The FFR is an electrophysiological measure, recorded on the scalp with EEG or MEG, that provide a representation of how well the brain encode complex sounds (e.g. speech or music). It informs us on how individual encode and process sounds such as speech or music. It is a fascinating neurological measure, but the analysis techniques are not always the most accessible. 

## Project Definition

This tutorial first aim is to provide a reproducible workflow, that is beginner-friendly, with machine-learning (ML) procedures written in MATLAB. As I am novice with coding, I aim to implement a classifier that I use repetively in my doctoral research (an Hidden Markov Model [HMM]) into a structure that would provide some flexibility for future usages (with other variables or datasets), and would allow to build extensions (e.g. for other classifiers such as a Support Vector Machine (SVM), Cross-correlation (XCorr), LSTM). I aim to put together a set of resources that would be accessible to my research assistants, collaborators (who also have students to train on these ML procedures), other FFR researchers, and my futur self! Thus, the data of this tutorial will be in format that align with components of standards in project management (EEG-BIDS), use jupyter notebooks implemented in a virtual environement (allowing the use MATLAB scripts), and use basic matlab vizualization tools to generate figures of the results. 

### Notes on Open Science Practices and Matlab

Is it mandatory to abandon MATLAB to have open science practices? Matlab may be a commercial software, but it would be sad to limit the open science movement to open source software users. Specialized fields, such as FFR research, have the wide majority of their resources, expertise, and tools in matlab. At the current moment, it would be extremely difficult to study FFR without using MATLAB. Nevertheless, there are many open science tools that are compatible with matlab scripts and files. Thus, I tried to implement an open approach in this tutorial, so feel free to contribute to it or indicate issues. We aim to buid from this structure and repository!   

## Hidden Markov Model Classifier Goal 

The machine-learning classifier used here, the Hidden Markov Model, aims to classify __if the EEG-FFRs__ of each participants __were generated by__ a stimulus that was either a __speech sound__ or a __piano tone__ of the same fundamental frequency (98 Hz) and duration (100ms). This is done in 26 participants (13 musicians vs. 13 non-musicians). 

As the equipment used to collect FFRs and population targeted can influence the quality of the signal, this script also __tracks the number of FFR trials__ required to obtain certain levels of __decoding accuracy__. This information is useful to validate experimental procedures, adjust research designs and target research questions. As enhanced FFR reproduces features of the stimuli with more fidelity, the decoding accuracy of the classifier can also be __used as a dependant measure__ to reveal experience-dependant effect in certain populations (Llanos et al., 2017; 2019). 

## ASSIGNMENT WEEK 3

[Check the video description of my project on Youtube!](https://www.youtube.com/watch?v=6lX_-AgOXug) 

### Background Information on the FFR

![The Frequency Following Response and Machine-Learning](https://www-nature-com.proxy3.library.mcgill.ca/articles/s41467-019-13003-w/figures/1)

Over the last decades, neuroimaging studies have provided cumulative evidence of the benefits of musical training, in particular how such training promotes neuroplasticity (Herholz et al. 2012). A clear benefit of musical training is manifested at the level of the frequency following response (FFR), an electrical potential sensitive to phase-locking captured by EEG that arises from subcortical and cortical sources (Coffey et al., 2016). The FFR is an extremely rapid (starting at 7 ms) reaction of the brain to an auditory stimulus. It is a neural representation of the periodicity of the entering auditory information and allow us to recognize speech or music sounds (Coffey et al., 20161; Kraus et al., 2010; 2014; 2017b; 2017c). With both cortical and subcortical contributors that modify its quality (Coffey, Herholz, Chepesiuk, Baillet, & Zatorre, 2016), the FFR represents an integrated response of the entire auditory system (Irvine et al., 2018).  

Interestingly, the FFR varies in individuals as a function of experience (enhanced in musicians, tonal language speakers, bilinguals [Coffey et al., 2016; Kraus & Chandrasekaran, 2010; Krizman, Marian, Shook, Skoe, & Kraus, 2012]) or pathologies (decreased in autism, dyslexia, traumatic brain injuries [Hornickel & Kraus, 2013;  Nina Kraus et al., 2016;, for extensive literature survey, see Kraus et al., 2017]. Several authors have thus proposed that it may serve as an auditory biomarker to target treatments and educational interventions (Kraus et al., 2015; Bidelman et al., 2017). Musicians are of particular interest because of correlations between the augmentation of their FFR quality and enhancements in their perception skills (Coffey et al., 2016; Kraus & Chandraserakan, 2010). The greater the musical training, the closer the neuronal representation approaches its corresponding auditory stimuli (Kraus et al., 2010b, 2015, 2017). The signal is transmitted faster, and becomes more precise and robust, which then benefits higher-order cognitive functions (Coffey et al., 2016; Kraus, Anderson, White-Schwoch, Fay, & Popper, 2017). This is a remarkable phenomenon, but how these enhancements are achieved remains unclear. 

A considerable challenge for the understanding of FFR enhancements mechanisms is the very small amplitude (measured in nanovolt) and the bad signal-to-noise ratio (SNR) of the neural signal. Hence, recording FFRs typically requires several thousand exposures to the same auditory stimulus (which are averaged to cancel out the noise). These constaints considerably limited the research questions that could be expored with FFRs, while this signal would remain a key component of the plasticity mechanisms associated with musical training. 

Fortunatly, machine-learning classifiers recently developed with speech-evoked neurophysiological responses have considerably reduced the number of trials necessary to obtain a usable FFR signal (Xie et al., 2019). The classification of FFR is starting to emmerge as an objective mean to assess auditory perception (Holdgraf et al., 2017; Llanos et al., 2019). The current BHS project aims to run one of these classifiers, which I also use in my doctoral research, on FFR-EEG data. I hope to implement these procedures in a way that will facilitate access, collaborations and open science.  

### Tools I used

* A Bash Shell
* [Markdown](https://guides.github.com/features/mastering-markdown/)

* MATLAB
* MATLAB Toolboxes (GPU, Bioinformatics, and HMM)  
* Jupyter Notebook (with Python & MATLAB)
* MATLAB script of an Hidden Markov Model (originally developped by Llanos)
* A Virtual Environment

* GitHub 
* GitKraken
* BIDS-EEG format 
* Data Archiving with OSF
* Open Source Licence compatible with Matlab Scripts

#### Component to Integrate to the Github Repository After the BHS 2020
* SVM and XCorr models (developped by Fernando Llanos)
* SLTM (developped by Fernando Llanos)

* Hugo to submit a pull request to the [BrainHack School website](https://github.com/BrainhackMTL/school) to add the project description to the website. 
  
### Data 

The dataset for this tutorial project was previously published and generously provided by Emily Coffey and colleagues from the Zatorre Lab at McGill University (see Coffey et al., 2017). It consists of a set of pre-processed EEG-FFR collected with 27 subjects (13 musicians and 13 non-musicians) and the auditory stimuli used during the data collection. Demographic and music experience information (collected with the Montreal Music History Questionnaire [Coffey et al., 2011]) will also be made available on OSF for futur analysis, but is not explored under the scope of this tutorial. Thus, the data under this project is limited to the auditory stimuli (.wav) and EEG-FFR (.eeg) files. 

For more details on this dataset, please see [Cortical Correlates of the Auditory Frequency-Following and Onset Responses: EEG and fMRI Evidence](https://www.jneurosci.org/content/37/4/830). Questions can also be directed to emily.coffey@concordia.ca 

#### 1) Stimuli
The auditory stimuli used were a speech |dah| and a piano tone stimuli, with both a duration of 100ms and a fondamental frequency of 98 Hz. 

### 2) EEG Data

EEG data is provided from each subject separately as a MATLAB structure array with two fields: .eeg and .sti. 
The name on the structure array represents the subject number (e.g. 001). The first field (e.g., 001.eeg) contains a * .mat 2-dimentional matrix with the EEG data. Rows and columns will correspond to single-stimulus trials and EEG data-points, respectively. 

If you use this classifier with a different EEG-FFR dataset,  

### 3) Important Data Information (Important to adjust so that the script always correspond to the dataset that is used)

 l. __Pre-Stimulus Duration__: 50 ms\
 l. __Stimulus Duration__: 100 ms\ 
 l. __Trial Duration__: 0.2228 seconds\
 _(Note from 1st author: "It is a funny number because I shifted the data to account for air conduction delay such that 0 (or 50 ms into the file) is when the sound hits the ear) - in any case there are 3650 data points at 16384 Hz.")_
 
 l. __EEG Sample-Rate__: 16384 Hz\
 l. __Artifact Rejection Criteria (if any)__: None in the current pre-processed dataset.\ 
 _(Note from 1st author: "In the data used for the Jounal of Neuroscience publication, a precedure based on similarity to the grand average was applied. It was less appropriate to use such a procedure here as it may mask some of the inter-individual differences we are interested in.)_\   
 l. __Electrodes used for re-referencing__: This was a simple Cz to linked mastoids montage, it's already been referenced.

### Deliverables

At the end of this project, we will have:
 - The current README.md and documentation for a reproducible workflow
 - Beginner-Friendly procedures to run a HMM on FFR-EEG data
 - A Matlab Jupiter Notebook as tutorial for novice users
 - Stand-alone versions of the scripts for advanced users
 - A section in the gallery of the BHS website about this project
 - A EEG-FFR Dataset shared by the Zatorre Lab (McGill University) on OSF
 - ML Scripts created by Fernando Llanos to built on in the futur (SVM, x-corr, and SLTM)
 - MIT licenses and step to get open source licence with MATLAB script in the future
 
### Progress at Week 2

After extensive research, I found and downloaded a pre-processed FFR dataset and classifiers scripts for an HMM, a SVM, a cross-correlation and a STLM classifiers for EEG-FFR. I obtained the author's permission, installed the gpu MATLAB Toolbox on my computer. I faced issues running the scripts locally on my computer and will need to run the classifiers on my Lab server. I am currently verifying the compatibility of jupyter notebooks with MATLAB. My next steps, are to run the classifiers, and if it works, to write detailled explanations for each steps in a parralel version of the scripts.

## Results at Week 4  
By the end of this project, I became able to run classifiers on EEG-FFR and have a structured workflow that I will be able to reuse in the future. I also have MIT licences & procedures for futur scripts, an archived EEG-FFR dataset on osf.oi, and got my lab more invades by open sciences practices

### HMM Classification Result

   
 

#### Deliverable 1: A Project Report 

Check out the evolution of this project and others on the [2020 BHS github organization](https://github.com/brainhack-school2020)

#### Deliverable 2: An Entry in the Project Gallery

This project will be incorporated in the project gallery of the BHS 2020 website at the beginning of June 2020. (More details coming soon)  

#### Deliverable 3: Instructions to run ML Classifiers on EEG-FFR in MATLAB
 
 To be made available soon. 
 
## Conclusion and acknowledgement

I would like to acknowledge the assistance of Pierre Bellec, Tristan Glatard, and Yann Harel as my Individual Instructors at the Brainhack School) and the contributions of my collaborators Fernando Llanos (for the classifiers original script), and Emily Coffey (for the dataset).

## References 
