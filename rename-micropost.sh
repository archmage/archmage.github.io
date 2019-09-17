# go to /content/micropost
# for each file...
    # read the date text from the file
    # format the date text to YYYYMMDD-HHMMSS
    # rename the file to YYYYMMDD-HHMMSS.md

files="*.md"
regex="date.+?([0-9].+[0-9])"
dateInputFormat="%Y-%m-%dT%T%z"
dateOutputFormat="%Y%m%d-%H%M%S"

# (The below function comes from https://stackoverflow.com/a/47438110/3702702)
#
# Convert one date format to another
# 
# Usage: convert_date_format <input_format> <date> <output_format>
#
# Example: convert_date_format '%b %d %T %Y %Z' 'Dec 10 17:30:05 2017 GMT' '%Y-%m-%d'
convert_date_format() {
  local INPUT_FORMAT="$1"
  local INPUT_DATE="$2"
  local OUTPUT_FORMAT="$3"
  local UNAME=$(uname)

  if [[ "$UNAME" == "Darwin" ]]; then
    # Mac OS X
    date -j -f "$INPUT_FORMAT" "$INPUT_DATE" +"$OUTPUT_FORMAT"
  elif [[ "$UNAME" == "Linux" ]]; then
    # Linux
    date -d "$INPUT_DATE" +"$OUTPUT_FORMAT"
  else
    # Unsupported system
    echo "Unsupported system"
  fi
}

# Execution starts here.
changeCount=0
cd content/micropost/
for file in $files
do 
    # the cut here is stupid, but it works
    # older cut: cut -c 1-22,24-25
    date=$( perl -lne 'print $1 if /date.+?([0-9].+[0-9])/' $file | cut -c 1-19 )

    # format with the above function
    dateFormatted=$( convert_date_format $dateInputFormat $date $dateOutputFormat )
    
    # rename file to dateFormatted.md
    if [[ "$dateFormatted.md" != $file ]]
    then
        mv -v $file "$dateFormatted.md"
        ((++changeCount))
    fi 
done
echo "Files changed: $changeCount"