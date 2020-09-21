--- 
title: "singlm: A simple introduction to GLM for analysing Poisson and Binomial responses in R"
author: "Emma Rand"
date: "September 2020"
site: bookdown::bookdown_site
documentclass: book
bibliography: [refs/book.bib, refs/packages.bib]
biblio-style: apalike
link-citations: true
description: "The output format for this example is bookdown::gitbook."
favicon: images/favicon.ico
cover-image: images/hex-s.png
github-repo: 3mmaRand/singlm
url: 'https\://3mmarand.github.io/singlm/'
---

# Preface {-#preface}




## Who is this book for?

This book is for R users who have done an introductory class in data analysis which covered hypothesis testing and applying and interpreting linear models in R with the `lm()` function. I assume you are familiar with , but not expert in using R and RStudio to import data, analyse it and interpret the results and create figures using `ggplot()`. 

The book aims to teach you how to use and interpret the `glm()` function in R for two types of response data which are are not normally distributed: Poisson distributed (counts) responses and binomially distributed responses (binary outcomes). 

## Approach of this book

:::key
`glm()` can be used to perform tests using the Generalised Linear Model for response variables which are counts or binary.
:::

Models are explained with reference to examples. Each example demonstrates the R code needed, how understand the output and how to report the results, including suggested **`ggplot2`**figures. 
The code is given for figures but not extensively explained. To learn more go to  https://ggplot2.tidyverse.org/

## Options on the toolbar 

You can change the appearance of the book using the toolbar at the top of the page. The menu on the left can be hidden, the font size increased or decreased and the colour altered to a dark or sepia theme.

Search the book by clicking on the magnifying glass, entering a search term and using the up and down arrows to navigate through the results.

## Conventions used in the book
Code and any output appears in blocks formatted like this:


```r
cases <- read_table2("data-raw/cases.txt")
glimpse(cases)
# Rows: 43
# Columns: 2
# $ cancers  <dbl> 0, 0, 4, 0, 0, 0, 0, 1, 0, 0, 2, 0, 2, 1, 1, 0, 0, 1, 1, 1...
# $ distance <dbl> 154.37, 93.14, 3.83, 60.83, 142.61, 164.72, 135.92, 79.92,...
```

Lines of output start with a `#`. The content of a code block can be copied using the icon in its top right.

Within the text:

- packages are indicated in bold code font like this: **`ggplot2`**  
- functions are indicated in code font with brackets after their name like this: `ggplot()`  
- R objects are indicated in code font like this: `cases`  

Key points are summarised throughout the book using boxes like this:

:::key
The key point of a previous few paragraphs is in boxes like these
:::

Extra pieces of information that are not essential to understanding the material are presented like this:

:::fyi
Extra information and tips are in boxes like these
:::


## Following along with the examples
Readers may wish to code along and the following gives guidance on how best to do that.

I recommend starting a new RStudio project and creating a folder inside that project called `data-raw` where you will save the data files, and scripts for each example. Links to the data files are given in the text and these can be downloaded to your `data-raw` folder by right-clicking the link choosing the option to save.


For example, if you call your Project `poisson` and you have just started [Chapter 3](#pois-glm-single-cont), your folder structure would look like this:

```
-- poisson
   |-- poisson.Rproj
   |-- cases_poisson.R
   |-- data-raw
      |-- cases.text

```

Using this structure will mean the paths to files needed in your code are the same as those given in the book.

The content of a code block can be copied using the icon in its top right corner.

I use packages from the **`tidyverse`** [@tidyverse2019] including **`ggplot2`** [@ggplot2-book], **`dplyr`** [@dplyr], **`tidyr`** [@tidyr] and **`readr`** [@readr] throughout the book. All the code assumes you have loaded the core **`tidyverse`** packages with: 


```r
library(tidyverse)
```

If you run examples and get an error like this: 


```r
# Error in read_table2("data-raw/cases.txt") : 
#  could not find function "read_table2"
```

It is likely you need to load the **`tidyverse`** as shown above.

All other packages will be loaded explicitly with `library()` statements where needed. 


## Overview of the chapter contents
This book introduces the the Generalised Linear Model for two types of discrete response:

1.Poisson distributed: when a response variable is the number of things.   
2. Binomially distributed: when a response variable can take one of only two values, such as "yes" or "no", "alive" or "dead", "present" or "absent".

In R, these are analysed with the `glm()` function.


##  Overview of the chapter contents


## Software information

I used the **`knitr`** package [@xie2015] and the **bookdown** package [@R-bookdown] to compile this book. My R session information is shown below:


```r
sessionInfo()
# R version 4.0.2 (2020-06-22)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 16299)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United Kingdom.1252 
# [2] LC_CTYPE=English_United Kingdom.1252   
# [3] LC_MONETARY=English_United Kingdom.1252
# [4] LC_NUMERIC=C                           
# [5] LC_TIME=English_United Kingdom.1252    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#  [1] patchwork_1.0.1  kableExtra_1.2.1 forcats_0.5.0    stringr_1.4.0   
#  [5] dplyr_1.0.2      purrr_0.3.4      readr_1.3.1      tidyr_1.1.2     
#  [9] tibble_3.0.3     ggplot2_3.3.2    tidyverse_1.3.0 
# 
# loaded via a namespace (and not attached):
#  [1] tidyselect_1.1.0  xfun_0.16         haven_2.3.1       colorspace_1.4-1 
#  [5] vctrs_0.3.4       generics_0.0.2    htmltools_0.5.0   viridisLite_0.3.0
#  [9] yaml_2.2.1        utf8_1.1.4        blob_1.2.1        rlang_0.4.7      
# [13] pillar_1.4.6      glue_1.4.1        withr_2.2.0       DBI_1.1.0        
# [17] dbplyr_1.4.4      modelr_0.1.8      readxl_1.3.1      lifecycle_0.2.0  
# [21] munsell_0.5.0     gtable_0.3.0      cellranger_1.1.0  rvest_0.3.6      
# [25] evaluate_0.14     knitr_1.29        fansi_0.4.1       broom_0.7.0      
# [29] Rcpp_1.0.5        scales_1.1.1      backports_1.1.9   webshot_0.5.2    
# [33] jsonlite_1.7.0    fs_1.5.0          hms_0.5.3         digest_0.6.25    
# [37] stringi_1.4.6     bookdown_0.20     grid_4.0.2        cli_2.0.2        
# [41] tools_4.0.2       magrittr_1.5      crayon_1.3.4      pkgconfig_2.0.3  
# [45] ellipsis_0.3.1    xml2_1.3.2        reprex_0.3.0      lubridate_1.7.9  
# [49] assertthat_0.2.1  rmarkdown_2.3     httr_1.4.2        rstudioapi_0.11  
# [53] R6_2.4.1          compiler_4.0.2
```

