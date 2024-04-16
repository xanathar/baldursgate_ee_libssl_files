# libssl files for Beamdog Enhanced Edition Infinity Engine games

The Enhanced Edition versions of the following games may fail to run on modern Linux distros because they come with missing dependencies on Linux:

  - Baldur's Gate Enhanced Edition (BG:EE)
  - Baldur's Gate II Enhanced Edition (BG2:EE)
  - Planescape: Torment (PST:EE)
  - Icewind Dale (IWD:EE)
  
Neverwinter Nights Enhanced Edition, seems to be unaffected.

What happens if you try to run one of them on a decently modern distro is:

```bash
$ ./start.sh
Running Baldur's Gate II: Enhanced Edition
./BaldursGateII: error while loading shared libraries: libssl.so.1.0.0: cannot open shared object file: No such file or directory
```

To resolve, clone this repo somewhere (or download the files in the `x86_64` directory manually one by one) then launch with:

```bash
LD_LIBRARY_PATH='/the/path/to/the/cloned/repository/x86_64' ./start.sh
```

# FAQ

## What are the steps if using Lutris?

Clone the repo somewhere or download the files manually, whatever you fancy.

Right click the game in the interface, and press "Configure".

Go to the "System Options" tab and create an entry named `LD_LIBRARY_PATH` with the path to the `x86_64` directory (or the files you downloaded).

![lutris screenshot](https://raw.githubusercontent.com/xanathar/baldursgate_ee_libssl_files/main/docs/lutris-screenshot.png)

## What are the files in the i386 directory for?

Nothing. I didn't know which one of the two (between i386 and x86_64) was needed and copied both, then realized the i386 ones are useless for this purpose.
This whole issue though is because those games rely on files that are not included in modern distros anymore (for good reasons) and it took some archaeology digging to find them... so I decided to include them anyway, just in case somebody finds them useful.

## What is the source of those file? Can we trust them?

I got them from the binary distribution of the Steam client (*).

I guess you can trust them, but they come with no guarantees of any sort. They may kill your system and all your data, don't blame me.

(*) = Yes, that means that I had to use Steam to make a game I bought on GoG work. Incidentally  have most of the infinity engine games also on Steam.
