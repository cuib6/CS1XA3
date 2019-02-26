
if [[ "$1" == "6" ]]
    then 
		echo " #6 Deleting Temporary Files"
		untrackedFiles=$(git ls-files . --exclude-standard --others)
		echo $untrackedFiles
		for file in $untrackedFiles
		do
			if [[ "$file" == *.tmp ]]
				then
					echo "removing temporary files....."
					rm $file
			fi
		done
	else
		echo "No parameter is given!"
		echo "Enter scrpt number after .sh"
fi

if [[ "$1" == "8" ]]
	then 
		echo " #8 Loginning Into a New World"
		echo -n "ID?" 
		read name
		echo -n "Password?"
		read -s passwd
	if [ $name = "Curtis" -a $passwd = "notaprofcurtis" ];then
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "WELCOME TO A NEW WORLD CURTIS"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			else "ID or password is wrong"
			echo "ID is Curtis"
			echo "Password is Curtis's name on git hub"
	
	fi
fi

if [[ "$1" == "2" ]]
	then
		echo "Creating a TODO Log"
		[ -e todo.log ] && rm todo.log
		grep "#TODO" ../ -n -r --exclude=todo.log > ~/CS1XA3/Project01/todo.log

fi

if [[ "$1" == "4" ]]
	then
		echo "Merging Log"
		rm -f "merge.log"
		fetch=`git log --oneline`
		while read -r line
			do
				if [[ ! -z `echo $line | grep "Merge"` ]] 
					then
						target=`echo $line | cut -d " " -f 1`
						echo $target >> merge.log 
						echo "$target found"
				fi
		done <<< $fetch
		echo "Complete!"
fi
		













