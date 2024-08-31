#!/bin/bash

# macOS Hardening Script

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print messages
print_message() {
    echo "===> $1"
}

# 1. Update macOS and all software
print_message "Updating macOS and all software..."
softwareupdate -i -a

# 2. Enable FileVault
print_message "Enabling FileVault..."
sudo fdesetup enable

# 3. Set up a strong administrator password
print_message "Please set a strong administrator password..."
sudo passwd

# 4. Configure firewall
print_message "Enabling and configuring firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# 5. Set up regular automated backups
print_message "Setting up Time Machine for automated backups..."
sudo tmutil enable

# 6. Create a standard user account
print_message "Creating a standard user account..."
echo "Please enter the username for the new standard account:"
read username
sudo sysadminctl -addUser $username -fullName "$username" -password -

# 7. Configure automatic software updates
print_message "Configuring automatic software updates..."
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool true
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

# 8. Disable remote Apple events
print_message "Disabling remote Apple events..."
sudo systemsetup -setremoteappleevents off

# 9. Disable remote login
print_message "Disabling remote login..."
sudo systemsetup -setremotelogin off

# 10. Enable Gatekeeper
print_message "Enabling Gatekeeper..."
sudo spctl --master-enable

# 11. Enable Secure Keyboard Entry in Terminal
print_message "Enabling Secure Keyboard Entry in Terminal..."
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# 12. Disable Bonjour multicast advertisements
print_message "Disabling Bonjour multicast advertisements..."
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true

print_message "macOS hardening complete!"
print_message "Please restart your Mac to ensure all changes take effect."
