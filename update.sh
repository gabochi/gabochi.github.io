#!/bin/bash

echo restarting index.html
rm index.html
cp base.html index.html

echo adding posts
for filename in $(ls posts/* | sort)
do
	sed "35a <h2 id=\"${filename:6}\">${filename}</h2> <p> $(cat ${filename}) </p>" index.html -i && echo ${filename} added || echo ${filename} failed
done

echo pushing repository
git add .
git commit -m "updated with script"
git push

