#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.sh

# Remove symbolic links
function clean_dotfiles() {
    local path="$1"
    local target="$2"
    local name="$3"

    rm -fv "$path/$name"
}

do_home clean_dotfiles
