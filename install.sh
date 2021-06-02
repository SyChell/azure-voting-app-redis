#!/bin/sh
set -eo pipefail

# Assume that clone happened in /opt/votingflask
base_dir="/opt/azure-voting-app-redis/"
voting_user="voting"
# update and install all required packages
sudo apt update
sudo apt install python-pip
pip3 install -r ${base_dir}/azure-vote/azure-vote/requirements.txt
# check if the user exists and if not, then create it
if id -u "${voting_user}" > /dev/null 2>&1; then
    echo "No need add ${voting_user} user"
else
    sudo  useradd "${voting_user}"
fi
# recusively changing the owner of base_dir to voting user
sudo chown -R "${voting_user}" "${base_dir}"
# copy the unit to systemd directory
sudo cp "${base_dir}/votingApp.service" /etc/systemd/system
# reload the configuration (incl the unit we added) 
sudo systemctl daemon-reload
# enable the unit we added
sudo systemctl enable votingApp
sudo systemctl start votingApp
