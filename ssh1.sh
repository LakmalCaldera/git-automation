#list all directories and files seperatly

for item in *
do
	if [ -d $item ]
	then
		echo $item is a directory.
	else
		echo $item is a file.
	fi
done

echo $? is the exit status of the last command
