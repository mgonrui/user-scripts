#!/bin/sh

# Source folder where you want to search for subfolders containing .mp4 and .flac files
source_folder="$HOME/downloads/nicotine"

# Destination folder where you want to move the subfolders
destination_folder="$HOME/media/audio/music"

path="/home/mgr/downloads/nicotine/"
while IFS= read -r -d $'\0' file; do
    result+=("$file") # Append each line to the array
done < <( find "$source_folder" -mindepth 1 -maxdepth 1 -type d -print0)

# Print the elements of the array (you can also use them as needed in your script)
for item in "${result[@]}"; do
    if [ -n "$(find "$item" -type f \( -name "*.mp3" -o -name "*.flac" \) -print -quit)" ]; then
            remove_path="${item/$path/}"
        if [ -d "$destination_folder/$remove_path" ]; then
            mv "$item/"* "$destination_folder/$remove_path/"
            rmdir "$item"
        else 
            mv "$item" "$destination_folder"
        fi

    fi
done
