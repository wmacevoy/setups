# http://meteor-universal.tumblr.com/
# https://github.com/4commerce-technologies-AG/meteor/issues/37

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential git debian-keyring autoconf automake libtool

TMP=$(mktemp -d)
cd $TMP
curl -L -O https://archive.raspbian.org/raspbian/pool/main/c/ca-certificates/ca-certificates_20130119%2bdeb7u1_all.deb
echo "3494ecfd607e4233d8d1a656eceb6bd109d756bc0afe9d3b29dfc0acc4fe19cf  ca-certificates_20130119%2bdeb7u1_all.deb" > ca-certificates_20130119%2bdeb7u1_all.sha256
if ! sha256sum -c ca-certificates_20130119%2bdeb7u1_all.sha256
then
    echo "very fishy."
    exit 1
fi
if ! sha256sum -c ca-certificates_20130119%2bdeb7u1_all.sha256
then
    echo "very fishy."
    exit 1
fi
sudo dpkg -P --force-all ca-certificates
sudo dpkg -i ca-certificates_20130119%2bdeb7u1_all.deb
cd $HOME
/bin/rm -rf $TMP

git clone --depth 1 https://github.com/4commerce-technologies-AG/meteor.git
if [ ! -d bin ] ; then mkdir bin ; fi
( cd bin; ln -s ../meteor/meteor . )
if ! echo $PATH | fgrep ":$HOME/bin:"
then
   echo "logout and login to configure your path."
   PATH="$HOME/bin:$PATH"
fi
cd $HOME/meteor
echo "First run takes a while (20mins?)...."
./metor --version
   
