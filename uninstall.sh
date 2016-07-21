#!/usr/bin/env bash

# TODO Preliminary superuser check

echo "Remove shared library from system scripts directory..."
rm -f /Library/Script\ Libraries/system-volume.scpt

echo
echo "Remove tasks from user executables directory..."
rm -f /usr/local/bin/turn-volume-down /usr/local/bin/turn-volume-up

echo
echo "Unregister volume management tasks for system boot and shutdown..."
defaults delete com.apple.loginwindow LoginHook
defaults delete com.apple.loginwindow LogoutHook

echo
echo "Confirm reverted settings..."
defaults read com.apple.loginwindow

echo
echo "Done!"

exit 0
