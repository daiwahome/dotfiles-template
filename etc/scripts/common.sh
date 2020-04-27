#!/usr/bin/env bash
set -eu

# The directory includes dotfiles
home="$DOTPATH/home"

# Change permissions for directories
function set_permission() {
    umask 022
}

# Return the path trimed parent path
function trim_parentpath() {
    local path="$1"
    local parent="$2"

    echo "${path##*$parent/}"
}

# Make directory if it does not exsit
function mkdir_with_check() {
    local path="$1"

    if [ ! -d "$path" ]; then
        mkdir -p "$path"
    fi
}

# Call specified callback with $home
function do_home() {
    local callback="$@"
    local target

    while IFS='
' read -r target; do
        local name="$(trim_parentpath "$target" "$home")"

        $callback "$HOME" "$target" "$name"
    done <<EOS
$(find "$home" -type f)
EOS
}
