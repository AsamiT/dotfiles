#!/bin/bash

MASTER=out
HTML=html
MD=md
PDF=pdf

if [ -d "$MASTER" ]; then
    echo "Deleting output folder..."
    rm -rf "$MASTER"
fi
echo "Folder removed."
echo "Creating new output folders..."
mkdir -p "$MASTER"/"$HTML"
mkdir -p "$MASTER"/"$MD"
mkdir -p "$MASTER"/"$PDF"
for FILE in "$@"
do
    echo "Exporting $FILE to html."
    pandoc -s "$FILE">> ./"$MASTER"/"$HTML"/"${FILE%%.*}".html
done
echo "All files exported to HTML."
for FILE in "$@"
do
    echo "Exporting $FILE into markdown..."
    pandoc -s "$FILE" -t markdown -o ./"$MASTER"/"$MD"/"${FILE%%.*}".md
done
echo "All files exported to markdown."
for FILE in "$@"
do
	echo "Exporting $FILE into a PDF..."
	pandoc -s "$FILE" -o ./"$MASTER"/"$PDF"/"${FILE%%.*}".pdf
done
echo "All files exported to PDF."
