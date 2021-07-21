#!/bin/bash

echo restarting index.html
rm index.html
cp base.html index.html

echo adding posts
for filename in $(ls posts/* | sort)
do
	sed "35a <h2 id=\"${filename:6}\">${filename}</h2> <p> $(cat ${filename}) </p>" index.html -i && echo ${filename} added || echo ${filename} failed
	allposts="<a href=\"#${filename:6}\">${filename:6}</a>${allposts}"
done

echo adding links
sed "36a ${allposts}" index.html -i

#[ $1 != "" ] && exit

echo pushing repo
git add .
git commit -m "updated with script"
git push

