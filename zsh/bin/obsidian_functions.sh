#!/bin/zsh

# Directory containing markdown files
VAULT_DIR="$HOME/projects/Obsidian/"
SOURCE_DIR="zettlekasten"
DEST_DIR="notes"

og() {

	# Iterate through all markdown files in the source directory
	find "$VAULT_DIR/$SOURCE_DIR" -type f -name "*.md" | while read -r file; do
		echo "Processing $file"

		# Extract the tag from the file. This assumes the tag is on the line immediately following "tags:"
		tag=$(awk '/tags:/{getline; print; exit}' "$file" | sed -e 's/^ *- *//' -e 's/^ *//;s/ *$//')

		echo "Found tag $tag"

		# If a tag is found, proceed with moving the file
		if [ ! -z "$tag" ]; then
			# Create the target directory if it doesn't exist
			TARGET_DIR="$VAULT_DIR/$DEST_DIR/$tag"
			mkdir -p "$TARGET_DIR"

			# Move the file to the target directory
			mv "$file" "$TARGET_DIR/"
			echo "Moved $file to $TARGET_DIR"
		else
			echo "No tag found for $file"
		fi

	done

	echo "Done 🪷"
}


on() {
    if [ "$#" -lt 1 ]; then
        echo "Error: A file name must be set, e.g. on \"the wonderful thing about tiggers\"."
        return 1
    fi

    file_name=$(date "+%Y-%m-%d")_${1// /-}.md
    destination="$HOME/projects/Obsidian/inbox/$file_name"

    if ! cd "$HOME/projects/Obsidian/"; then
        echo "Error: Could not navigate to directory."
        return 1
    fi

    touch "$destination" || { echo "Error: Unable to create file."; return 1; }
    nvim "$destination" || { echo "Error: Unable to open file in editor."; return 1; }
}

