,# Shell Scripting

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


We will focus on the bash shell

## More in-depth tutorial

https://www.youtube.com/watch?v=cQepf9fY6cE&list=PLS1QulWo1RIYmaxcEqw5JhK3b-6rgdWO_