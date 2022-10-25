#!/bin/bash
GOOGLE_TXZ="/tmp/google-*txz"
rm $GOOGLE_TXZ
RELEASE=stable
DEBARCH=amd64
CHROME_NAME="google-chrome-${RELEASE}_current_${DEBARCH}.deb"
DEB_PATH="https://dl.google.com/linux/direct/$CHROME_NAME"
rm /tmp/google-chrome*.txz
mkdir -p /tmp/google-chrome
cd /tmp/google-chrome
wget -O google-chrome.SlackBuild https://mirror.slackbuilds.org/slackware/slackware-14.1/extra/google-chrome/google-chrome.SlackBuild
chmod +x google-chrome.SlackBuild
wget -O $CHROME_NAME $DEB_PATH
sed -i 's/ar p \$CWD\/google-chrome-.*/ar p $CWD\/google-chrome-\${RELEASE}_current_\${DEBARCH}.deb data.tar.xz | xz -d | tar xv || exit 1/g' google-chrome.SlackBuild
chmod 755 google-chrome.Slackbuild
sh google-chrome.SlackBuild
installpkg $GOOGLE_TXZ
