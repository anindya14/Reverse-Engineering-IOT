These bash commands will  help us to check recently created files in the device from debug mode 


**Command 1** : find . -name "*.txt" -mtime -60s   : To find all *.txt files modified in last 60 seconds.

**Command 2** : find . -mtime -60s   : will help us to find  all modified and created files in the last 60 seconds 

**Command 3** : ls  -al --time-style=+%D | grep 'date +%D' : -a – list all files including hidden files
                                                             -l – enables long listing format
                                                             --time-style=FORMAT – shows time in the specified FORMAT
                                                             +%D – show/use date in %m/%d/%y format
