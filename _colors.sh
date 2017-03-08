Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
i=30; while true;do echo -e "$i = \e[0;$[i++]mStackOverFlow\e[m";if [ $i == 49 ];then break;fi; sleep 1;done

for (( i = 30; i <= 37; i++ ));
do echo -e "\e[0;"$i"m  Hi stackoverflow";
done

SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
echo "${YELLOW}hello, yellow${NORMAL}"


This is the color switch \033[. See history.

Color codes are like 1;32 (Light Green), 0;34 (Blue), 1;34 (Light Blue), etc.

We terminate color sequences with a color switch \033[ and 0m, the no-color code. Just like opening and closing tabs in a markup language.

SWITCH="\033["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}1;33m"
echo "${YELLOW}hello, yellow${NORMAL}"
Simple color echo function solution:

cecho() {
local code="\033["
case "$1" in
  black  | bk) color="${code}0;30m";;
  red    |  r) color="${code}1;31m";;
  green  |  g) color="${code}1;32m";;
  yellow |  y) color="${code}1;33m";;
  blue   |  b) color="${code}1;34m";;
  purple |  p) color="${code}1;35m";;
  cyan   |  c) color="${code}1;36m";;
  gray   | gr) color="${code}0;37m";;
  *) local text="$1"
esac
[ -z "$text" ] && local text="$color$2${code}0m"
echo "$text"
}

cecho "Normal"
cecho y "Yellow!"
