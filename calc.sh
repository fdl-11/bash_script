#!/bin/bash

echo "#------------------------------------#"
echo "|      Calculator v1 with bash       |"
echo "#------------------------------------#"
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
	echo "# How to use #"
	echo "Syntax: ./calc.sh <operator> <first_number> <second_number>"
	echo "Example: ./calc.sh -p 1337 404"
	echo "Output: 1341"
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
	echo "Type './calc.sh -h' for more detail informations..."
	exit 1
fi

if [ $opr == "-p" ]; then
	symbol="+"
	result=$(($num1 + $num2))
#	result=$(expr $num1 + $num2)		# you can use both
elif [ $opr == "-m" ]; then
	symbol="-"
	result=$(($num1 - $num2))
#	result=$(expr $num1 - $num2)
elif [ $opr == "-t" ]; then
	symbol="x"
	result=$(($num1 * $num2))
#	result=$(expr $num1 \* $num2)
elif [ $opr == "-d" ]; then
	symbol="/"
	result=$(($num1 / $num2))
#	result=$(expr $num1 \/ $num2)
elif [ $opr == "-o" ]; then
	symbol="%"
	result=$(($num1 % $num2))
#	result=$(expr $num1 \% $num2)
elif [ $opr == "-e" ]; then
	symbol="^"
	result=$(($num1 ** $num2))
#	result=$(expr $num1 \*\* $num2)
else
	echo "Invalid Operators or Arguments"
	echo "Type './calc.sh -h' for more detail informations..."
	exit 1
fi

echo "First Number  : $num1"
echo "Second Number : $num2"
echo "Result        : $num1 $symbol $num2"
echo "              : $result"
