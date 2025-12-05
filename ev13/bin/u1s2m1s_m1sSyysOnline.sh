#!/bin/bash

set -u
set -e  ##-??

q_prj0DN=prjs  ##-->2Do: put it in evv-etc-files!
cpt11='cp  -xv  -d --preserve=timestamp'

#####  ==========  nts:
#--! WARN:  m1sSyys is ONLINE here! u1sSyys is offline! so u1s-media ia attached to m1s-syys ! so careful with m1s /up1/mnt/ or /up1/mesfa ...!
#-! preReq:   mount-arx1-OS-part:   mount -o ro  /dev/sdc3  /mnt/s1
#- so here: sync u1ssyys-->m1ssys only as much needed really for m1s!! NOT-full-sync !! NO-OS-sync!
##_______:  settings:
USAGE11="dry11=0/1 <myname>; # dryy11 == 1 is default and means dry-run/ONLY-show/NOT-really-sync!"
cmd11="rsync -n"
dry11=${dry11:-1}   ##--default is dry, so NOT-doing-sync!
if (( dry11 == 0 )); then cmd11="rsync"; else echo;echo "====================  DRY-run! NOT copying! $cmd11 ... :: ==================== "; fi ;
export  u1sSrc1="/mnt/s1"
##________________________________________  ___________________________

##_______:  up1-sync:
cd "${u1sSrc1}/${q_UppDP}/"  || exit 3 && echo "___OK:  cd  ${u1sSrc1}/${q_UppDP}/"
##--ok-works-BUT-denger due to online-m1sSyys! so we do the opposite and sync ONLY certain up1/dirs! : ##${cmd11}  -av --delete  "./"   "${q_UppDP}/"  --exclude="{mesfs,mnt,}"
${cmd11}  -av -O --delete  "./${q_EvvDN}/"   "${q_UppDP}/${q_EvvDN}/"  ##--!!-due to being symlink of .cev , must ends with "/"
${cmd11}  -av -O --delete  "./${q_prj0DN}/"  "${q_UppDP}/${q_prj0DN}/"

##_______:  
${cpt11}  ${u1sSrc1}/VARUfs_P/2209arx/home/u1/.config/vivaldi/Default/Bookmarks  ~/.config/vivaldi/Default/
${cpt11}  ${u1sSrc1}/VARUfs_P/2209arx/home/u1/.config/vivaldi/Default/Preferences  ~/.config/vivaldi/Default/
${cpt11}  ${u1sSrc1}/VARUfs_P/2209arx/home/u1/.config/chromium/Default/Bookmarks  ~/.config/chromium/Default/
${cpt11}  ${u1sSrc1}/VARUfs_P/2209arx/home/u1/.config/chromium/Default/Preferences  ~/.config/chromium/Default/
