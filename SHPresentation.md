Saratoga properties price estimator
========================================================
author: Ilya Semenov
date: 28/08/2016
autosize: true
font-family: 'Helvetica'

Project description
========================================================

Saratoga properties is a small application that allows user to estimate properties price in Saratoga County (NY, USA) in a quick-and-dirty manner.

User input:

- any combination of 15 or less specific values of house parameters

Application output:

- price estimation
- list of Saratoga properties with relatively the same price as estimated one

[Saratoga Houses application link](http://www.shinyapps.io/)

Brief application summary
========================================================

ALgorithm based on SaratogaHouses dataset from mosaicData package available from CRAN. The dataset consists of 1728 observations with 16 parameters performed in 2006.

User is intended to select any of 15 input parameters along with their values in order to immediately obtain price estimation of property with specific parameters selection.

Since price estimation should perform on the fly basic linear regression was chosen as estimation algorithm.

Following two rows of R code took from server.R application part completely describe the whole inner magic of price prediction.


```r
lModel <- lm(as.formula(str), data = SaratogaHouses)
predict(lModel, new.data)[1]
```

User interface and model issues
========================================================

User interface is pretty simple. Main application screen divided in two areas. Left one intended for property parameters selection. Right area has two tabs: first for displaying price estimation and model selected model parameters and second for 10-rows table for properties with similar price.

Since the user can select any set of parameters for modelling no sophisticated prediction algorithms were used. 

Due to the extremely simple prediction model price estimation performs almost immediately, but can produce weird results for the exotic combinations of input parameters.

More accurate handling of model output is a subject of version 2.0 if one would be once released.

Resume
==============================

This is just the last slide in order to fit 5-slides presentation requirement.

Enjoy property pricing and

<center>**Welcome to Saratoga!**

![image](images/Saratoga.png)
