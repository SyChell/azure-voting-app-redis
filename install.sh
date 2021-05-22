# the script needs to run unattended
# we have to make sure every command can run without intervention
# create a systemD unit script to run the app in the background
sudo apt update
sudo apt upgrade
sudo apt install python-pip
pip install flask
pip install redis
# sudo apt-get install redis
# git clone the application
#____________________________
# git clone https://github.com/SyChell/azure-voting-app-redis.git
export REDIS=127.0.0.1
export ALLOW_EMPTY_PASSWORD="yes"
export REDIS=votingAppDNS.redis.cache.windows.net
export REDIS_PWD=fill_with_password
python3 app.py