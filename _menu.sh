# #!/bin/bash


up vote
4
down vote
#!/bin/sh
show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Mount dropbox ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Mount USB 500 Gig Drive ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Restart Apache ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} ssh Frost TomCat Server ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then
            exit;
    else
        case $opt in
        1) clear;
        option_picked "Option 1 Picked";
        sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte
        menu;
        ;;

        2) clear;
            option_picked "Option 2 Picked";
            sudo mount /dev/sdi1 /mnt/usbDrive; #The 500 gig drive
        menu;
            ;;

        3) clear;
            option_picked "Option 3 Picked";
        sudo service apache2 restart;
            show_menu;
            ;;

        4) clear;
            option_picked "Option 4 Picked";
        ssh lmesser@ -p 2010;
            show_menu;
            ;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done

# HEIGHT=15
# WIDTH=40
# CHOICE_HEIGHT=4
# BACKTITLE="Backtitle here"
# TITLE="Title here"
# MENU="Choose one of the following options:"
#
# OPTIONS=(1 "Option 1"
#          2 "Option 2"
#          3 "Option 3")
#
# CHOICE=$(dialog --clear \
#                 --backtitle "$BACKTITLE" \
#                 --title "$TITLE" \
#                 --menu "$MENU" \
#                 $HEIGHT $WIDTH $CHOICE_HEIGHT \
#                 "${OPTIONS[@]}" \
#                 2>&1 >/dev/tty)
#
# clear
# case $CHOICE in
#         1)
#             echo "You chose Option 1"
#             ;;
#         2)
#             echo "You chose Option 2"
#             ;;
#         3)
#             echo "You chose Option 3"
#             ;;
# esac
#
# # PS3='Please enter your choice: '
# # options=("Option 1" "Option 2" "Option 3" "Quit")
# # select opt in "${options[@]}"
# # do
# #     case $opt in
# #         "Option 1")
# #             echo "you chose choice 1"
# #             ;;
# #         "Option 2")
# #             echo "you chose choice 2"
# #             ;;
# #         "Option 3")
# #             echo "you chose choice 3"
# #             ;;
# #         "Quit")
# #             break
# #             ;;
# #         *) echo invalid option;;
# #     esac
# #
# # # -------------------------------------
#
#
# # customize with your own.
# options=("AAA" "BBB" "CCC" "DDD")
#
# menu() {
#     echo "Avaliable options:"
#     for i in ${!options[@]}; do
#         printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${options[i]}"
#     done
#     [[ "$msg" ]] && echo "$msg"; :
# }
#
# prompt="Check an option (again to uncheck, ENTER when done): "
# while menu && read -rp "$prompt" num && [[ "$num" ]]; do
#     [[ "$num" != *[![:digit:]]* ]] &&
#     (( num > 0 && num <= ${#options[@]} )) ||
#     { msg="Invalid option: $num"; continue; }
#     ((num--)); msg="${options[num]} was ${choices[num]:+un}checked"
#     [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="+"
# done
#
# printf "You selected"; msg=" nothing"
# for i in ${!options[@]}; do
#     [[ "${choices[i]}" ]] && { printf " %s" "${options[i]}"; msg=""; }
# done
# echo "$msg"
#
# # -----------------------------------
#
# choice () {
#   local choice=$1
#   if [[ ${opts[choice]} ]] # toggle
#   then
#       opts[choice]=
#   else
#       opts[choice]=+
#   fi
# }
#
# PS3='Please enter your choice: '
# while :
# do
#   clear
#   options=("Option 1 ${opts[1]}" "Option 2 ${opts[2]}" "Option 3 ${opts[3]}" "Done")
#   select opt in "${options[@]}"
#   do
#       case $opt in
#           "Option 1 ${opts[1]}")
#               choice 1
#               break
#               ;;
#           "Option 2 ${opts[2]}")
#               choice 2
#               break
#               ;;
#           "Option 3 ${opts[3]}")
#               choice 3
#               break
#               ;;
#           "Option 4 ${opts[4]}")
#               choice 4
#               break
#               ;;
#           "Done")
#               break 2
#               ;;
#           *) printf '%s\n' 'invalid option';;
#       esac
#   done
# done
#
# printf '%s\n' 'Options chosen:'
# for opt in "${!opts[@]}"
# do
#   if [[ ${opts[opt]} ]]
#   then
#       printf '%s\n' "Option $opt"
#   fi
# done
#
# title="Select example"
# prompt="Pick an option:"
# options=("A" "B" "C")
#
# echo "$title"
# PS3="$prompt "
# select opt in "${options[@]}" "Quit"; do
#
#     case "$REPLY" in
#
#     1 ) echo "You picked $opt which is option $REPLY";;
#     2 ) echo "You picked $opt which is option $REPLY";;
#     3 ) echo "You picked $opt which is option $REPLY";;
#
#     $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
#     *) echo "Invalid option. Try another one.";continue;;
#
#     esac
#
# done
#
# while opt=$(zenity --title="$title" --text="$prompt" --list \
#                    --column="Options" "${options[@]}"); do
#
#     case "$opt" in
#     "${options[0]}" ) zenity --info --text="You picked $opt, option 1";;
#     "${options[1]}" ) zenity --info --text="You picked $opt, option 2";;
#     "${options[2]}" ) zenity --info --text="You picked $opt, option 3";;
#     *) zenity --error --text="Invalid option. Try another one.";;
#     esac
#
# done
