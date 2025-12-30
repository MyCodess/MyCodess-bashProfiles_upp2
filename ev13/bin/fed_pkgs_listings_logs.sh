#!/bin/bash

cd $syysVarDP || exit 3
echo "--- creating pkgs-listings-status-log dnf,rpm,systemctl and save them in $syysVarDP :"
cudts11=$($cudts)
rpm -qa   |sort   | sed 's@        *@    ::    @g'  >  rpm-qa-$cudts11.log
systemctl list-units       |sort  | sed 's@        *@    ::    @g' >  systemctl--list-units--$cudts11.log
systemctl list-unit-files  |sort  | sed 's@        *@    ::    @g' >  systemctl--list-unit-files--$cudts11.log
##__  ReDo:   dnf list  |sort   | sed 's@        *@    ::    @g'  >  dnf-list.log-$cudts11.txt
##__  ReDo:   ls -lah   *${cudts11}*
ls -lah

