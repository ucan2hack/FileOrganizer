#!/bin/bash

# Directories for organizing files
IMAGE_DIR="Images"
DOC_DIR="Documents"
TEXT_DIR="TextFiles"
LOG_FILE="file_movement.log"

# Check if directories exist; if not, create them
[ ! -d "$IMAGE_DIR" ] && mkdir "$IMAGE_DIR"
[ ! -d "$DOC_DIR" ] && mkdir "$DOC_DIR"
[ ! -d "$TEXT_DIR" ] && mkdir "$TEXT_DIR"

# Create or clear the log file
echo "File movement log - $(date)" > "$LOG_FILE"
echo "---------------------------------" >> "$LOG_FILE"

# Define function to log movement
log_movement() {
    local file=$1
    local destination=$2
    echo "$(date): Moved $file to $destination" >> "$LOG_FILE"
}

# Move files by type and log each movement

# Image files
for file in *.jpg *.jpeg *.png *.gif; do
    [ -e "$file" ] || continue  # skip if no files match
    mv "$file" "$IMAGE_DIR"
    log_movement "$file" "$IMAGE_DIR"
done

# Document files
for file in *.pdf *.doc *.docx *.xls *.xlsx; do
    [ -e "$file" ] || continue
    mv "$file" "$DOC_DIR"
    log_movement "$file" "$DOC_DIR"
done

# Text files
for file in *.txt *.md; do
    [ -e "$file" ] || continue
    mv "$file" "$TEXT_DIR"
    log_movement "$file" "$TEXT_DIR"
done

# Optional: Organize files within each directory by date or size
# Uncomment the next lines to organize by size
# cd "$IMAGE_DIR" && ls -lS
# cd "$DOC_DIR" && ls -lS
# cd "$TEXT_DIR" && ls -lS

# Uncomment the next lines to organize by date
# cd "$IMAGE_DIR" && ls -lt
# cd "$DOC_DIR" && ls -lt
# cd "$TEXT_DIR" && ls -lt

echo "File organization complete. Check '$LOG_FILE' for details."

