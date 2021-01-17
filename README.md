# HW-Script
Organizes your assignments & creates boilerplate homework tex files

## How it Works

The script only needs one argument, which defines the homework number. Then, it automatically creates a folder for your assignment that contains a tex file.

During setup, a config file, `config.txt`, and a template tex, `template.tex`, is generated. The config file simply contains the name of the author and the class. The template file is a barebones tex file that is copied over to the assignment folder that is generated. This means the template file can be altered to fit the specific formatting for the class.

## How to Use:
Copy `create.sh` into whatever folder you want to store your homework files with `cp`. Example: `cp create.sh ~/Documents/School/Algorithms/create.sh`

Run the script with your assignment number. Example: `./create.sh 1`

### OR
Simply use this repo as a template! (Don't forget your TeX .gitignore)
