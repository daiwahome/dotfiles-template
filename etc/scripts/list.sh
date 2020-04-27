#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.sh

# List dotfiles
function list_dotfiles() {
    local path="$1"
    local target="$2"
    local name="$3"

    echo $name
}

do_home list_dotfiles
