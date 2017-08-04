#! /bin/bash

echo off
echo
echo "arc42 Docker container to update subtle-ads on all arc42.org websites"
echo "====================================================================="
echo

echo "I need github credentials to push changes. In case you copy/paste,"
echo "please use the paste-command from the context menu of your terminal."
echo
read -p "Enter github username (with push access to arc42 repositories) :" username
read -p "Enter github credentials (personal access token) :" credential

authuser=$username:$credential
echo "Thanx. Now using $authuser to authenticate at github."
echo

faqsite="faq.arc42.org-site"
docsite="docs.arc42.org-site"
sites=( faqsite docsite )

dirname="tmp-"$(date +%Y-%m-%d)
mkdir $dirname
cd $dirname
echo "$dirname" created


# performs all updates of an arc42 site
# parameters:
# $1 github-repository-name,
# $2 the github credentials (username:password)
function update_submodule() {
   echo
   echo "updating $1"
   echo "================="
   #git clone --recursive https://github.com/arc42/$1
   cd $1
   git submodule update --remote
   git add .
   git commit -m "updated subtle-ads $(date +%Y-%m-%d) from Docker container"
   git push https://$authuser@github.com/arc42/$1.git
   cd ..
}



for i in "${sites[@]}"
do
	update_submodule $i
done


#echo "updating patterns.arc42.org-site"

#echo "updating arc42.org-site"

echo $'...done'
