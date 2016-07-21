#!/usr/bin/env bash

# TODO Preliminary superuser check

echo "Create 'Script Libraries' system scripts directory..."
mkdir -p /Library/Script\ Libraries

echo
echo "Confirm '/usr/local/bin' user executables is available..."
mkdir -p /usr/local/bin

echo
echo "Copy shared library to system scripts directory..."
cp -p files/Library/Script\ Libraries/system-volume.scpt /Library/Script\ Libraries/

echo
echo "Copy tasks to user executables directory..."
cp -p files/usr/local/bin/* /usr/local/bin/

echo
echo "Make tasks executable..."
chmod a+x /usr/local/bin/turn-volume-down
chmod a+x /usr/local/bin/turn-volume-up

echo
echo "Register volume management tasks for system boot and shutdown..."
defaults write com.apple.loginwindow LogoutHook /usr/local/bin/turn-volume-down
defaults write com.apple.loginwindow LoginHook /usr/local/bin/turn-volume-up

echo
echo "Confirm new settings..."
defaults read com.apple.loginwindow

echo
echo "Done!"

exit 0
