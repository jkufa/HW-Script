#!/bin/bash

# Vars
CONFIG=config.txt
hwNum=$1
newDir="hw-"$hwNum

# Check for config file
if test -f "$CONFIG"; then 
  while IFS= read -r line
  do
    if [[ "$line" == *"CLASSNAME"* ]]; then
    class=${line#*: }
      echo $class
    fi
    if [[ "$line" == *"PROFESSOR"* ]]; then
      professor=${line#*: }
      echo $professor
    fi
    if [[ "$line" == *"AUTHOR"* ]]; then
      author=${line#*: }
      echo $author
    fi
  done < $CONFIG
else
  echo "config file does not exist!"
  read -p "Enter your name: " authorName
  read -p "Enter class name: " className
  read -p "Enter professor name: " profName
  echo "AUTHOR: $authorName" >> $CONFIG
  echo "CLASSNAME: $className" >> $CONFIG
  echo "PROFESSOR: $profName" >> $CONFIG
  $author = $authorName
  $class = $className
  $professor = $profName
  echo "Config file created"
fi

# Create folder & add latex file
mkdir -p $newDir
echo "\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{natbib}
\usepackage{graphicx}

\title{$class HW $hwNum}
\author{$author}
\date{\today}

\begin{document}
\maketitle

\section*{Chapter \# Goes Here}
    \subsection*{Exercises}
            \subsection*{Excercise \# Here}
                \begin{enumerate}
                    \item
                \end{enumerate}
            \subsection*{Excercise \# Here}
                \begin{enumerate}
                    \item
                \end{enumerate}
        \subsection*{Problems}
        \begin{itemize}
            \item[]
            \end{itemize}
\end{document}" > $newDir/hw-$hwNum.tex

# finish
echo "New folder & HW file created!"

