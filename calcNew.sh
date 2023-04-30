#!/bin/bash

echo "#--------------------------------------#"
echo "|      Calculator v1.2 with bash       |"
echo "#--------------------------------------#"
echo -e

opr=$1
num1=$2
num2=$3

if [ $1 == "-h" ] && [ -z $2 ] && [ -z $3  ]; then
	echo "# Author #"
	echo "Created by Fadli D"
	echo "Github : @fdl-11"
	echo "Twitter : @11_fdl"
	echo -e
	echo "# Updated v1.2 #"
	echo "Now you can calculate decimal numbers in this version..."
	echo "Why create a new script instead of updating the existing one(v1) ?"
	echo "Because these two scripts have slightly different syntax usage, and I want to retain these syntaxes as notes/knowledge."
	echo -e
	echo "# How to use #"
	echo "Notes: Before you run this program, you must install \"bc\""
	echo "       >> sudo apt-get install bc"
	echo "To calculate decimal numbers, use a dot(.) instead of a comma(,)"
	echo "Syntax: ./calc.sh <operator> <first_number> <second_number>"
	echo "Example: ./calc.sh -p 4.1 3.6"
	echo "Output: 7.7"
	echo -e
	echo "If you want to adjust the number of decimal digits displayed in the result of the division operation, modify the source code on line 61. Change the value on \"scale\"."
	echo -e
	echo "# Operator #"
	echo "-p : addition (+)"
	echo "-m : substraction (-)"
	echo "-t : multiplication (*)"
	echo "-d : division (/)"
	echo "-o : modulus (%)"
	echo "-e : exponent (^)"
	exit 1
elif [ $# -ne 3 ]; then
	echo "Invalid amount of arguments!"
	echo "Syntax: ./calc.sh <operation> <first_number> <second_number>"
	echo "Example: ./calc.sh -p 1337 404"
	echo "       : ./calc/sh -t 1.5 5.2"
	echo "Type './calc.sh -h' for more detail informations..."
	exit 1
fi

if [ $opr == "-p" ]; then
	symbol="+"
	result=$(echo "$num1 + $num2" | bc)
elif [ $opr == "-m" ]; then
	symbol="-"
	result=$(echo "$num1 - $num2" | bc)
elif [ $opr == "-t" ]; then
	symbol="x"
	result=$(echo "$num1 * $num2" | bc)
elif [ $opr == "-d" ]; then
	symbol="/"
	result=$(echo "scale=2; $num1 / $num2" | bc)		# Change the value on "scale" to adjust the number of decimal digits displayed.
elif [ $opr == "-o" ]; then
	symbol="%"
	result=$(echo "$num1 % $num2" | bc)
elif [ $opr == "-e" ]; then
	symbol="^"
	result=$(echo "scale=10; $num1 ^ $num2" | bc)
else
	echo "Invalid Operators or Arguments"
	echo "Type './calc.sh -h' for more detail informations..."
	exit 1
fi

echo "First Number  : $num1"
echo "Second Number : $num2"
echo "Result        : $num1 $symbol $num2"
echo "              : $result"
