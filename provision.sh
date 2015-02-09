
apt-get update
apt-get install -y -q python2.7 python2.7-dev mercurial autoconf automake autotools-dev build-essential cmake git-core libatlas-base-dev libblas-dev liblapack-dev libc6-dev subversion pkg-config sudo wget python-pip

# install NLTK python library and all data (tool requirement)
sudo pip install nltk
sudo python -m nltk.downloader -d /usr/share/nltk_data all
sudo pip install https://github.com/Alveo/pyalveo/archive/master.zip

# install latest stable galaxy 

hg clone https://bitbucket.org/galaxy/galaxy-dist/
cd galaxy-dist
hg update stable

# copy configuration info into galaxy install
cp /vagrant/config/galaxy.ini config/
cp /vagrant/config/tool* config/
ln -s /vagrant/config/alveo_tool_conf.xml config/alveo_tool_conf.xml

# link to our tools directory
#mkdir alveotools
#ln -s /vagrant/tools/ alveotools/alveo
ln -s /vagrant/tools-dev tools-dev

# now tools in the local tools directory can be listed in alveo_tool_conf.xml and will
# appear in Galaxy

# make a directory for toolshed dependancies to be installed in
mkdir toolshed_dep

# make galaxy-dist writable by default user
chown -R vagrant .

# you can now login to the VM (vagrant ssh) and cd to galaxy-dist and run galaxy with 
# sh ./run.sh

# register yourself using the email address you entered above
# when you refresh the page you should see the Admin link in the menu



