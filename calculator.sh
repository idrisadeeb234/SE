#!/bin/bash

# Calculator function
calculate() {
  case "$2" in
    "+")
      result=$(echo "$1 + $3" | bc)
      ;;
    "-")
      result=$(echo "$1 - $3" | bc)
      ;;
    "*")
      result=$(echo "$1 * $3" | bc)
      ;;
    "/")
      if [ "$3" -eq 0 ]; then
        result="Error: Division by zero"
      else
        result=$(echo "$1 / $3" | bc)
      fi
      ;;
    *)
      result="Invalid operator"
      ;;
  esac
  echo "$result"
}

# Check if arguments are passed
if [ $# -ne 3 ]; then
  echo "Usage: $0 num1 operator num2"
  exit 1
fi

# Perform calculation
calculate "$1" "$2" "$3"

