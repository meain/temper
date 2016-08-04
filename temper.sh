file="$1"

# This is for use by figlet( center text )
COLUMNS=$(tput cols) 

# Report error on template file not available
if ! [ -f "$file" ];
then
   echo "Template file not found!"
   exit 1
fi

# Work on the template file
while IFS= read line
do
    beg=${line:0:1}
    # Check for heading (denoted by # in the first place)
    if [ "$beg" = "#" ]; then
        heading=("${line[@]:1}")
        # Print heading ( hopefully its beautiful and readable )
        clear && echo "\n\n\n\n\n\n\n\n\n\n\n" && figlet -f script -c -w $COLUMNS "$heading" | lolcat && echo "\n\n\n"
    else
        # Print description text line by line
        echo "$line" | fmt -c -w $COLUMNS
    fi
done <"$file"


