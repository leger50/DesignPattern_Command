git init
git add *.*
git remote add origin https://github.com/leger50/DesignPattern_Command.git
set /p VAR_Saisie=    Message commit : 
git commit -m "%VAR_Saisie%"
git push origin master
pause
