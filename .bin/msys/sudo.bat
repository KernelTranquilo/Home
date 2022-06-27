@REM @echo off
runas /user:root "%*" && exit
bash -c "echo 'THAT DID NOT WORK' && sleep 3"
exit