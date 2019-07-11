# Shell Scripting

Followed this tutorial: https://www.youtube.com/watch?v=v-F3YLd6oMw

To see your available shells, and to see which shell you are working in 

```sh
cat /etc/shells
which bash
```
You must start your scripts with a shebang (#!) followed by the location of your bash, such as 
```sh
#! /bin/bash
```



## Steps

Go to the project directory, and create a shell script file, myscript.sh and make it an executable
```sh
touch myscript.sh
chmod +x myscript.sh
```

Once we are ready to run this file we can do so with the following command
```sh
./myscript.sh
```

# Cheat Sheet

Execute your script can do the following:

Output to the console:
```sh
echo Scripting!
```

**Variables:**
```sh
NAME="Sony"
echo "{NAME} Playstation 4"
```

**User Input:**
```sh
read -p "Enter your name: " NAME 
echo "Hello $NAME, nice to meet you"
```
**If statement:**
```sh
if [ "$NAME" == "Johnny" ]
then
    echo "Your name is Johnny"
fi
```

**IF-ELSE STATEMENT:**
```sh
if [ "$NAME" == "Johnny" ]
then
    echo "Your name is Johnny"
else 
    echo "Your name is not Johnny"
fi
```

**ELSE-IF:**
```sh
if [ "$NAME" == "Johnny" ]
then
    echo "Your name is Johnny"
elif [ "$NAME" == "Jacque" ]
then
    echo "Your name must be Jacque"
else 
    echo "Your name is not Johnny nor Jacque"
fi
```

**Comparison**

NUM1=31
NUM2=5
if [ "$NUM1" -gt "$NUM2" ]
then 
    echo "$NUM1 is greater than $NUM2"
else
    echo "$NUM1 is less than $NUM2"
fi

Additional arithmetic commands
```sh
########
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
########
```


**File conditions**
As long as a TEXT file exists with the given name, this returns true
```sh
FILE="test.txt"
if [ -f "$FILE" ]
then 
    echo "$FILE is a file"
else
    echo "$FILE is not a file"
fi
```

**While loop - read through a file line by line:**
```sh
LINE=1
while read -r CURRENT_LINE
    do 
        echo "$LINE: $CURRENT_LINE"
        ((LINE++))
done < "./new-new-1.txt" # Name of your text file here
```

Say we create a directory called test.txt, if we use the exists flag ( -e), this returns true
```sh
FILE="test.txt"
if [ -e "$FILE" ]
then 
    echo "$FILE is a file"
else
    echo "$FILE is not a file"
fi
```

Additional flags to use:
```sh
########
# -d file   True if the file is a directory
# -e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
# -f file   True if the provided string is a file
# -g file   True if the group id is set on a file
# -r file   True if the file is readable
# -s file   True if the file has a non-zero size
# -u    True if the user id is set on a file
# -w    True if the file is writable
# -x    True if the file is an executable
########
```

**Case statement:**
```sh
read -p "Are you over 21? y/n " ANSWER
case "$ANSWER" in
    [yY] | [yY][eE][sS])
        echo "You can have a beer!"
        ;;
    [nN] | [nN][oO])
        echo "Sorry, no drinking"
        ;;
    *)
        echo "Please enter y/yes or n/no"
        ;;
esac
```

**Simple for loop:**
```sh
NAMES="Brad Kevin Alice Mark"
for NAME in $NAMES
    do
        echo "Hello $NAME"
    done
```

**For loop to rename files:**
```sh
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES 
    do  
        echo "Renaming $FILE to $NEW-$FILE"
        mv $FILE $NEW-$FILE
done
```
**Function:**
```sh
function saySomething(){
    echo "Something"
}

saySomething
```

**Function with params:**
```sh
function greet(){
    echo "Hello, I am $1 and I am $2"
}

greet "Yon" "Happy"
```

**Create folder and write to a file:**
```sh
mkdir hello
touch "hello/world.txt"
echo "Hello there" >> "hello/world.txt"
echo  "Created hello/world.txt"
cat "hello/world.txt"
```



## More in-depth tutorial

https://www.youtube.com/watch?v=cQepf9fY6cE&list=PLS1QulWo1RIYmaxcEqw5JhK3b-6rgdWO_