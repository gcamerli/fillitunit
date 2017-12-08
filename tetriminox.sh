#!/bin/sh
#  ______        __                                                        
# /\__  _\      /\ \__         __              __                          
# \/_/\ \/    __\ \ ,_\  _ __ /\_\    ___ ___ /\_\    ___     ___   __  _  
#    \ \ \  /'__`\ \ \/ /\`'__\/\ \ /' __` __`\/\ \ /' _ `\  / __`\/\ \/'\ 
#     \ \ \/\  __/\ \ \_\ \ \/ \ \ \/\ \/\ \/\ \ \ \/\ \/\ \/\ \L\ \/>  </ 
#      \ \_\ \____\\ \__\\ \_\  \ \_\ \_\ \_\ \_\ \_\ \_\ \_\ \____//\_/\_\
#       \/_/\/____/ \/__/ \/_/   \/_/\/_/\/_/\/_/\/_/\/_/\/_/\/___/ \//\/_/
#
# ./tetriminox.sh

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0;m'

# Title
TITLE=$BLUE"⚒️  TETRIMINOX [FILLIT UNIT TEST] ⚒️"$NC

# Menu prompts
ft_prompt_0=$GREEN"[0]"$NC" Check norme"			;
ft_prompt_1=$GREEN"[1]"$NC" Check rules"			;
ft_prompt_2=$GREEN"[2]"$NC" Check relink"			;
ft_prompt_3=$GREEN"[3]"$NC" Check usage"			;
ft_prompt_4=$GREEN"[4]"$NC" Check input file"		;
ft_prompt_5=$GREEN"[5]"$NC" Exit"					;

# Numbers
MIN=$GREEN"0"$NC
MAX=$GREEN"5"$NC

# Functions
FT=*.c
LIBFT=libft/*.c

# Headers
FILH=*.h
LIBH=libft/*.h

# Error message
ft_error () {
	MSG="$RED[Error]$NC Invalid option. Enter a number between $MIN and $MAX"
}

# Menu options
ft_opt_0 () {
	echo "\n$GREEN[0]$NC Check norme:\n"
	norminette -R CheckForbiddenSourceHeader $FT $LIBFT
	norminette -R CheckForbiddenSourceHeader $FILH $LIBH
	echo $NC
	read -n 1 -s -r -p "Press any key to continue"
}

ft_opt_1 () {
	echo "\n$GREEN[1]$NC Check rules:\n"
	echo "$GREEN[1.1]$NC make:\n"
	make
	echo "\n$GREEN[1.2]$NC clean:\n"
	make clean
	echo $NC"\n$GREEN[1.3]$NC fclean:\n"
	make fclean
	echo $NC"\n$GREEN[1.4]$NC all:\n"
	make all
	echo $NC"\n$GREEN[1.5]$NC re:\n"
	make re
	echo $NC
	read -n 1 -s -r -p "Press any key to continue"
}

ft_opt_2 () {
	echo "\n$GREEN[2]$NC Check relink:\n"
	make re
	echo $NC
	make
	echo $NC
	read -n 1 -s -r -p "Press any key to continue"
}

ft_opt_3 () {
	echo "\n$GREEN[3]$NC Check usage:\n"
	make re
	echo $NC
	echo "0 arguments:"$RED
	./fillit
	echo $NC"\n2 arguments:"$RED
	./fillit input/valid/valid_00 input/valid/valid_01
	echo $NC
	read -n 1 -s -r -p "Press any key to continue"
}

ft_opt_4 () {
	echo "\n$GREEN[4]$NC Check input file:\n"
	echo "Choose one [$GREEN file $NC] writing the correct path: [$BLUE Ex. input/valid/valid_00 $NC]"
	echo
	while read -r -e LINE; do
		echo $NC
		make re
		echo $NC
		time ./fillit $LINE
		break
	done
	echo $NC
	read -n 1 -s -r -p "Press any key to continue"
}

ft_opt_5 () {
	echo $NC
 	make fclean
	echo $NC"\n$GREEN< $NC-----------------------------$RED [QUIT] $TITLE  ----------------------------- $GREEN>$NC"
	sleep 2 ; clear
	break
}

# Menu display
ft_menu() {
clear
echo $NC"$GREEN< $NC-----------------------------$GREEN [START] $TITLE  ----------------------------- $GREEN>$NC"
echo
echo
echo $BLUE`date`
echo
echo
echo "\t" $ft_prompt_0
echo "\t" $ft_prompt_1
echo "\t" $ft_prompt_2
echo "\t" $ft_prompt_3
echo "\t" $ft_prompt_4
echo "\t" $ft_prompt_5
echo
echo $MSG
echo "Select a number between $MIN and $MAX:"
echo
}

# Menu loop
MSG=

while true
do
	ft_menu

	read -e INPUT

	MSG=

	case $INPUT in
		0) ft_opt_0;;
		1) ft_opt_1;;
		2) ft_opt_2;;
		3) ft_opt_3;;
		4) ft_opt_4;;
		5) ft_opt_5;;
		*) ft_error;;
	esac
done
