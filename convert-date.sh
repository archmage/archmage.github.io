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

# Example: 'Dec 10 17:30:05 2017 GMT' => '2017-12-10'
convert_date_format '%b %d %T %Y %Z' 'Dec 10 17:30:05 2017 AEST' '%Y-%m-%d'

# 2019-09-05T08:53:37+10:00

dateInputFormat="%Y-%m-%dT%T%z"
date="$(echo 2019-09-05T08:53:37+10:00 | cut -c 1-22,24-25)" # this is stupid but it works
dateOutputFormat="%Y%m%d-%H%M%S"

convert_date_format $dateInputFormat $date $dateOutputFormat