echo "running apt-get update and installing kali packages"
apt-get -q update
cat kali-packages.txt | xargs apt-get install

echo "creating ~/extra-tools directory"
mkdir ~/extra-tools

echo "installing Anaconda3-2019"
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -P ~/extra-tools/
bash ~/extra-tools/Anaconda3-2019.07-Linux-x86_64.sh -b

#Append the export command to make conda and other commands available in my PATH var
echo 'export PATH="/root/anaconda3/bin:$PATH"' >> ~/.bashrc 
echo "restarting the shell with . ~/.bashrc"
. ~/.bashrc
echo "running conda init command"
conda init 
echo Jupyter and package installation completed
