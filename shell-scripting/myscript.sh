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

# File conditions
FILE="test.txt"
if [ -e "$FILE" ]
then 
    echo "$FILE is a file"
else
    echo "$FILE is not a file"
fi