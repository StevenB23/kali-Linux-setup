# using tput commands to colorize the output. 2 is for green
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "$(green)running apt-get update and installing kali packages ${reset}"
apt-get -q update
cat kali-packages.txt | xargs apt-get install

echo "$(green)creating ~/extra-tools directory(reset)"
mkdir ~/extra-tools

echo "$(green)installing Anaconda3-2019 $(reset)"
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -P ~/extra-tools/
bash ~/extra-tools/Anaconda3-2019.07-Linux-x86_64.sh -b

#Append the export command to make conda and other commands available in my PATH var
echo 'export PATH="/root/anaconda3/bin:$PATH"' >> ~/.bashrc 
echo "$(green)restarting the shell with $(tput setaf 4). ~/.bashrc $(reset)"
. ~/.bashrc
echo "$(green)running conda init command $(reset)"
conda init 
echo "$(green)package installation completed $(reset)"
echo "To Complete jupyter installation run $(red). ~/.bashrc; conda init; . ~/.bashrc$(reset)"
