# iteration 1

# go to /content/micropost
# for each file...
    # cat the file

cd content/micropost/
for file in *.md
do 
    echo `basename $file`
done