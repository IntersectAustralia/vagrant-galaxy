
apt-get update
apt-get install -y -q python2.7 python2.7-dev mercurial autoconf automake autotools-dev build-essential cmake git-core libatlas-base-dev libblas-dev liblapack-dev libc6-dev subversion pkg-config sudo wget python-pip

# install NLTK python library and all data (tool requirement)
sudo pip install nltk
sudo python -m nltk.downloader -d /usr/share/nltk_data all

# install latest stable galaxy 

hg clone https://bitbucket.org/galaxy/galaxy-dist/
cd galaxy-dist
hg update stable

# copy configuration info into galaxy install
cp config/* config/

# edit config/galaxy.ini to change name of admin user


# is this needed?
# sudo adduser galaxy sudo



# you can now login to the VM (vagrant ssh) and cd to galaxy-dist and run galaxy with 
# sh ./run.sh

