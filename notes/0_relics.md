# install.packages("renv")
#renv::install("languageserver")
#renv::install("rmarkdown")
#renv::install("httpgd")
#renv::install("ManuelHentschel/vscDebugger")
#install.packages("installr")
#options(browser = "chrome")
#options(browser = "firefox")
#options(browser = "edge")
# library(languageserver)
# library(rmarkdown)



#renv::install("rmarkdown")
#renv::install("ManuelHentschel/vscDebugger")

<!-- Note on yaml header: 
Gemini : RStudio's "Render" button and the "Render" command within its Quarto visual editor often pre-processes the document, including setting up the parameter environment. VS Code, by default, relies more on the direct execution of cells.
Here's a breakdown of why this happens and how to resolve it in VS Code:
Why the Difference?
**RStudio's Integrated Quarto Rendering:**
RStudio has a deeper integration with Quarto, automatically handling parameter injection before running the code chunks.
It effectively runs a full quarto render behind the scenes, which processes the YAML and makes the parameters available.
**VS Code's Cell-Based Execution:**
VS Code, with the Quarto and R extensions, primarily focuses on executing individual cells.
It doesn't automatically run the full Quarto rendering process for each cell execution.
Therefore, the YAML parameters are not immediately available unless the whole document is rendered.

 rm(list = ls())
 ctrl + p 
 > quarto render document 

set QUARTO_R="C:/Program Files/R/R-4.3.3/bin/"
quarto render c:/GITS/2025_PAWH_APEC1/code/1_data_wrangling.qmd --to html

but then pain also because should have the correct env variable directly ... pfff 
--> 

