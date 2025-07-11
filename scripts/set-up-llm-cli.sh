#! /bin/bash
set -e

# Check if llm CLI tool exists
if ! command -v llm &> /dev/null; then
    echo "llm CLI tool not found. Installing..."
    
    # Check if Homebrew is installed
    if command -v brew &> /dev/null; then
        echo "Using Homebrew to install llm..."
        brew install llm
    else
        echo "Homebrew not found. Using pip3 to install llm..."
        pip3 install llm
    fi
else
    echo "llm CLI tool is already installed."
fi

# Install Gemini llm plugin
echo "Installing Gemini llm plugin..."
llm install llm-gemini

# Set up llm CLI tool with default model
echo "Setting gemini-2.0-flash as default model..."
llm models default gemini-2.0-flash

echo "Setup complete!"
