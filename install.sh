#!/bin/sh
# 1. Ensure age is installed (simplistic check)
if ! command -v age >/dev/null; then
  sudo apt update && sudo apt install -y age curl
fi

# 2. Setup the directory
mkdir -p ~/.config/chezmoi

# 3. Decrypt the key (prompts for your passphrase)
age -d -o ~/.config/chezmoi/key.txt {{ .chezmoi.sourceDir }}/key.txt.age

# 4. Apply the dotfiles
chezmoi apply
