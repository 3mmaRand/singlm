--- 
title: "singlm: A simple introduction to GLM for analysing Poisson and Binomial responses in R"
author: "Emma Rand"
date: "October 2021"
site: bookdown::bookdown_site
documentclass: book
bibliography: [refs/book.bib, refs/packages.bib]
biblio-style: apalike
link-citations: true
description: "This book aims to teach you how to use and interpret the glm() function in R for two types of response data which are are not normally distributed: Poisson distributed responses (counts) and binomially distributed responses (binary outcomes)."
favicon: images/favicon.ico
cover-image: images/hex-s.png
github-repo: 3mmaRand/singlm
twitter-handle: er13_r
url: 'https\://3mmarand.github.io/singlm/'
always_allow_html: true
---

# Welcome! {-#welcome}

![hex logo](images/hex-s.png){width=150px} 





## Who is this book for?

This book is for R users who have done an introductory class in data analysis which covered hypothesis testing and applying and interpreting linear models in R with the `lm()` function. I assume you are familiar with, but not expert in, using R and RStudio to import data, analyse it and interpret the results and create figures using `ggplot()`. 

The book aims to teach you how to use and interpret the `glm()` function in R for two types of response data which are are not normally distributed: Poisson distributed responses (counts) and binomially distributed responses (binary outcomes). 

## Approach of this book

Models are explained with reference to examples. Each example demonstrates the R code needed, how understand the output and how to report the results, including suggested **`ggplot2`**figures. 
The code is given for figures but not extensively explained. To learn more go to  https://ggplot2.tidyverse.org/


## Conventions used in the book
Code and any output appears in blocks formatted like this:


```r
cases <- read_table("data-raw/cases.txt")
glimpse(cases)
# Rows: 43
# Columns: 2
# $ cancers  <dbl> 0, 0, 4, 0, 0, 0, 0, 1, 0, 0, 2, 0, 2, 1, 1, 0, 0, 1, 1, 1, 1~
# $ distance <dbl> 154.37, 93.14, 3.83, 60.83, 142.61, 164.72, 135.92, 79.92, 11~
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

I recommend starting a new RStudio project and creating a folder inside that project called "data-raw" where you will save the data files. Links to the data files are given in the text and these can be downloaded to your "data-raw" folder by right-clicking the link choosing the option to save. Then make a new script file for each example to carry our the analysis for that example.


For example, if you call your Project `singlm` and you have just started [Chapter 3](#pois-glm-single-cont), your folder structure would look like this:

```
-- singlm
   |-- singlm.Rproj
   |-- cases_poisson.R
   |-- data-raw
      |-- cases.text

```

Using this structure will mean the paths to files needed in your code are the same as those given in the book.

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

:::key
To follow the examples, use an RStudio Project containing a "data-raw" folder and load the tidyverse with `library(tidyverse)`
:::

## Overview of the chapter contents
This book introduces the the Generalised Linear Model for two types of discrete response:

1.Poisson distributed: when a response variable is the number of things.   
2. Binomially distributed: when a response variable can take one of only two values, such as "yes" or "no", "alive" or "dead", "present" or "absent".

In R, these are analysed with the `glm()` function.

:::key
`glm()` can be used to perform tests using the Generalised Linear Model for response variables which are counts or binary.
:::



## Credits {.unnumbered}

I used the [**`bookdown`**](https://bookdown.org/yihui/bookdown/) package [@R-bookdown] to compile this book. My R session information is shown below:


```r
sessionInfo()
# R version 4.1.1 (2021-08-10)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18363)
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
#  [1] patchwork_1.1.1  kableExtra_1.3.4 forcats_0.5.1    stringr_1.4.0   
#  [5] dplyr_1.0.7      purrr_0.3.4      readr_2.0.2      tidyr_1.1.4     
#  [9] tibble_3.1.5     ggplot2_3.3.5    tidyverse_1.3.1 
# 
# loaded via a namespace (and not attached):
#  [1] Rcpp_1.0.7        svglite_2.0.0     lubridate_1.7.10  assertthat_0.2.1 
#  [5] digest_0.6.28     utf8_1.2.2        R6_2.5.1          cellranger_1.1.0 
#  [9] backports_1.2.1   reprex_2.0.1      evaluate_0.14     httr_1.4.2       
# [13] pillar_1.6.3      rlang_0.4.11      readxl_1.3.1      rstudioapi_0.13  
# [17] jquerylib_0.1.4   rmarkdown_2.11.3  webshot_0.5.2     munsell_0.5.0    
# [21] broom_0.7.9       compiler_4.1.1    modelr_0.1.8      xfun_0.26        
# [25] pkgconfig_2.0.3   systemfonts_1.0.2 htmltools_0.5.2   downlit_0.2.1    
# [29] tidyselect_1.1.1  bookdown_0.24     fansi_0.5.0       viridisLite_0.4.0
# [33] crayon_1.4.1      tzdb_0.1.2        dbplyr_2.1.1      withr_2.4.2      
# [37] grid_4.1.1        jsonlite_1.7.2    gtable_0.3.0      lifecycle_1.0.1  
# [41] DBI_1.1.1         magrittr_2.0.1    scales_1.1.1      cli_3.0.1        
# [45] stringi_1.7.5     fs_1.5.0          xml2_1.3.2        bslib_0.3.1      
# [49] ellipsis_0.3.2    generics_0.1.0    vctrs_0.3.8       tools_4.1.1      
# [53] glue_1.4.2        hms_1.1.1         fastmap_1.1.0     yaml_2.2.1       
# [57] colorspace_2.0-2  rvest_1.0.1       knitr_1.36        haven_2.4.3      
# [61] sass_0.4.0
```

## License {.unnumbered}

<a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png" alt="Creative Commons License" style="border-width:0"/></a><br />This online work is licensed under a <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International</a>.
Visit [here](https://github.com/dukestatsciintrods/blob/master/LICENSE.md) for more information about the license.
