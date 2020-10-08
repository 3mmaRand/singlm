# (PART) POISSON GLMs {-}

# Poisson GLM overview {#pois-glm-overview-2}

When a response variable is the count of objects, individuals or events it often follows a Poisson distribution. Such variables are always positive - they range from 0 to $\infty$. A Poisson GLM is also known as Poisson regression. The link function used in a Poisson GLM is the natural logarithm, $ln$.

When you have a single explanatory variable, that model is:

\begin{equation}
ln(E(y_{i}))=\beta_{0}+\beta_{1}X1_{i}
(\#eq:glmpois)
\end{equation}

This means that the model estimates are logged to the base $e$ and and the inverse function, `exp()` must be applied to them to interpret them in terms of the response. In other words, to make predictions about the expected value of the response we need to exponentiate the coefficients.

\begin{equation}
E(y_{i})=exp(\beta_{0}+\beta_{1}X1_{i})
(\#eq:glmpois2)
\end{equation}

or

\begin{equation}
E(y_{i})=exp(\beta_{0}) \times exp(\beta_{1})^{X1_{i}}
(\#eq:glmpois3)
\end{equation}

Just like examples of general linear models with a single explanatory variable, there are two parameters in this model, $\beta_{0}$ and $\beta_{0}$ and their meaning is similar. $\beta_{0}$ is the log of the expected $y$ when $x$ is zero (i.e., the intercept). The log of $\beta_{1}$ is not the amount you *add* to $y$ for each unit change in $x$ but the amount by which to *multiply*. This means the model is a curve. If $\beta_{1}$ is positive, $exp(\beta_{1})$ is greater than one and $y$ increases as $x$ increases; if $\beta_{1}$ is negative, $exp(\beta_{1})$ is less than one and $y$ decreases as $x$ increases. See Figure \@ref(fig:glm-pois-poss) for an illustration of the curve for positive and negative $\beta_{1}$.

(ref:glm-pois-poss) Data fitted with a Poisson GLM.

<div class="figure" style="text-align: left">
<img src="glm-poisson_files/figure-html/glm-pois-poss-1.png" alt="(ref:glm-pois-poss)" width="80%" />
<p class="caption">(\#fig:glm-pois-poss)(ref:glm-pois-poss)</p>
</div>


See Figure \@ref(fig:glm-pois-annotated) for a graphical representation of generalised linear model terms. 

(ref:glm-pois-annotated) A Generalised linear model with Poisson distributed errors. The measured <span style=" font-weight: bold;    color: #d264c0 !important;" >response values are in pink</span>, the <span style=" font-weight: bold;    color: #c0d264 !important;" >predictions are in green</span>, and the differences between these, known as the <span style=" font-weight: bold;    color: #64c0d2 !important;" >residuals, are in blue</span>. The estimated model parameters, $\beta_{0}$ and $\beta_{1}$ must be exponentiated to be interpreted on the scale of the response. When $x=0$ we predict the number of $y$ to be $exp(\beta_{0})$. For each unit of $x$, the number of $y$ changes by a factor of $exp(\beta_{1})$


<div class="figure" style="text-align: left">
<img src="images/generic_pois.svg" alt="(ref:glm-pois-annotated)" width="80%" />
<p class="caption">(\#fig:glm-pois-annotated)(ref:glm-pois-annotated)</p>
</div>

:::key
$ln$ is the link function in a Poisson GLM. The estimates are log counts and using $exp(\beta_{0})$ and $exp(\beta_{1})$ enables us to interpret them as counts.
:::


## When explanatory is categorical {#pois-glm-chi-2}

If your response is a count and you just one categorical explanatory variable you do not need a Poisson GLMS. Use a chi-squared test.

## More than one explanatory

\begin{equation}
ln(E(y_{i}))=\beta_{0}+\beta_{1}X1_{i}+\beta_{2}X2_{i}+...+\beta_{p}Xp_{i}
(\#eq:glmpois4)
\end{equation}

To make predictions about the expected value of the response we need to exponentiate the coefficients.

\begin{equation}
E(y_{i})=exp(\beta_{0}+\beta_{1}X1_{i}+\beta_{2}X2_{i}+...+\beta_{p}Xp_{i})
(\#eq:glmpois5)
\end{equation}


<!-- ### Checking assumptions -->
<!-- The assumptions of the model are checked using the `plot()` function which produces diagnostic plots to explore the distribution of the residuals. They are not proof of the assumptions being met but allow us to quickly determine if the assumptions are plausible, and if not, how the assumptions are violated and what data points contribute to the violation. -->


<!-- The two plots which are most useful are  the "Residuals vs Fitted" plot (plot 1) and the "Q-Q" plot (plot 2). These are given as values to the `which` argument of `plot()`. -->


<!-- The Residuals vs Fitted plot shows if residuals have homogeneous variance or have non-linear patterns. Non-linear relationship between explanatory variables and the response will usually show in this plot if the model does not capture the non-linear relationship. For the assumptions to be met, the residuals should be equally spread around a horizontal line: -->


<!-- The following are two examples in which the residuals do not have homogeneous variance and display non-linear patterns. -->


<!-- The Q-Q plot is a scatterplot of the residuals (standardised to a mean of zero and a standard deviation of 1) against what is expected if the residuals are normally distributed.  -->


<!-- The following are two examples in which the residuals are not normally distributed. -->







## Reporting {#pois-glm-report-2}
The important information to include when reporting the results of fitting a Poisson GLM are the most notable predictions and the significance, direction and magnitude of effects. You need to ensure your reader will understand what the data are saying even if all the numbers and statistical information was removed. For example, variable $Y$ increases with variables $X1$. 

In relatively simple models, reporting group means or a slope, and statistical test information is enough. In more complex models with many variables is it common to give all the estimated model coefficients in a table.

In addition, your figure should show both the data and the model. This is honest and allows your interpretation to be evaluated. 
