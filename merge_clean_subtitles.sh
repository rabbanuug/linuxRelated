#!/bin/bash

# Define Source and Destination folders manually
SOURCE_FOLDER="/home/sky/Downloads/Udemy - Python Django Build a Subscription Platform - 2024 2024-8"
DESTINATION_FOLDER="/home/sky/Desktop/srt files from the course"

# Define output files
MERGED_FILE="$DESTINATION_FOLDER/merged.txt"
CLEANED_FILE="$DESTINATION_FOLDER/cleaned.txt"

# Function to merge all .srt and .vtt files into a single text file
merge_subtitles() {
    > "$MERGED_FILE"  # Clear previous file
    echo "Merging subtitles..."
    find "$SOURCE_FOLDER" -type f \( -iname "*.srt" -o -iname "*.vtt" \) | sort | while read -r file; do
        cat "$file" >> "$MERGED_FILE"
        echo -e "\n\n" >> "$MERGED_FILE"
    done
}

clean_subtitle_lines() {
    # Usage: clean_subtitle_lines inputFile outputFile
    local inFile="$1"
    local outFile="$2"

    # Remove lines that:
    #  1) Are just numbers
    #  2) Contain SRT/VTT timestamps
    #  3) Are blank
    sed -E '
        /WEBVTT/d;
        /^[0-9]+$/d;
        /^[0-9]{2}:[0-9]{2}(:[0-9]{2})?[.,][0-9]+ --> [0-9]{2}:[0-9]{2}(:[0-9]{2})?[.,][0-9]+/d;
        /^\s*$/d;
    ' "$inFile" > "$outFile"
}

join_non_period_lines() {
    # Usage: join_non_period_lines inputFile outputFile
    local inFile="$1"
    local outFile="$2"

    # Join the next line if the current line does NOT end with a period
    # Insert a space where the newline used to be
    sed -E '
        :join
        /[^.]$/ {
            N
            s/\n/ /
            b join
        }
    ' "$inFile" > "$outFile"
}

clean_subtitles() {
    local input="$MERGED_FILE"
    local output="$CLEANED_FILE"

    echo "Cleaning file: $input"
    
    # Start with a blank output file
    echo "" > "$output"

    # Create a temporary file for intermediate results
    local tempFile="$(mktemp)"

    # Step 1: Remove numbers, timestamps, and blank lines
    clean_subtitle_lines "$input" "$tempFile"

    # Step 2: Join lines that don't end in a period
    join_non_period_lines "$tempFile" "$output"

    # Optional: Remove the temporary file
    rm -f "$tempFile"

    echo "✅ Cleaned subtitles saved to $output"
}

# Main function
main() {

    merge_subtitles
    clean_subtitles
    echo "✅ All tasks completed successfully!"
}

# Run the script
main