#!/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Usage: $(basename "$0") [MIN_WIDTH] [MIN_HEIGHT] [DIR]"
    echo
    echo "Finds and deletes images below the specified resolution."
    echo
    echo "Arguments:"
    echo "  MIN_WIDTH   Minimum width in pixels  (default: 1920)"
    echo "  MIN_HEIGHT  Minimum height in pixels (default: 1080)"
    echo "  DIR         Directory to search       (default: current directory)"
    echo
    echo "Examples:"
    echo "  $(basename "$0")                        # filter below 1920x1080 in the default walpaper dir"
    echo "  $(basename "$0") 3840 2160              # filter below 4K in the default wallpaper dir"
    echo "  $(basename "$0") 3840 2160 ~/Wallpapers # filter below 4K in ~/Wallpapers"
    exit 0
fi

if [[ ! -x "$(command -v identify)" ]]; then
    echo "Error: 'identify' not found. Install ImageMagick: https://imagemagick.org" >&2
    exit 1
fi

MIN_WIDTH="${1:-1920}"
MIN_HEIGHT="${2:-1080}"
SEARCH_DIR="${3:-./wallpapers/standard/}"

if [[ ! -d "$SEARCH_DIR" ]]; then
    echo "Error: directory '$SEARCH_DIR' not found." >&2
    exit 1
fi

declare -a files_to_delete

while IFS= read -r -d '' file; do
    read width height < <(identify -format "%w %h" "$file" 2>/dev/null)

    if [[ -n "$width" && -n "$height" ]]; then
        if (( width < MIN_WIDTH || height < MIN_HEIGHT )); then
            files_to_delete+=("$file")
            printf '%s (%sx%s)\n' "$file" "$width" "$height"
        fi
    fi
done < <(find "$SEARCH_DIR" -maxdepth 1 -type f \( \
    -iname "*.jpg" -o \
    -iname "*.jpeg" -o \
    -iname "*.png" -o \
    -iname "*.gif" -o \
    -iname "*.bmp" -o \
    -iname "*.tif" -o \
    -iname "*.tiff" -o \
    -iname "*.webp" \
\) -print0)

if (( ${#files_to_delete[@]} == 0 )); then
    echo "No low-resolution images found."
    exit 0
fi

echo
echo "Found ${#files_to_delete[@]} low-resolution image(s)."
read -rp "Delete them? [y/N] " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    printf '%s\0' "${files_to_delete[@]}" | xargs -0 rm -f
    echo "Deleted ${#files_to_delete[@]} image(s)."
else
    echo "Nothing deleted."
fi
