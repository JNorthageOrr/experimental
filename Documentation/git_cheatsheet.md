Git is a version control software that allow you to create different versions (branches) of the project you are working on. It is not limited to software, you could use it to write a book, or a presentation, or similar. In practical terms, this means that you can have the main project (branch "Master") and any number of sub-branches. The idea is to keep Master as the official working branch, and to create sub-branches "New Feature A", "Some Other Feature B", which you work on and develop. When the sub-branch is working to a satisfactory level (determined by you), you can then merge the sub-branch back into the master branch.

Local == your computer
remote == someone elses computer (github...etc)

Commands:

Git init .
#create a git repository in the current directory


Git remote -v 
#show remote branches connected to the repo (github, for ex...)
#remotes are usually called origin, by default, once you have more than one remote,like if you had one hosted on gihub and another on bitbucket, you need to name the remote. 


#---- Saving current changes, commiting changes, pushing to github ----#

Git add .
#adds the changes 

Git commit -m "put some text in here describing the changes you made"

Git push origin branch_name 
#it will be git push origin master if you are working on the master branch
#it will be git push bitbucket master if you are pushing to the remote bitbucket on the master branch
#it will be git push origin documentation if you are pushing on the branch documentation


Git fetch 
#calls to the remote origin, sees if there is any branches on the origin that are not on your local install, if so, it downloads the branches to your local install

Git pull remote branch_name
#git pull origin master #if you want to pull the master branch from the remote 'origin'
#git pull origin documentation #if you want to pull the documentation branch from the remote 'origin'

 
