#! /bin/bash

# ECHO COMMAND
# echo Scripting!

# VARIABLES
# Uppercase by convention
# Letters, number, underscores
NAME="Jacques"
# echo "My name is $NAME"

# USER INPUT
# read -p "Enter your name: " NAME 
# echo "Hello $NAME, nice to meet you"

# SIMPLE IF STATEMENT
# if [ "$NAME" == "Johnny" ]
# then
#     echo "Your name is Johnny"
# fi

# # IF-ELSE STATEMENT
# if [ "$NAME" == "Johnny" ]
# then
#     echo "Your name is Johnny"
# else 
#     echo "Your name is not Johnny"
# fi

# # ELSE-IF
# if [ "$NAME" == "Johnny" ]
# then
#     echo "Your name is Johnny"
# elif [ "$NAME" == "Jacque" ]
# then
#     echo "Your name must be Jacque"
# else 
#     echo "Your name is not Johnny nor Jacque"
# fi

# # Comparison

# NUM1=31
# NUM2=5
# if [ "$NUM1" -gt "$NUM2" ]
# then 
#     echo "$NUM1 is greater than $NUM2"
# else
#     echo "$NUM1 is less than $NUM2"
# fi

# # File conditions
# FILE="test.txt"
# if [ -e "$FILE" ]
# then 
#     echo "$FILE is a file"
# else
#     echo "$FILE is not a file"
# fi

# #Case statement
# read -p "Are you over 21? y/n" ANSWER
# case "$ANSWER" in
#     [yY] | [yY][eE][sS])
#         echo "You can have a beer!"
#         ;;
#     [nN] | [nN][oO])
#         echo "Sorry, no drinking"
#         ;;
#     *)
#         echo "Please enter y/yes or n/no"
#         ;;
# esac

# # Simple for loop
# NAMES="Brad Kevin Alice Mark"
# for NAME in $NAMES
#     do
#         echo "Hello $NAME"
#     done

# # For loop to rename files
# FILES=$(ls *.txt)
# NEW="new"
# for FILE in $FILES 
#     do  
#         echo "Renaming $FILE to $NEW-$FILE"
#         mv $FILE $NEW-$FILE
# done

# # While loop - read through a file line by line
# LINE=1
# while read -r CURRENT_LINE
#     do 
#         echo "$LINE: $CURRENT_LINE"
#         ((LINE++))
# done < "./new-new-1.txt"

# # Function

# function saySomething(){
#     echo "Something"
# }

# saySomething

# # Function with params
# function greet(){
#     echo "Hello, I am $1 and I am $2"
# }

# greet "Yon" "Happy"

# Creat folder and write to a file
mkdir hello
touch "hello/world.txt"
echo "Hello there" >> "hello/world.txt"
echo  "Created hello/world.txt"
cat "hello/world.txt"