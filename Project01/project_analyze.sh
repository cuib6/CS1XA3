
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
