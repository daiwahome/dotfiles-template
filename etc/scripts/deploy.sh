#!/usr/bin/env bash
set -eu

cd $(dirname $0)
source ./common.sh

# Deploy dotfiles
function deploy_dotfiles() {
    local path="$1"
    local target="$2"
    local name="$3"

    mkdir_with_check "$path"

    ln -fsv "$target" "$path/$name"
}

set_permission
do_home deploy_dotfiles
