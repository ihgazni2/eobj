pip3 uninstall eobj
git rm -r dist
git rm -r build
git rm -r eobj.egg-info
rm -r dist
rm -r build
rm -r eobj.egg-info
git add .
git commit -m "remove old build"

