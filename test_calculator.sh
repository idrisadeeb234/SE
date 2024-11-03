#!/bin/bash

# Path to the calculator script
calculator_script="./calculator.sh"

# Test cases (format: "num1 num2 operation expected_output")
tests=(
    "3 5 + 8"
    "10 2 - 8"
    "7 6 * 42"
    "8 2 / 4"
    "5 0 / Division by zero error!"
)

# Function to run the calculator script and capture its output
run_test() {
    local num1=$1
    local num2=$2
    local op=$3
    local expected=$4

    # Run the calculator script with inputs
    output=$(echo -e "$num1\n$num2\n$op" | bash "$calculator_script")

    # Check if the output matches the expected result
    if [[ "$output" == *"$expected"* ]]; then
        echo "Test passed: $num1 $op $num2 = $expected"
    else
        echo "Test failed: $num1 $op $num2 (Expected: $expected, Got: $output)"
    fi
}

# Run all test cases
for test in "${tests[@]}"; do
    run_test $test
done

