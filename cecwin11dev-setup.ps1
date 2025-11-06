# This script sets up the OSDCloud environment for local use with Windows 11.
Install-Module -Name OSD -Force

# Import the OSD module
Import-Module -Name OSD -Force

# Check the OSD module version
Get-Module -Name OSD

# Create new OSDCloud environment for Windows 11
New-OSDCloudTemplate -SetInputLocale en-us -Name dev

# Set the OSDCloud Template
Set-OSDCloudTemplate -Name dev

# Copy Autopilot JSON file
# Copy-Item -Path ".\osdcloud-dev\AutopilotConfigurationFile.json" -Destination "C:\ProgramData\OSDCloud\Config\AutopilotJSON\AutopilotConfigurationFile.json" -Force
# Copy osdcloud secret
Copy-Item -Path ".\osdcloud-dev\osdcloud.shh" -Destination "C:\ProgramData\OSDCloud\Templates\dev\Config\Scripts\osdcloud.shh" -Force

# Set the OSDCloud environment to the local path
Set-OSDCloudWorkspace C:\CECWin11dev

# Initial setup for the OSDCloud environment
Edit-OSDCloudWinPE -StartOSDCloudGUI

# Set the wallpaper for the WinPE environment
Edit-OSDCloudWinPE -Wallpaper ".\osdcloud-dev\dev-wallpaper.jpg"

# Injects Cloud drivers into the WinPE environment
Edit-OSDCloudWinPE -CloudDriver *

# Regenerate the WinPE environment with the new settings
Edit-OSDCloudWinPE -StartURL 'https://gist.githubusercontent.com/caseydaviscec/2e0911cfd7da6b5919649df499370219/raw/StartOSD.ps1'

# Make new USB Drive
#powershell iex(irm usb.cec.network)
