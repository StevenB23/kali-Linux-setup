# using tput commands to colorize the output. 2 is for green
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}running apt-get update and installing kali packages ${reset}"
apt-get -q update
cat kali-packages.txt | xargs apt-get --assume-yes install

echo "${green}creating ~/extra-tools directory{reset}"
mkdir ~/extra-tools

echo "${green}installing Anaconda3-2019 ${reset}"
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -P ~/extra-tools/
#Use -b for a default silent install of Anaconda
bash ~/extra-tools/Anaconda3-2019.07-Linux-x86_64.sh -b

#Append the export command to make conda and other commands available in my PATH var
echo 'export PATH="/root/anaconda3/bin:$PATH"' >> ~/.bashrc 
echo "${green}restarting the shell with $(tput setaf 4). ~/.bashrc ${reset}"
. ~/.bashrc
echo "${green}running conda init command ${reset}"
conda init 
echo "${green}package installation completed ${reset}"
#The script instance of running conda init doesn't take for your shell instance
echo "To Complete jupyter installation run $(red). ~/.bashrc; conda init; . ~/.bashrc${reset}"


#INTEGRATE BELOW COMMANDS (UNTESTED)
# <create the pentest env in conda>
# conda activate pentest
# pip install sh
# pip install python-nmap

#EyeWitness
#source activate pentest
# cd ~/Downloads
# git clone https://github.com/FortyNorthSecurity/EyeWitness.git
#bash ~/Downloads/EyeWitness/setup/setup.sh

#Powershell
#apt update && apt -y install curl gnupg apt-transport-https
#curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - 
#echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/powershell.list
#apt -y install powershell
