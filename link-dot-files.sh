#/bin/sh

for FILE in $(find dot-files -type f)
do
    FULL="$(pwd)"/"$FILE"
    echo "Creating link of $FULL in home directory."
    ln -s "$FULL" ~
done
