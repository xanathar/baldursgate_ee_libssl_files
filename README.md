# libssl files for Beamdog Enhanced Edition Infinity Engine games

The Enhanced Edition versions of the following games may fail to run on modern Linux distros because they come with missing dependencies on Linux:

  - Baldur's Gate Enhanced Edition (BG:EE)
  - Baldur's Gate II Enhanced Edition (BG2:EE)
  - Planescape: Torment Enhanced Edition (PST:EE)
  - Icewind Dale Enhanced Edition (IWD:EE)
  
Neverwinter Nights Enhanced Edition, seems to be unaffected.

What happens if you try to run one of them on a decently modern distro is:

```bash
$ ./start.sh
Running Baldur's Gate II: Enhanced Edition
./BaldursGateII: error while loading shared libraries: libssl.so.1.0.0: cannot open shared object file: No such file or directory
```

To resolve, clone this repo somewhere (or download the files in the `i386` or `x86_64` directory manually one by one) then launch with:

```bash
# If using the 64bit version of the game:
LD_LIBRARY_PATH='/the/path/to/the/cloned/repository/x86_64' ./start.sh

# Otherwise, if using the 32bit version of the game:
LD_LIBRARY_PATH='/the/path/to/the/cloned/repository/i386' ./start.sh
```

# FAQ

## What are the steps if using Lutris?

Clone the repo somewhere or download the files manually, whatever you fancy.

Right click the game in the interface, and press "Configure".

Go to the "System Options" tab and create an entry named `LD_LIBRARY_PATH` with the path to the `x86_64` directory (or the files you downloaded); by default Lutris installs the 64bit version of the game.

![lutris screenshot](https://raw.githubusercontent.com/xanathar/baldursgate_ee_libssl_files/main/docs/lutris-screenshot.png)


## What is the source of those file? Can we trust them?

I got them from the binary distribution of the Steam client (*).

I guess you can trust them, but they come with no guarantees of any sort. They may kill your system and all your data, don't blame me.

(*) = Yes, that means that I had to use Steam to make a game I bought on GoG work. Incidentally  have most of the infinity engine games also on Steam.
