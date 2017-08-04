#! /bin/bash

echo off
echo
echo "arc42 Docker container to update subtle-ads on all arc42.org websites"
echo "====================================================================="

faqsite="faq.arc42.org-site"

dirname="tmp-"$(date +%Y-%m-%d)
mkdir $dirname
cd $dirname
echo "$dirname" created

echo
echo "updating $faqsite"
echo "================="
git clone https://github.com/arc42/$faqsite
cd $faqsite
git submodule update --remote
git commit -m "updated subtle-ads $(date +%Y-%m-%d)"
git push https://gernotstarke:c6452598cc23dc84e8f21389e3f888c48da41b91@github.com/arc42/$faqsite.git
cd ..


#echo "updating docs.arc42.org-site"
#git clone https://github.com/arc42/docs.arc42.org-site
#cd docs.arc42.org-site
#git submodule update --remote
#git commit -m "updated subtle-ads $(date +%Y-%m-%d)"
#git push https://gernotstarke:c6452598cc23dc84e8f21389e3f888c48da41b91@github.com/arc42/docs.arc42.org-site.git
#cd ..

#echo "updating patterns.arc42.org-site"
#git clone https://github.com/arc42/patterns.arc42.org-site
#cd patterns.arc42.org-site
#git submodule update --remote
#git commit -m "updated subtle-ads $(date +%Y-%m-%d)"
#git push https://gernotstarke:c6452598cc23dc84e8f21389e3f888c48da41b91@github.com/arc42/patterns.arc42.org-site.git
#cd ..

#echo "updating arc42.org-site"
#git clone https://github.com/arc42/arc42.org-site
#cd arc42.org-site
#git submodule update --remote
#git commit -m "updated subtle-ads $(date +%Y-%m-%d)"
#git push https://gernotstarke:c6452598cc23dc84e8f21389e3f888c48da41b91@github.com/arc42/arc42.org-site.git
#cd ..

echo $'...done'
