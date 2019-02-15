
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




i did the first and the sixth script. for the first step, i used an IF function to choose which script to use.
and for the second one which is the delete temporary files, i use the given code combined with if function, to test if there is a .tmp files in the repo.
If it is find then just delete it.



