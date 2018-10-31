 #!/bin/bash
hugo
git status
git add content/ docs/
read -p "Enter commit message:" commit
git commit -am "$commit"
read -p "Push to master [y|n]?" push
case "$push" in
	y|Y ) git push origin master;;
    n|N ) exit;;
esac
