#!/bin/bash



##################################################################################################

echo "##### CREATING HARD DISK  #############################################" variable; echo
read -rsn1 -p "don't forget 1:type-swap 2:boot 3:harddisk not dual boot(system) PRESS ENTER " variable; echo
 

while true; do
    read -p "1 -) Harddisk | 2 -) create Harddisk | 3 -) finish :-> " input
    if [ "$input" == "1" ]; then
        echo "you press 1"
        break
    elif [ "$input" == "2" ]; then
        echo "you press 2"
        break
    elif [ "$input" == "3" ]; then
        echo "you press 3"
        break
    else
        echo "what? -_-"
    fi
done


echo "harddisk Finish "
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo

##################################################################################################