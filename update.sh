#!/bin/bash

echo restarting index.html
rm index.html
cp base.html index.html

echo adding posts
for filename in $(ls posts/* | sort)
do
	sed "35a <h3 id=\"${filename:6}\">${filename}</h3> <p> $(cat ${filename}) </p>" index.html -i && echo ${filename} added || echo ${filename} failed
	allposts="${allposts}<a href=\"#${filename:6}\">${filename:6}</a>"
done

sed "35a ${allposts}" index.html -i

echo pushing repository
git add .
git commit -m "updated with script"
git push

