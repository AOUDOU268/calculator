#!/bin/bash

# Script to calculate Simple Interest
# Formula: Simple Interest = (P * R * T) / 100
# Where:
# P = Principal amount
# R = Rate of interest per year (%)
# T = Time period (in years)

echo "================================"
echo "  Simple Interest Calculator"
echo "================================"
echo ""

# Prompt user for Principal amount
echo -n "Enter Principal amount (P): "
read principal

# Prompt user for Rate of interest
echo -n "Enter Rate of interest per year (R in %): "
read rate

# Prompt user for Time period
echo -n "Enter Time period (T in years): "
read time

# Check if inputs are valid numbers
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]] || \
   ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo ""
    echo "Error: Please enter valid numeric values."
    exit 1
fi

# Calculate Simple Interest
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount (Principal + Interest)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "================================="
echo "           Results"
echo "================================="
echo "Principal Amount     : $principal"
echo "Rate of Interest     : $rate%"
echo "Time Period          : $time years"
echo "---------------------------------"
echo "Simple Interest      : $simple_interest"
echo "Total Amount         : $total_amount"
echo "================================="
