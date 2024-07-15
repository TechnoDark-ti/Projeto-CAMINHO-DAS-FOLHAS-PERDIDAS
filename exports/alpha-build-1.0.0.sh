#!/bin/sh
echo -ne '\033c\033]0;CAMINHO DAS FOLHAS PERDIDAS\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/alpha-build-1.0.0.x86_64" "$@"
