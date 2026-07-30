C:/Program Files/R/R-4.4.3/bin/R.exe
C:/Program Files/R/R-4.4.3/bin/R.exe

https://stackoverflow.com/questions/35768916/how-to-show-the-extensions-installed-in-visual-studio-code
code --list-extensions --show-versions
- click each app - settings -> add recommendation to workspace
https://rstudio.github.io/renv/articles/faq.html#:~:text=So%20if%20you%20find%20a,be%20used%20in%20a%20project.

renv::settings$snapshot.type("all")

find.package("httpgd")

renv::install()
renv::install("ManuelHentschel/vscDebugger")



```{r dummu setup , include=FALSE}
renv::install("httpgd")
renv::install("ManuelHentschel/vscDebugger")
renv::install("rmarkdown")

# just to make sure the language server is not removed from renv::lock
# because want to use this env in vscode to run the languageserver
#library(R.utils)
#R.utils::getHostname.System()
#library(languageserver)
#run()
# library(vscDebugger)
# .vsc.getSession()[1]
#rmarkdown::metadata
# library(httpuv)
# httpuv::getRNGState()

```


  "r.terminalPath": "C:\\Program Files\\R\\R-4.3.2\\bin\\x64\\Rterm.exe",
  "r.interpreterPath": "C:\\Program Files\\R\\R-4.3.2\\bin\\x64\\R.exe",

  
install.packages("renv")
renv::install("languageserver")
renv::install("httpgd")
renv::install("ManuelHentschel/vscDebugger")
#install.packages("installr")
#options(browser = "chrome")
#options(browser = "firefox")
#options(browser = "edge")
# library(languageserver)
# library(rmarkdown)
https://stackoverflow.com/questions/33798115/command-to-see-r-path-that-rstudio-is-using
.libPaths() <- c("C:/Users/VI2067/AppData/Local/Programs/R/R-4.4.3/library", .libPaths())

options("langserver_rpath" = "C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32")


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
# find.package("R.utils")

#find.package("languageserver")

# ${env:USERNAME} windows 
# Sys.setenv(R_DOC_DIR = fs::path_real(.libPaths()[1]))
# #Sys.setenv(R_DOC_DIR = fs::path_real(file.path(R.home("doc"))))
# options(langserver_rpath = "C:/Program Files/R/R-4.4.3/bin/x64/R.exe") # Replace with your R path
# options(langserver_library_search_strategy = .libPaths)
# options(help_type = "html")
# options(langserver_verbose = TRUE) #Add this only for debugging, remove after.

# file.path(R.home("bin"), "R.exe")
# renv::install("fs")
# fs::path_real(file.path(R.home("bin"), "R.exe"))

library("RColorBrewer")
library("R.utils")
#list.files("C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32")
#options("langserver_rpath" = "C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32")

# 1. Find the path to the DESCRIPTION file
desc_path <- file.path(find.package("languageserver"), "DESCRIPTION")

# 2. Calculate the MD5 hash
desc_hash <- tools::md5sum(desc_path)

# 3. The result is a named character vector; extract the hash value
desc_hash_value <- as.character(desc_hash)
print(desc_hash_value)


# hostname <- R.utils::getHostname.System()
# username <- R.utils::getUsername.System()


# if ( hostname == "VIO-D-2M1P3K2" & username == "VI2067" ) {
#     .libPaths() <- c("C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32",
#     "C:/Program Files/R/R-4.4.3/library",
#     "C:/Users/VI2067/AppData/Local/R/cache/R/renv/sandbox/windows/R-4.4/x86_64-w64-mingw32/a87bc7b1",
#     .libPaths()
#     )
# } 
# else if (hostname == "velocifero" & username == "evezeyl") {
#     .libPaths() <- c(
#     "C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32",
#     "C:/Program Files/R/R-4.4.3/library",
#     "C:/Users/VI2067/AppData/Local/R/cache/R/renv/sandbox/windows/R-4.4/x86_64-w64-mingw32/a87bc7b1"
#     )
# }
# else if (hostname == "VIO-D-2M1P3K2" & username == "VI2067" ) {
#     .libPaths() <- c(
#     "C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32",
#     "C:/Program Files/R/R-4.4.3/library",
#     "C:/Users/VI2067/AppData/Local/R/cache/R/renv/sandbox/windows/R-4.4/x86_64-w64-mingw32/a87bc7b1"
#     )
# } 




