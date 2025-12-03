#Prompt user to have USB plugged in
Read-Host 'Press enter to confirm USB drive plugged in to continue'

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

#Create OSDCloudworkspace
New-OSDCloudWorksapce -WorkspacePath 'C:\SBCWin11'

# Set the OSDCloud environment to the local path
Set-OSDCloudWorkspace C:\SBCWin11

# Initial setup for the OSDCloud environment
Edit-OSDCloudWinPE -StartOSDCloudGUI

# Set the wallpaper for the WinPE environment
Edit-OSDCloudWinPE -Wallpaper "C:\workspace\OSDCloudDev\osdcloud-dev\windows-11.jpg"

# Injects Cloud drivers into the WinPE environment
Edit-OSDCloudWinPE -CloudDriver *

# Regenerate the WinPE environment with the new settings
Edit-OSDCloudWinPE -StartURL 'https://gist.githubusercontent.com/bwhetstonestdbev/ed0948a40a1546cbb276514fc046e32d/raw/StartOSD.ps1'

# Make new USB Drive
New-OSDCloudUSB -fromIsoFile 'C:\SBCWin11\OSDCloud_NoPrompt.iso'



