#!/bin/bash

rm index.html
cp base.html index.html

for filename in $(ls posts/* | sort)
do
	sed "35a <p><a href=\"#${filename:6}\">${filename}</a> $(cat ${filename}) </p>" index.html -i
done

git add .
git commit -m "updated with script"
git push

