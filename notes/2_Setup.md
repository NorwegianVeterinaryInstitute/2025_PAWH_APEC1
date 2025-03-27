Setup 2 (last trial)

This is just to be sure (if you moved pc when installing it might have lead to some issules )

- [ ] Reinstall R : download from https://cran.r-project.org/bin/windows/base/R-4.4.3-win.exe (https://cran.r-project.org/)
when you launch the install make sure it install in userpath : C:\Users\VI...\AppData\Local\Programs\R (its overkill, and we will likely not
need it, but it is to trigger a choice of R version in Rstudio).  Select that its in the registry (default) and that it is in the PATH (default) if you see the options. 

- [ ] reinstall from http://software.vetinst.no/ (wait proprely that it finishes before launching next one)
    - [ ] Rtools
    - [ ] Rstudio 

- [ ]  I do not recall - has https://quarto.org/docs/get-started/ been installed ? if not download and install (choose for user)

- [ ] Here maybe restart the PC - to be sure the changes and install are taken into account (I am not sure if it is needed but I do it anyway)

- [ ]  Then open Rstudio and it might ask you to choose an R version, choose the one you just installed (4.4.3) or at least 4.4.3 (that is a bit overkill but I am trying to trigger the selector and that it register the installation of R)
- [ ]  Just launch R studio to see if the selector comes. Chose one... maybe "C:\Program Files\R\R-4.4.3" so we are sure settings are the same between us. Close after

- [ ]  Then open rstudio by clicking on the Rproject in the Git repo folder (in C:/GITS/2025_PAWH_APEC1) (this is important, it will load the project settings).
- [ ]  and run the following code in the terminal (not the Rconsole) from Rstudio:

```
git pull # to update the repo
# if it does not work do 
git reset --hard HEAD 
git pull
```

- [ ] close Rstudio and reopen (using the Rproject). Its just that we want the settings to update (its like restarting computer ;)  so we need to repoen the project.
I have added the required packages to the renv::lock files, and I added that R has to update the packages when it starts (its in Rprofile). So you should see some
packages be installed now.

- [ ] then close 
- [ ] then try to open vscode by using the file : `2025_PAWH_APEC1.code-workspace` (I have added the settings we need to use so it should work)
- [ ] Then launch a terminal and then a Rterminal and see if it works

and then type 
- [ ] ?mean

If we are lucky this will work this time. An help should show up. If this does then we have a fully functional environment. 
If not that might just be the path of R to fix. 






