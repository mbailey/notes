# Get the directory containing the calling script, following symlinks
get_script_dir() {
    if command -v realpath &> /dev/null; then
        dirname -- "$(realpath "${BASH_SOURCE[1]}")"
    else
        # Fallback implementation for systems without realpath
        local source="${BASH_SOURCE[1]}"
        local dir
        
        # Resolve symlinks using readlink if available
        if command -v readlink &> /dev/null; then
            while [ -L "$source" ]; do
                dir="$(cd -P "$(dirname "$source")" && pwd)"
                source="$(readlink "$source")"
                # Handle relative symlinks
                [[ $source != /* ]] && source="$dir/$source"
            done
        fi
        
        # Get absolute path
        dir="$(cd -P "$(dirname "$source")" && pwd)"
        echo "$dir"
    fi
}
