apt-get -q update
cat kali-packages.txt | xargs apt-get install
mkdir ~/extra-tools
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -P ~/extra-tools/
bash ~/extra-tools/Anaconda3-2019.07-Linux-x86_64.sh -b
