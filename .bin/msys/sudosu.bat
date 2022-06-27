@echo off
runas /user:%* && exit
bash -c "echo 'THAT DID NOT WORK' && sleep 3"
exit