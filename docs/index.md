--- 
title: "singlm: A simple introduction to GLM for analysing Poisson and Binomial responses in R"
author: "Emma Rand"
date: "2020-07-28"
site: bookdown::bookdown_site
documentclass: book
bibliography: [refs/book.bib, refs/packages.bib]
biblio-style: apalike
link-citations: true
description: "The output format for this example is bookdown::gitbook."
favicon: images/favicon.ico
cover-image: images/android-chrome-512x512.png
github-repo: 3mmaRand/singlm
url: 'https\://3mmarand.github.io/singlm/'
---

# Preface {-#preface}




## Who is this book for?

The aim of this book is to give people who have a little experience of doing data analysis in R a light introduction to Generalised Linear Models.
It might be for you have done an introductory class in data analysis which covered classical univariate tests such as single linear regression, *t*-tests, one-way ANOVA and two-way ANOVA. It assumes you have some familiarity with R and RStudio and could import data, apply `t.test()` and `aov()` functions appropriately, interpret the results and create figures using `ggplot()`. It does not assume you are so fluent you could do these things with looking anything up, just that you would understand what you were doing and how to interpret the results.

Secondary aim of this book is to introduce the terminology of statistical modelling to make your transition to more advanced texts easier.

## Approach of this book
One of the reasons functions such as `t.test()` and `aov()` are taught rather than `lm()` is because the output is usually easier for those new to data analysis to understand and interpret. However, the output of `lm()` is more typical of statistical modelling functions in general and this makes it  difficult for people to take small steps forward in their the statistical repertoire. The approach taken in this book is to exploit preexisting knowledge of *t*-tests and ANOVA using `t.test()` and `aov()` to understand the output of `lm()`. This will allow us to more easily understand the output of `glm()` 


scope of the book, what isn't covered

Maths - intended to help you understand. ignore if it confuses you.

## formatting options on the menu


## Conventions used in the book
With in the text
Packages are indicated in bold code font like this: **`ggplot2`**
Functions are indicated in code font with brackets after their name like this: `ggplot()`

:::key
The key point of a previous few paragraphs is in boxes like these
:::

:::fyi
Extra information and tips are in boxes like these
:::

objects in R are indicated in code font like this: `mod` `stag`
we'll be using `tidyverse` [@tidyverse2019] packages.

we will use `tidyverse` throughout. Every chapter assumes it has been loaded. Other packages we will load explicitly.

:::fyi
You can learn the tidyverse
:::



This book introduces the the Generalised Linear Model for two types of response:

1. Binomially distributed: response variables are binary, that is, they can take one of only two values, such as "yes" or "no", "alive" or "dead", "present" or "absent"  
2. Poisson distributed: response variables that indicate the number of things and thus take discrete values from 0 up.

In R, these are analysed with the `glm()` function.

:::key
`glm()` can be used to perform tests using the Generalised Linear Model for response variables which are counts or binary.
:::



reporting and figures. it is not a ggplot tutorial. the code is given but not explained. to learn more go to : https://ggplot2.tidyverse.org/


##  Overview of the chapter contents
**Chapter 1**
A little revision of your introductory class. 

**Chapter 2**
In the first chapter we work through examples carried out in both `lm()` and their more more beginner friendly alternatives to gain a good understanding of the anatomy of `lm()` output.


**Chapter 3**
...
