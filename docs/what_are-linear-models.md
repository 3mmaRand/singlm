# What are linear models {#what-are-linear-models}

## What is a linear model?
A linear model describes a continuous response variable as a function of one or more explanatory variables. When you have a single explanatory variable, that model is:

\begin{equation}
y_{i}=\beta_{0}+\beta_{1}X1_{i}+e_{i}
(\#eq:lm1)
\end{equation}

Where:  

 - The response variable is $y$ and $X1$ is the explanatory variable.  
 - $\beta_{0}$ and $\beta_{1}$ are the coefficients in the model. In a single linear regression, $\beta_{0}$ is often called the intercept and $\beta_{1}$ the slope.  
 - $i$ is the index of the response so $y_{i}$ is the $i$th response; if you had 20 pairs of $x$-$y$ values, $i$ would go from 1 to 20.  
 - $e_{i}$ is the "error" also known as the residual. 

The equation means the response  can be predicted from a given value of the explanatory variable, $\beta_{0}$ and $\beta_{1}$ and will take that value plus some random noise. When you build a linear model from your data the procedure estimates the model coefficients.


See figure \@ref(fig:lm-annotated). This figure is referenced in later sections. the terms are replaced with their values for examples covered.

(ref:lm-annotated) A linear model annotated with the terms used in linear modelling. The measured <span style=" font-weight: bold;    color: #d264c0 !important;" >response values are in pink</span>, the <span style=" font-weight: bold;    color: #c0d264 !important;" >predictions are in green</span>, and the differences between these, known as the <span style=" font-weight: bold;    color: #64c0d2 !important;" >residuals, are in blue</span>. The estimated model parameters, $\beta_{0}$ and $\beta_{1}$ are indicated.

<div class="figure" style="text-align: left">
<img src="images/fig_4.svg" alt="(ref:lm-annotated)" width="80%" />
<p class="caption">(\#fig:lm-annotated)(ref:lm-annotated)</p>
</div>


**keypoint**
terminology build fit
parameter, coefficient
estimates

If you have more than one explanatory variable this these are given as $X2$,  $X3$ and so on up to the $p$th explanatory variable each with its own $\beta$ coefficient. The general form of the model is:
\begin{equation}
y_{i}=\beta_{0}+\beta_{1}X1_{i}+\beta_{2}X2_{i}+...+\beta_{p}XP_{i}+e_{i}
(\#eq:regression)
\end{equation}


