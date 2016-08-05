# Copy the filename from the argument
file="$1"

hnum=0

# This is for use by figlet and fmt( center text )
COLUMNS=$(tput cols) 

# Hack to get the pause before next slide working
exec 3<&0

# Report error on template file not available
if ! [ -f "$file" ];
then
   echo "Template file not found!"
   exit 1
fi

# Function to print the heading
printheading(){
    clear && echo "\n\n\n\n\n\n\n\n" && figlet -f script -c -w $COLUMNS "$*" | lolcat && echo "\n\n\n"
}

#Function to print ordinary line
printline(){
    printf "%*s\n" $(( ( $(echo $* | wc -c ) + $COLUMNS ) / 2 )) "$*"
}

# Work on the template file
while IFS= read line
do
    beg=${line:0:1}
    # Check for heading (denoted by # in the first place)
    if [ "$beg" = "#" ]; then
        heading=("${line[@]:1}")
        # Cannot do normal read as it just considers read from the file
        if [ "$hnum" -eq 1 ]; then
            read choice <&3
        fi
        hnum=1
        # Print heading ( hopefully its beautiful and readable )
        printheading "$heading"
    else
        # Print description text line by line
        printline "$line"

    fi
done <"$file"

# Final wait befor going back to the shell
read choice <&3
clear
