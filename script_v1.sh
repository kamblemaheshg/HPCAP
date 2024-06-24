#!/bin/bash

# Prompt user for input
echo "Choose your target device: "
read device

echo "Choose your output folder: "
read folder

echo "Exe path: "
read exe


cmd1="module load advisor/latest"
echo "Loading Advisor module..."
$cmd1


cmd3="chmod +x $exe"
echo "Making executable file executable..."
$cmd3


cmd2="advisor --collect=offload --config=$device --project-dir=$folder -- .$exe"
echo "Running Advisor command..."
$cmd2