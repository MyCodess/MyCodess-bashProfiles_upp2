#!/bin/bash

##_______: nts
#-!! for git auth (eg new Token): you MUST edit ~/.git-credentials , if git config [--global] credential.helper is store !! ()
#-!! the envVar GH_TOKEN  works ONLY for gh-cmds, BUT NOT for direct git-cmds !!

##_______: VARs,...:
##__ set -x ; PS4=":___:  " ;
usag11="USAGE:   $0   <path-to-local-repo> <local-branch-name>"
pauseCmd1="read -p 'is-OK?--[Enter/Ctrl-C]:'"
pauseCmd1='echo  __________'  ##--II-for pause between steps comment out this line!
##---
locRepoFP11=${1:?"$usag11"}
locBr11=${2:?"$usag11"}


echo; echo "_______status-check: __________________________";
echo ${GH_TOKEN:?"set the GH_TOKEN env-var before starting me!"}
$($pauseCmd1)
cdlla  ${locRepoFP11}  || exit 3
##__  gh repo list
git remote -v
git status
$pauseCmd1

echo; echo "_______pull-main-branch:_______________________";
git switch main
git pull

echo; echo "_______rebase+change+commit-push:______________";
git  switch ${locBr11}
git pull
git rebase main
el1d "${locBr11}-mod" >> ${locBr11}_flg.txt
git add .
git  commit -a -m "${locBr11}-commit--for-pr"
git  push     ##__ [ -v   --set-upstream origin ${locBr11} ]
$pauseCmd1

echo; echo "_______pull-request-handling: _________________";
gh  pr  create  --title  "PR1-${locBr11}--$($cudts2)"  --body "PR-from-${locBr11}-into-main--$($cudts2)"
gh  pr  merge -m ${locBr11}

echo; echo "_______pull main again after PR merged: _______";
git switch main
git pull
git  switch ${locBr11}


##__  $pauseCmd1
##__  echo  "----------- if like: create+delete repoXX : -----------------------"
##__  expg  GH_TOK
##__  gh  repo  create  -d "gh-cmd-repo-created-$($cudts2)"  --public  repo61
##__  gh  repo  delete  --yes   repo61

