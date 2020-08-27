# HW-Script
Organizes your assignents & creates boilerplate homework tex files

## How it Works

The script only needs one argument, which defines the homework number. The script then takes in your name, class name, and professor name, and store it all in a text file. Using this info it will automatically create a directory for the assignment and generate a tex file inside.

## How to Use:
Copy `create.sh` into whatever folder you want to store your homework files with `cp`. Example: `cp create.sh ~/Documents/School/Algorithms/create.sh`

Type `chmod u+x create.sh`.

Run the script with your homework number. Example: `./create.sh 1`

### OR
Just use this repo as a template! (Don't forget your TeX .gitignore)
