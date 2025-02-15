# libssl files for some GoG games on Linux that come without needed files

The following games may fail to run on modern Linux distros because they come with missing dependencies on Linux:

  - Baldur's Gate Enhanced Edition (BG:EE)
  - Baldur's Gate II Enhanced Edition (BG2:EE)
  - Planescape: Torment Enhanced Edition (PST:EE)
  - Icewind Dale Enhanced Edition (IWD:EE)
  - Stoneshard

Neverwinter Nights Enhanced Edition, seems to be unaffected.

What happens if you try to run one of them on a decently modern distro (I usually game on Fedora) is:

```bash
$ ./start.sh
Running Baldur's Gate II: Enhanced Edition
./BaldursGateII: error while loading shared libraries: libssl.so.1.0.0: cannot open shared object file: No such file or directory
```
## Beamdog's Enhanced edition games

To resolve this for the two Baldur's Gate Enhanced Edition games, Planescape:Torment EE or Icewind Dale EE, clone this repo somewhere (or download the files from the proper directories manually one by one) then launch with:

```bash
LD_LIBRARY_PATH='/the/path/to/the/cloned/repository/beamdog/x86_64' ./start.sh
```

## Stoneshard

To resolve, clone this repo somewhere (or download the files from the proper directories manually one by one) then launch with:

```bash
LD_LIBRARY_PATH='/the/path/to/the/cloned/repository/stoneshard/x86_64' ./start.sh
```

# FAQ

## What are the steps if using Lutris?

Clone the repo somewhere or download the files manually, whatever you fancy.

Right click the game in the interface, and press "Configure".

Go to the "System Options" tab and create an entry named `LD_LIBRARY_PATH` with the path to the `x86_64` directory (or the files you downloaded); by default Lutris installs the 64bit version of the game.

![lutris screenshot](https://raw.githubusercontent.com/xanathar/baldursgate_ee_libssl_files/main/docs/lutris-screenshot.png)


## What is the source of those file? Can we trust them?

I got them from containers and distribution of other programs (including the Steam client).

I guess you can trust them, but they come with no guarantees of any sort. They may kill your system and all your data, don't blame me.
