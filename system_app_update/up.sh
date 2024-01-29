#!/bin/bash

# Function to check Flatpak updates
check_flatpak_updates() {
    # Check for Flatpak updates
    flatpak_updates=$(flatpak list --app --columns=name,version,size)
    flatpak_count=$(echo "$flatpak_updates" | wc -l)
    if [ -n "$flatpak_updates" ]; then
        # echo "$flatpak_updates"
        # clear
        flatpak list --app --columns=name,version,size
        echo "-------------------------------------------------------------------"
        echo "Flatpak Updates available ($flatpak_count packages):"
        echo "-------------------------------------------------------------------"
        read -p "Do you want to update Flatpak packages? (y/n): " update_flatpak
        if [ "$update_flatpak" == "y" ]; then
            flatpak update -y
            if [ $? -ne 0 ]; then # Check exit code of flatpak update
                echo "Error updating Flatpak packages."
            fi
        fi
    else
        echo "-------------------------------------------------------------------"
        echo "No Flatpak updates available."
        echo "-------------------------------------------------------------------"

    fi
}

# Function to check APT updates
check_apt_updates() {
    # Check for APT package updates
    apt_updates=$(sudo apt-get --just-print upgrade | awk '/^Inst/ {print $2}')
    apt_count=$(echo "$apt_updates" | wc -l)
    if [ -n "$apt_updates" ]; then
        echo "$apt_updates"
        echo "-------------------------------------------------------------------"
        echo "APT Updates available ($apt_count packages):"
        echo "-------------------------------------------------------------------"
        read -p "Do you want to update APT packages? (y/n): " update_apt
        if [ "$update_apt" == "y" ]; then
            sudo apt update -y && sudo apt-get upgrade -y
            if [ $? -ne 0 ]; then # Check exit code of apt-get upgrade
                echo "Error updating APT packages."
            fi
        fi
    else
        echo "-------------------------------------------------------------------"
        echo "No APT updates available."
        echo "-------------------------------------------------------------------"
    fi
}

# Run update checks
check_apt_updates
check_flatpak_updates

# flatpak list --app --columns=application,name,runtime,arch,branch,version
