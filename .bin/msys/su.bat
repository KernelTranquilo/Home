@echo off
runas /user:"%1" "C:\env\mingw64.exe" && exit
bash -c "echo 'THAT DID NOT WORK' && sleep 3"
exit
