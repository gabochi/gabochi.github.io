#!/bin/bash

rm index.html
cp base.html index.html

for filename in $(ls posts/* | sort)
do
	echo ${filename} added
	sed "35a <p><a href=\"#${filename}\">${filename}</a> $(cat ${filename}) </p>" index.html -i
done

git add .
git commit -m "updated with script"
git push

