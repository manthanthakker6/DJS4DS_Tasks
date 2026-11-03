#!/bin/bash
# Simple Interest Calculator: Interest = (Principal * Rate * Time) / 100

echo "Enter Principal Amount:"
read principal

echo "Enter Rate of Interest per year (%):"
read rate

echo "Enter Time Period (in years):"
read time

# Calculate Simple Interest
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

echo "-----------------------------------"
echo "Simple Interest: $interest"
