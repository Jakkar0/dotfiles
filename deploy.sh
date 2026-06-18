#!/usr/bin/env bash

for dir in *; do
        [ -d "$dir" ] || continue
        if grep -qx "$dir" .disabled 2>/dev/null; then
                echo "Skipped deploying config $dir since it's listed in .disabled"
                continue
        fi
        stow -v -t "$HOME" "$dir"
        echo "Deployed config $dir"
done
