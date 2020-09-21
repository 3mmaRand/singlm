
library(showtext)
library(tidyverse)
library(patchwork)
## Loading Google fonts (https://fonts.google.com/)
font_add_google("Gochi Hand", "Gochi Hand")
font_add_google("Source Code Pro", "code")
showtext_auto()

# pastel pallet for css boxes
#  blue, pink, green triadic
pal1 <- c("#eef8fa", "#faeef8","#f8faee")

#  blue, pink, green triadic
pal2 <- c("#9fd8e3", "#e39fd8", "#d8e39f")

#  blue, pink, green triadic
pal3 <- c("#64c0d2", "#d264c0", "#c0d264")
# blue, pink, green triadic
pal4 <- c("#256c7a", "#7a256c", "#6c7a25")
## gist-lm hex

stag <- read_table2("data-raw/stag.txt") 
mod <- lm(data = stag, mand ~ jh)
stag$pred <- predict(mod)
hexstag <- stag %>% 
  filter(jh > 40) %>% filter(jh < 80)
hex <- ggplot(data = hexstag, aes(x = jh, y = mand)) +
  geom_segment(aes(x = jh, 
                   xend = jh,
                   y = mand, 
                   yend = pred), 
               linetype = 2,
               size = 4,
               colour = pal3[1]) +
  geom_point(size = 15, colour = pal3[2]) + 
  geom_line(aes(x = jh, y = pred), colour = pal3[3], size = 6) +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(48, 72)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0.65, .88)) +
  theme_void()
ggsave("images/hex.png",
       plot = hex,
       device = "png",
       width = 4,
       height = 4,
       units = "in")


df <- data.frame(x = 1:20, y = 1:20)

hex <- df %>% ggplot(aes(x = x, y = y)) +
  annotate("text", 
           x = 4.5, 
           y = 18, 
           label = "s", 
           family = "Gochi Hand", 
           size = 35, 
           hjust = 0,
           vjust = 0.5,
           colour = pal3[2]) +
  annotate("text", 
           x = 6.7, 
           y = 18, 
           label = "imple", 
           family = "Gochi Hand", 
           size = 15, 
           hjust = 0,
           vjust = 0.5,
           colour = pal3[3]) +
  annotate("text", 
           x = 4.5, 
           y = 17, 
           label = "in", 
           family = "Gochi Hand", 
           size = 35, 
           hjust = 0,
           vjust = 0.5,
           colour = pal3[2]) +
  annotate("text", 
           x = 7.9, 
           y = 17, 
           label = "tro", 
           family = "Gochi Hand", 
           size = 15, 
           hjust = 0,
           vjust = 0.5,
           colour = pal3[3]) +
  annotate("text", 
           x = 1, 
           y = 16, 
           label = "to", 
           family = "Gochi Hand", 
           size = 15, 
           hjust = 0,
           vjust = 0.5,
           colour = pal3[3]) +
  annotate("text", 
           x = 4.5, 
           y = 16, 
           label = "glm()", 
           family = "Gochi Hand", 
           size = 35, 
           hjust = 0,
           vjust = 0.5,
           colour = pal3[2]) +
  scale_x_continuous(limits = c(0, 17)) +
  scale_y_continuous(limits = c(12, 19)) +
  theme_void()
ggsave("images/hex.png",
       plot = hex,
       device = "png",
       width = 1.6,
       height = 3,
       units = "in")


set.seed(3)
n <- 40
# coefficients
beta0 <- -5
beta1 <- 0.7
# generate covariate values
x <- runif(n = n, min = 0, max = 15)
# compute odds
odds <- exp(beta0 + beta1 * x)
# compute p
pr <- odds / (1 + odds)
# generate Y-values
y <- rbinom(n = n, 1, pr)
df <- data.frame(y = y, x = x)

df %>% ggplot(aes(x = x, y = y)) +
  geom_smooth(method = "glm", 
              method.args = list(family = "binomial"),
              se = FALSE,
              colour = pal3[1],
              size = 5) +
  theme_void()



beta0 <- 2.3
beta1 <- -0.28
set.seed(13)
x <- runif(n = n, min = 0, max = 15)
# compute mus
mu <- exp(beta0 + beta1 * x)
# generate Y-values
y <- rpois(n = n, lambda = mu)
# data set
df <- data.frame(y = y, x = x)
df %>% ggplot(aes(x = x, y = y)) +
  geom_smooth(method = "glm", 
              method.args = list(family = "poisson"),
              se = FALSE,
              colour = pal3[1],
              size = 5) +
  theme_void()
