#!/bin/bash

#d=$(date +%Y-%m-%d-%T)

#touch /opt/appdata/plexguide/backup 1>/dev/null 2>&1
#sudo rm -r /opt/appdata/plex/trans* 1>/dev/null 2>&1

#mfolder="/mnt/gdrive/plexguide/backup.old/backup-"
#mpath="$mfolder$d"

#mkdir /mnt/gdrive/plexguide/backup.old/ 1>/dev/null 2>&1
#mkdir $mpath
#mv /mnt/gdrive/plexguide/backup/* $mpath 

ls -la /mnt/gdrive/plexguide/backup.old | awk '{ print $9}' | tail -n 6 > /opt/appdata/plexguide/backuplist

declare -i count=0

while read p; do
  count=$((count+1))
      	if [ $count -eq 1 ]; then
            echo "$p" > var1
            var1=$p
        fi
      	if [ $count -eq 2 ]; then
            echo "$p" > var2
            var2=$p
        fi
      	if [ $count -eq 3 ]; then
            echo "$p" > var3
            var3=$p
        fi
      	if [ $count -eq 4 ]; then
            echo "$p" > var4
            var4=$p
        fi
      	if [ $count -eq 5 ]; then
            echo "$p" > var5
            var5=$p
        fi
      	if [ $count -eq 6 ]; then
            echo "$p" > var6
            var6=$p
        fi
  #echo $p > /tmp/program_var
  #ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags backup
done </opt/appdata/plexguide/backuplist

HEIGHT=16
WIDTH=40
CHOICE_HEIGHT=9
BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
TITLE="Restore Your PlexGuide Server"
MENU="Select a Restore Option:"

OPTIONS=(A "Most Recent Backup"
         B "$var1"
         C "$var2"
         D "$var3"
         E "$var4"
         F "$var5"
         G "$var6"
         Z "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        A)
            bash /opt/plexguide/menus/programs/media.sh ;;
        B)
            bash /opt/plexguide/menus/programs/manager.sh ;;
        C)
            bash /opt/plexguide/menus/programs/nzbs.sh ;;
        D)
            bash /opt/plexguide/menus/programs/torrent.sh ;;
        E)
            bash /opt/plexguide/menus/programs/support.sh ;;
        F)
            bash /opt/plexguide/menus/programs/ui.sh ;;
        G)
            bash /opt/plexguide/menus/programs/critical.sh ;;
        H)
            bash /opt/plexguide/menus/programs/beta.sh ;;
        Z)
            clear
            exit 0 ;;
esac


#rm -r /mnt/gdrive/plexguide/backup/watchtower.tar 1>/dev/null 2>&1
#rm -r /opt/appdata/plexguide/backup 1>/dev/null 2>&

#echo ""
#echo "Backup Complete"
#read -n 1 -s -r -p "Press any key to continue "
#clear
