#!/bin/bash

# Vars
CONFIG=config.txt
TEMPLATE=template.tex
hwNum=$1
newDir="hw-"$hwNum
test="test"

# Check for config file
if test -f "$CONFIG"; then 
  while IFS= read -r line
  do
    if [[ "$line" == *"CLASSNAME"* ]]; then
    class=${line#*: }
    fi
    if [[ "$line" == *"AUTHOR"* ]]; then
      author=${line#*: }
    fi
  done < $CONFIG
else
  echo "config file does not exist!"
  read -p "Enter your name: " authorName
  read -p "Enter class name: " className
  echo "AUTHOR: $authorName" >> $CONFIG
  echo "CLASSNAME: $className" >> $CONFIG
  author=$authorName
  class=$className
  echo "Config file created"
fi

# Create folder & add latex file
if [ -z "$hwNum" ]; then
  echo "Missing assignment number. Please run the script with an integer as a parameter."
else
  mkdir -p $newDir
  titleStuff="\\\title{$class Homework $hwNum}\n\\\author{$author}\n\\\date{\\\today}\n"
            
  # Read template tex file
  if test -f "$TEMPLATE"; then 
    cp $TEMPLATE $newDir/hw-$hwNum.tex
    bgn='\\begin{document}'
    # sed -i "s,'\'$bgn,$titleStuff\n$bgn," "$newDir/hw-$hwNum.tex"
    sed -i "s/$bgn/$titleStuff\n$bgn\n/" "$newDir/hw-$hwNum.tex"
  else
    echo "template file does not exist. Creating template file..."
    echo "\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{natbib}
\usepackage{graphicx}
\usepackage{listings}
\usepackage{color}

\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{maroon}{rgb}{0.5,0,0}

\lstset{frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{maroon},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}

% INJECT TITLE HERE
\begin{document}
\maketitle

\begin{enumerate}
  \item 
\end{enumerate}
\end{document}
" > template.tex
  # finish
  echo "New folder & HW file created!"
  fi
fi