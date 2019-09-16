# iteration 2

# go to /content/micropost
# for each file...
    # echo the date text

files="*.md"
regex="date.+?([0-9].+[0-9])"

cd content/micropost/
for file in $files
do 
    perl -lne 'print $1 if /date.+?([0-9].+[0-9])/' $file
done