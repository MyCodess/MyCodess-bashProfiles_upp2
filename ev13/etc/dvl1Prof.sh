##__  #!/bin/bash
q_pls1  "${BASH_SOURCE[0]##*/}"
set -a
#################### here only Devels-cu-wks ... to see ....! ########################################
#####  ==========  common-dvls-vars/funcs/alias/cmds/....:
## _______:  envvars-dvvl1: --------------------------
q_dvvl1N="$q_Label1dvvl1"   ##--devels1-Name used for all devels-DN/DP/... basically same as evv-devels-Label, but here just to have extra !
q_dvvl1varDN="${q_dvvl1N}${q_Label1var}"
q_dvvl1varDP="${vaarAuDP}/${q_dvvl1varDN}"
q_dvvl1var2DP="${vaarAu2DP}/${q_dvvl1varDN}2"

## _______:  funcs-dvvl1:  ---------------------------
te1tskx2(){
	local usage11="USAGE: ... <task-name/-tag>  <dirs-listing to open ia terminal for each item! added to common ones!>";
	local tasktg11="${1:?$usage11}"; shift;
	local dir00="${1:?$usage11}";  ##--just to verify that the second arg was provided either!
	##-- common-dirs-for-all-tasks ! to change this, preset it before calling the func with tskdirs11def="" /OR tskdirs11def="dir1 dir2" ::
	tskdirs11def=${tskdirs11def:-"${vaarAuWorksDP}/${tasktg11}${q_Label1wk}  ${q_dvvl1varDP}/${tasktg11}${q_Label1var}"}
	local dirs11=($tskdirs11def  "$@");      ##-I-each dir-path could contain space ..., so this style !
	##--builds the terminal-args-str per TAB to call it with the terminal-OScmd to open a termina-TAB for each-DIR in p1
	cmdstr1=""; for ii in ${dirs11[*]}; do cmdstr1="${cmdstr1}  --working-directory=${ii} --tab"; done;
	cmdstr1="${te1cmd1b} --default-working-directory="${dirs11[0]}"  --active-tab  ${cmdstr1}"; $cmdstr1 &
}
##________________________________________  ___________________________


#####  ==========  tasks-devels: ---------------------------
##_______:  k8s / kubernetes-terms:
te1k8s(){ te1tskx2 k8s "${dntsDP}/devops-buildConfMgm_dnts/kubernetes_K8s"; }
##________________________________________  ___________________________



#####  ==========  prev/obsol/2adapt--tasks-devels: ---------------------------
#-- open terminal-TABS for each DIR in param1-dir-listing: -----------
te1tskx1(){
	local usage1="USAGE: ... <dirs-listing to open ia terminal for each entry>";  local p1="${1:?$USAGE1}" ;
	##--builds the terminal-args-str per TAB to call it with the terminal-OScmd to open a termina-TAB for each-DIR in p1
	cmdstr1=""; for ii in $@; do cmdstr1="${cmdstr1}  --tab  --working-directory=${ii}"; done;
	cmdstr1="${te1cmd1b} ${cmdstr1}"; $cmdstr1 &
}
##_______:  dockers1 ::
tsk1name=docks1
tsk1dirs="${vaarAuWorksDP}/${tsk1name}_wk  ${dntsDP}/devops-buildConfMgm_dnts/dockers  ${q_dvvl1varDP}/${tsk1name}${q_Label1var}"
alias  te1tsk1='te1tskx1  $tsk1dirs'

##_______:  K8s1 /kubernetes1 ::
alias kl=kubectl

##_______:  minikubes1 ::
q_minikubehome1="$($physpathcmd1  ${vaarAu2DP}/minikube1)"
MINIKUBE_HOME="${q_minikubehome1}"
MINIKUBE_IN_STYLE=0
alias mk1='MINIKUBE_HOME=${q_minikubehome1}  minikube'   ##--is not req if already MINIKUBE_HOME set, but in case not wanted to set it globally ...
#--
tsk3name=minikubes1
tsk3dirs="${vaarAuWorksDP}/${tsk3name}_wk  ${dntsDP}/devops-buildConfMgm_dnts/kubernetes_K8s  ${q_dvvl1var2DP}/${tsk3name}${q_Label1var}"}
alias  te1tsk3='te1tskx1  $tsk3dirs'
##________________________________________  ___________________________


##______________ 1END_____________________________________________________
q_ple1  "${BASH_SOURCE[0]##*/}"

