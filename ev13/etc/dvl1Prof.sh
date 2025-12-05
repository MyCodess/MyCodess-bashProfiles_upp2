##__  #!/bin/bash
q_pls1  "${BASH_SOURCE[0]##*/}"
set -a
#################### here only Devels-cu-wks ... to see ....! ########################################
#####  ==========  common-dvls-vars/funcs/alias/cmds/....:
## _______:  envvars-dvvl1: --------------------------
q_dvvl1N="$q_Label1dvvl1"   ##--devels1-Name used for all devels-DN/DP/... basically same as evv-devels-Label, but here just to have extra !
q_dvvl1varDN="${q_dvvl1N}_var"
q_dvvl1varDP="${vaarAuDP}/${q_dvvl1varDN}"
q_dvvl1var2DP="${vaarAu2DP}/${q_dvvl1varDN}2"

## _______:  funcs-dvvl1:  ---------------------------
#-- open terminal-TABS for each DIR in param1-dir-listing: -----------
te1tskx(){
	local usage1="USAGE: ... <dirs-listing to open ia terminal for each entry>";  local p1="${1:?$USAGE1}" ;
	##--builds the terminal-args-str per TAB to call it with the terminal-OScmd to open a termina-TAB for each-DIR in p1
	cmdstr1=""; for ii in $@; do cmdstr1="${cmdstr1}  --tab  --working-directory=${ii}"; done;
	cmdstr1="${te1cmd1b} ${cmdstr1}"; $cmdstr1 &
}
##________________________________________  ___________________________


#####  ==========  tasks-devels: ---------------------------
##_______:  dockers1 ::
tsk1name=docks1
tsk1dirs="${vaarAuWorksDP}/${tsk1name}_wk  ${dntsDP}/devops-buildConfMgm_dnts/dockers  ${q_dvvl1varDP}/${tsk1name}_var"
alias  te1tsk1='te1tskx  $tsk1dirs'

##_______:  K8s1 /kubernetes1 ::
alias kl=kubectl

##_______:  minikubes1 ::
q_minikubehome1="$($physpathcmd1  ${vaarAu2DP}/minikube1)"
MINIKUBE_HOME="${q_minikubehome1}"
MINIKUBE_IN_STYLE=0
alias mk1='MINIKUBE_HOME=${q_minikubehome1}  minikube'   ##--is not req if already MINIKUBE_HOME set, but in case not wanted to set it globally ...
#--
tsk3name=minikubes1
tsk3dirs="${vaarAuWorksDP}/${tsk3name}_wk  ${dntsDP}/devops-buildConfMgm_dnts/kubernetes_K8s  ${q_dvvl1var2DP}/${tsk3name}_var"
alias  te1tsk3='te1tskx  $tsk3dirs'
##________________________________________  ___________________________

##______________ 1END_____________________________________________________
q_ple1  "${BASH_SOURCE[0]##*/}"

