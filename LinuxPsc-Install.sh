#!/bin/bash

# Define the PowerShell version and package name
PS_VERSION="7.4.6"
PS_PACKAGE="powershell_${PS_VERSION}-1.deb_amd64.deb"

# Download the latest PowerShell .deb package from GitHub
echo "Downloading PowerShell version ${PS_VERSION}..."
wget -q "https://github.com/PowerShell/PowerShell/releases/download/v${PS_VERSION}/${PS_PACKAGE}"

# Check if download succeeded
if [[ ! -f "${PS_PACKAGE}" ]]; then
  echo "Download failed. Please check the version and URL."
  exit 1
fi

# Install the package using dpkg
echo "Installing PowerShell..."
sudo dpkg -i "${PS_PACKAGE}"

# Fix any dependency issues
echo "Fixing dependencies..."
sudo apt-get install -f -y

# Clean up
echo "Cleaning up downloaded package..."
rm "${PS_PACKAGE}"

echo "PowerShell installation completed successfully. You can run it with 'pwsh'."
