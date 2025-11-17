# symlink scripts into ~/bin directory and add to PATH if not already present
#!/bin/bash

BIN_DIR="$HOME/bin"

# Create ~/bin directory if it doesn't exist
mkdir -p "$BIN_DIR"

# Symlink all scripts from the current directory to ~/bin
for script in ./scripts/*; do
    script_name=$(basename "$script")
    ln -sf "$(pwd)/scripts/$script_name" "$BIN_DIR/$script_name"
done

# Add ~/bin to PATH if not already present
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$HOME/.zshrc"
    export PATH="$BIN_DIR:$PATH"
fi