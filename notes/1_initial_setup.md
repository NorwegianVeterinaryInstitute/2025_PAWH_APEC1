# Initial setup

## 1. installation of git (incl. gitbash) and setting up ssh keys
There are instructions here for setup and install of git : <https://norwegianveterinaryinstitute.github.io/INIKA/2024_Training/#content> 
- [ ] Test if this is already installed and setup of gitbash 
- [ ] ssh keys setup 
- [ ] Setup config in .ssh directory 

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

- [ ] installation of R (first)
- [ ] installation of R-studio

- [ ] Configuration Rstudio (so you can use git ) : Tools > global options > Git/SNV > enable version control interface (git) (check path if its not detected) [There should be example of configuration in INIKA course]


## 3. Installation of VSCode & setup for live coding 
> We will try to see if that can work - Then we know after (we will use both Rstudio and VScode IDE to code with R, VSCode because of live coding feature)

- [ ] installation of vscode <https://code.visualstudio.com/docs/?dv=win64user> from windows laptop
- [ ] use eg github account to login (required for live coding share) -> setting sync osv.

- [ ] Prepare VScode to use R <https://code.visualstudio.com/docs/languages/r>
- [ ] Install required R extensions (follow instructions, and linked instructions) (by REditorSupport)
- [ ] Can do this one <https://github.com/nx10/httpgd> (can be nice if we work in VScode) - but I think it will be in renv
<!--
- [ ] https://github.com/randy3k/radian (no - induce differences with Rstudio so do not use)
To setup: 
R app settings -> search rterm -> then path : 
${userHome}/.local/bin/radian


--> 

- [ ] Install Quarto extension (by Quarto)
- [ ] install Live Share (by microsoft)
- [ ] Configure apps that needs to run (eg specific to workspace)
    - [ ] R app settings: allways use active terminal 
    - [ ] Terminal shortcut -> send line to terminal :  Alt+Enter (check) (can also do : workbench.action.terminal.runSelectedText) see <https://stackoverflow.com/questions/45667252/vs-code-execute-current-line-or-selection-to-in-the-integrated-console>
- [ ] Create / Save workspace 

There are possibility to have extensions to help you code (github copilot, chatGTP, google gemini osv) ... but use with caution if working with confidential data (can ask help for code but be carefull) .... 


Installation of R packages (renv)  
- open project (git repo that we cloned) - you can save workspace so its easy to reopen
- start Terminal then > R interactive termimal  
- install renv package <https://rstudio.github.io/renv/articles/renv.html> in R : `install.packages("renv")`
- restaure environment : `renv::restore()` this should install all the same packages I have installed 

NB: each time we install new packages `renv::snapshot()` to save the state of the environment (and push to git) so we can both have the same env.

## 4. Live coding ... and learning together :) 

## 5. We could also use dataversion control if its important 
> but not for now I think



