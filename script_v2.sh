#!/bin/bash

allowed_devices=("intel" "intel12" "gpu" "xehpg_256xve" "gen12_tgl" "xehpg_512xve" "gen11_icl" "gen9_t2" "gen9_t3" "gen9_t4")

while true; do
    # Prompt user for input
    echo "Choose your target device: "
    read -r device

    # Check if device is one of the allowed values
    if ! [[ "${allowed_devices[*]}" =~ "$device" ]]; then
        echo "Invalid device. Please choose one of the following: ${allowed_devices[*]}"
        continue
    fi

    echo "Choose your output folder: "
    read -r folder

    echo "Exe path: "
    read -r exe

    # Load Advisor module
    echo "Loading Advisor module..."
    if ! module load advisor/latest; then
        echo "Failed to load Advisor module. Retrying..."
        continue
    fi

    # Make executable file executable
    echo "Making executable file executable..."
    if ! chmod +x "$exe"; then
        echo "Failed to make executable file executable. Retrying..."
        continue
    
    else
        break
    fi


    # Run Advisor command
    echo "Running Advisor command..."
    
done


advisor --collect=offload --config="$device" --project-dir="$folder" -- "./$exe"