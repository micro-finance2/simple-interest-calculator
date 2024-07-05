#!/bin/bash

# Function to calculate simple interest
calculate_simple_interest() {
  principal=$1
  rate=$2
  time=$3
  interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
  echo "The Simple Interest is: $interest"
}

# Check if the user has provided all three arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 principal rate time"
  echo "Example: $0 1000 5 3"
  exit 1
fi

# Read the command line arguments
principal=$1
rate=$2
time=$3

# Validate that the inputs are numbers
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: All inputs must be positive numbers."
  exit 1
fi

# Calculate and display the simple interest
calculate_simple_interest $principal $rate $time
