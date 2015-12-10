untracked=`git status | grep -i -v "On branch develop" | grep -i -v "Your branch is up-to-date with 'origin/develop'." | grep -i -v "Untracked files:" | grep -i -v 'nothing added to commit but untracked files present (use "git add" to track)' | grep -i -v '(use "git add <file>..." to include in what will be committed)' | grep -i -v "Changes to be committed:" | grep -i -v '(use "git reset HEAD <file>..." to unstage)' | grep -i -v 'new file:' | grep -i -v 'Changes not staged for commit:' | grep -i -v '(use "git add <file>..." to update what will be committed)' | grep -i -v '(use "git checkout -- <file>..." to discard changes in working directory)'`
echo "The Following files will be tracked:"
for item in $untracked
do
	if [ -n "$item" ]
	then
		echo $item | grep -i "modified:" > null
		if [ $? -ne 0 ]
		then
			echo +$item
		fi
	fi
done
sleep 2
echo "Would you like to proceed?(y: Yes, n: No):\c"
read confirm

echo "-------------"

if [ "$confirm" = "y" -o "$confirm" = "Y" ]
then
	for item in $untracked
	do
		echo $item | grep -i "modified:"
		if [ $? -ne 0 ]
		then
			echo "adding -> $item"
			git add $item
		fi
		
	done
else
	exit
fi

