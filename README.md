macOS/OS X boot chime muter
===========================

Prevent your Mac from making noise when it is being powered on.

Every Mac computer chimes when you turn it on. This can be quite load and
unpredictable as the volume level is determined from what was set when the
computer was last shut down. So unless you always remember to mute your Mac or
at least turn the volume down before powering it off, `mac-boot-chime-muter`
might be a tool for you.

Installation
------------

Open Terminal, clone this repository anywhere in your file system, `cd` to it
and run the following commands:

```bash
$ chmod u+x install.sh
$ sudo ./install.sh
```

If you wanted to uninstall the scripts, run similar commands but replace
`install.sh` with `uninstall.sh`.

### What happens during the installation?

- a small shared JavaScript `.scpt` file compiled in Apple's Script Editor is
copied to `/Library/Script Libraries/`,
- `turn-volume-down` and `turn-volume-up` executables are dropped under
`/usr/local/bin/`,
- the two executables are registered as login and logout hooks.

The chime volume level is set to a very quiet 6% when the computer is being
booted and once you have logged in - the level goes up to 31%. Why these
particular values?  Well, by default the OS supports 16 intervals from mute to
maximum so 6% represents level 1 and 31 - level 5 that seems "just right" for
normal computer use.

To customise these values you would need to open the provided
`system-volume.scpt` file in Script Editor, hack the values and save your edits.

Troubleshooting
---------------

### Program no longer works after macOS/OS X upgrade

Open Terminal and execute the following scripts:

```bash
defaults write com.apple.loginwindow LogoutHook /usr/local/bin/turn-volume-down
defaults write com.apple.loginwindow LoginHook /usr/local/bin/turn-volume-up
```

Caveats
-------

If you use keyboard shortcuts for immediately shutting down or restarting the
computer (`Ctrl-Alt-Cmd-Eject/PowerOff` or `Ctrl-Cmd-Eject/PowerOff`,
respectively), this tool is not going to work. This is because macOS/OS X seems to
ignore login and logout hooks in such scenarios.

Notes for techies
-----------------

The simple scripts provided here have been written in JavaScript for Automation
(JXA). Yes, the same effect could have been achieved with AppleScript in a more
concise way but... hey, JavaScript is awesome and it has been great fun to knock it
all together using this language!

Another alternative that can be found on-line is the firmware manipulation
command line tool called `nvram`. I am yet to get it to work successfully so for
now I am going to stick to my tool instead.

Licence
-------

[http://unlicense.org](Unlicense)
