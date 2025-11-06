# This script sets up the OSDCloud environment for local use with Windows 11.
Install-Module -Name OSD -Force

# Import the OSD module
Import-Module -Name OSD -Force

# Check the OSD module version
Get-Module -Name OSD

# Create new OSDCloud environment for Windows 11
New-OSDCloudTemplate -SetInputLocale en-us

# Set the OSDCloud Template
Set-OSDCloudTemplate -Name default

# Copy Autopilot JSON file
Copy-Item -Path ".\osdcloud-dev\AutopilotConfigurationFile.json" -Destination "C:\ProgramData\OSDCloud\Config\AutopilotJSON\AutopilotConfigurationFile.json" -Force
# Copy osdcloud secret
Copy-Item -Path ".\osdcloud-dev\osdcloud.shh" -Destination "C:\ProgramData\OSDCloud\Config\Scripts\osdcloud.shh" -Force

# Set the OSDCloud environment to the local path
Set-OSDCloudWorkspace C:\SBCWin11

# Initial setup for the OSDCloud environment
Edit-OSDCloudWinPE -StartOSDCloudGUI

# Set the wallpaper for the WinPE environment
Edit-OSDCloudWinPE -Wallpaper ".\osdcloud-dev\windows-11.jpg"

# Injects Cloud drivers into the WinPE environment
Edit-OSDCloudWinPE -CloudDriver *

# Regenerate the WinPE environment with the new settings
Edit-OSDCloudWinPE -StartURL ''

# Make new USB Drive
powershell iex(irm usb.cec.network)

