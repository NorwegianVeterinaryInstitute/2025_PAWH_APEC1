# Initial setup

## 1. installation of git (incl. gitbash) and setting up ssh keys
There are instructions here for setup and install of git : <https://norwegianveterinaryinstitute.github.io/INIKA/2024_Training/#content> 
- [x] Test if this is already installed and setup of gitbash 
- [x] ssh keys setup 
- [x] Setup config in .ssh directory 

go to C: right click, open git bash here

```bash
cd C:/Users/username/
ls -la # should see .ssh 
mkdir .ssh # if not there
cd C:/Users/username/.ssh 
ssh-keygen -t ed25519  -f id_git -C "email_used_for_github"

touch config # open the file with editor and add the following lines and save
Host github.com
    HostName github.com
    User git
    IdentityFile /c/Users/VI.../.ssh/id_git #change your username 

# save the config file 
````  
### Add ssh key to github

See <https://norwegianveterinaryinstitute.github.io/INIKA/2024_Training/#content> 


### Clone repo for code 
> NB: can be done at different stage, 
from gitbash, Terminal in Rstudio, or from command terminal in VScode (maybe even powershell)

Cloning the git repository to your local machine (not on onedrive) <https://github.com/NorwegianVeterinaryInstitute/2025_PAWH_APEC1>
eg in C:/GITS 


```bash 
cd C:/GITS
git clone git@github.com:NorwegianVeterinaryInstitute/2025_PAWH_APEC1.git
```

## 2. Installation of>  Rstudio & setup

Setup of Rstudio IDE if not already done (please use last version) <http://software.vetinst.no/> 
(This is for people from NVI so use that)

- [x] installation of R (first)
- [x] installation of R-studio
- [x] installation of Rtools (in case needed)

- [x] Configuration Rstudio (so you can use git ) : Tools > global options > Git/SNV > enable version control interface (git) (check path if its not detected) [There should be example of configuration in INIKA course]
(had to change name ssh key)

- [ ] add copilot extension (if you want to try)
- [ ] show how to use git in Rstudio (commit, push, pull) - stage change and pull first 

## 3. Installation of VSCode & setup for live coding 
> We will try to see if that can work - Then we know after (we will use both Rstudio and VScode IDE to code with R, VSCode because of live coding feature)

- [x] installation of vscode <https://code.visualstudio.com/docs/?dv=win64user> from windows laptop
- [ ] use eg github account to login (required for live coding share) -> setting sync osv.

- [x] Prepare VScode to use R <https://code.visualstudio.com/docs/languages/r>
    - [x] Install R extensions from marked place (R, debug, Rtools)
    - [x] Install R language server in R (install.packages("languageserver")
    - [x] Install httpgd <https://github.com/nx10/httpgd> (can be nice if we work in VScode) - but I think it will be in renv
    - [ ] install.packages("rmarkdown") -> can be usefull globally (maybe is in renv, maybe installed)
    - [ ] check .libPaths() config in R app 



    - [ ] Config association : https://github.com/REditorSupport/vscode-R/wiki/R-Markdown
<!--

setx R_LIBS_USER "C:\Users\YourUserName\R\Rlibrary

[1] "C:/GITS/2025_PAWH_APEC1/renv/library/windows/R-4.4/x86_64-w64-mingw32"
[2] "C:/Users/VI2067/AppData/Local/R/cache/R/renv/sandbox/windows/R-4.4/x86_64-w64-mingw32/a87bc7b1"


- [ ] https://github.com/randy3k/radian (no - induce differences with Rstudio so do not use)
To setup: 
R app settings -> search rterm -> then path : 
${userHome}/.local/bin/radian
--> 
- [x] Install Quarto extension (by Quarto)
- [x] install Live Share (by microsoft)
- [ ] install Live preview (by microsoft)
- [ ] install github copilot extension - show activate / deactivate - so can choose 
- [ ] Configure apps that needs to run (eg specific to workspace)
    - [ ] R app settings: allways use active terminal 
    - [ ] R paths ex 
    - [ ] R test help is working (if not need to try to fix - do not understand yet why it worked and now does not work) 
<!-- debug help 
https://stackoverflow.com/questions/69454433/the-help-systems-return-help-provider-not-available

Not sure how I fixed that (probably above), I think I did put default webbrowser (but now when I check its not set)
and reinstalled R extension


Verify R's Default Browser Setting

R uses options("browser") to determine which browser to use. You can check the current setting within R itself.
Open an R terminal or R interactive session (e.g., in your VS Code terminal or the R console).
Type and execute: getOption("browser")
This will return the path to the browser R will use. If it's NULL or pointing to an unexpected location, you'll need to set it.
Set R's Default Browser (if needed)

To set the default browser, use options(browser = "path/to/your/browser").
Example (Windows):
For Chrome: options(browser = "C:/Program Files/Google/Chrome/Application/chrome.exe")
For Firefox: options(browser = "C:/Program Files/Mozilla Firefox/firefox.exe")

Maybe because I installed : 
- Live Preview (Microsoft app) as it runs a local server to show the html file in browser .. so can be that

-->
- [ ] Create / Save workspace vscode 
- [ ] show how to activate / deactivate and only use in workspace


- [ ] greate terminal shortcut -> send line to terminal :  Alt+Enter (check) (can also do : workbench.action.terminal.runSelectedText) see <https://stackoverflow.com/questions/45667252/vs-code-execute-current-line-or-selection-to-in-the-integrated-console>



- [ ] Show how to use git in vscode (commit, push, pull)


There are possibility to have extensions to help you code (github copilot, chatGTP, google gemini osv) ... but use with caution if working with confidential data (can ask help for code but be carefull) .... 
if you have licence in some, might be worth to use....


Installation of R packages (renv)  
- open project (git repo that we cloned) - you can save workspace so its easy to reopen
- start Terminal then > R interactive termimal  

in Rstudio or Vscode : 
- [x] install renv package <https://rstudio.github.io/renv/articles/renv.html> in R : `install.packages("renv")`
- [x] restaure environment : `renv::restore()` this should install all the same packages I have installed 

NB: each time we install new packages `renv::snapshot()` to save the state of the environment (and push to git) so we can both have the same env.

## 4. Live coding ... and learning together :) 

## 5. We could also use dataversion control if its important 
> but not for now I think



