#! /bin/bash
#
#

faqsite="faq.arc42.org-site"
docsite="docs.arc42.org-site"
patternsite="patterns.arc42.org-site"
mainsite="arc42.org-site"

sites=( $faqsite $docsite $patternsite $mainsite)

# some colors to highlight certain output
GREEN=`tput setaf 2`
RED=`tput setaf 5`
RESET=`tput sgr0`

clear

echo
echo "arc42 Docker container to update subtle-ads on the arc42.org websites:"
echo "======================================================================"
echo
echo ${GREEN}
for i in ${sites[@]}; do echo  $i ; done
echo ${RESET}
echo "======================================================================"
echo

echo "I need ${GREEN} github credentials ${RESET} to push changes. In case you copy/paste,"
echo "please use the paste-command from the context menu of your terminal."
echo
read -p "Enter github ${RED} username ${RESET}(with push access to arc42 repositories) : " username
read -p "Enter github ${RED} credentials (personal access token)${RESET} : " credential

authuser=$username:$credential

if [[ -z $username ]] ; then
    echo "empty username won't work. Aborted!"
    exit 1
fi

echo "Thanx. Now using ${RED} ${authuser} ${RESET}to authenticate at github."
echo


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
   echo "updating ${GREEN} $1 ${RESET}"
   echo "========================================="
   echo "${GREEN}******* clone...:${RESET}"
   git clone --recursive https://github.com/arc42/$1
   cd $1
   echo "${GREEN}******* update submodule...:${RESET}"
   git submodule update --remote
   git add .
   echo "${GREEN}******* commit...:${RESET}"
   git commit -m "updated subtle-ads $(date +%Y-%m-%d) from Docker container"
   echo "${GREEN}******* push to Github...:${RESET}"
   git push https://$authuser@github.com/arc42/$1.git
   cd ..
}


for i in "${sites[@]}"
do
	update_submodule $i
done


echo $'...done'
