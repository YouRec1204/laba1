#!/bin/bash
mkdir ./bin
touch ./bin/test1
touch ./bin/test2

for((;;))
do
	echo "Script by Litvinov Yuriy"
	echo "Script counting user files"
	echo "------------------------------------"  

	cur_dir=$(pwd)  
	echo "Current folder is $cur_dir"
    
	for((;;))
	do
		read -p "Enter user name " user_name
		grep "$user_name" /etc/passwd >/dev/null
		if [ $? -ne 0 ]
		then
			echo "No username found"
		else
			break
		fi
	done
  
  	echo "Welcome $user_name!"

  	for((;;))
	do
		read -p "Enter folder path " folder_path
		if ! [ -d $folder_path ]
		then
			echo "No such folder exist!"
		else
			count=$(find $folder_path -type f -user $user_name | wc -l)
			echo "Folder $folder_path exist and have $count files owned by $user_name"
			break
		fi
	done

	read -p "New search? (y - restart, other - quit) " decide
	if [ "$decide"!="y" ]
	then
		break
	else
		continue
	fi
 done
