# -------------------------------------------------------------------------
# First Development of ggTex
# Dalston Ward

# Version history:
# - 2021-03-21 Original Version

library(ggplot2)


# Test plot ---------------------------------------------------------------

data("iris")
test_plot <- ggplot(iris, aes(x = Sepal.Length, color = Species, fill = Species)) +
  geom_boxplot(alpha  = .2) +
  labs(ylab = NULL, xlab = "Sepal Length", title = "Boxplot of iris sepal length") +
  theme(plot.background = element_rect(color = "deepskyblue3", size = 3))


# texsave (version 1) -----------------------------------------------------------------

# the first task is writing a function that saves the output at the correct width
texsave <- function(filename, plot = last_plot(), width = 6.5,  ratio = .66, ...){
  ggsave(filename = filename, plot = plot, width = width, height = ratio*width, ...)
}


# textheme (version 1) ----------------------------------------------------

# this will eventually be the function that overrides the ggplot theme to use the font size from
# the target document. Eventually it will use the target font as well but that is down the line
# would also be good if there is a way to invisibly save the old options so that I can do something like
# theme_reset().
textheme <- function(size){
  theme_update(text = element_text(size = size))
}


# testing -----------------------------------------------------------------

# the first latex test example is on 8.5 x 11 paper with standard
# vertical alignment and 1 inch margins.
texsave("test_examples/test_1.pdf")

texsave("test_examples/test_2.pdf", ratio = .25)
