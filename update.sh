#!/bin/bash

cat index.txt > index.html

for file in $(ls -t posts/)
do
	echo "<a href=\"posts/${file}\">${file}</a><br>" >> index.html
done

echo "</div></html>" >> index.html

echo "Hacé un 'git push' para actualizar el remoto."
