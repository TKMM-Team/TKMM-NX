<div align="center">
  <img src="https://raw.githubusercontent.com/TKMM-Team/.github/refs/heads/main/resources/Icon-Transparent-1024.png" width="300vh">
  <h1>TKMM-NX - Lightweight OS for the Nintendo Switch</h1>
  
  <a href="https://discord.gg/BbVXenRFVc">
    <img src="https://img.shields.io/discord/1179611100183011429?style=for-the-badge&logoColor=5865F2&color=5865F2&labelColor=2A2C33&logo=discord&label=discord" alt="Discord"/>
  </a> &nbsp;
  <a href="https://github.com/TKMM-Team/Tkmm/releases/latest">
    <img src="https://img.shields.io/github/v/tag/TKMM-Team/TKMM-NX?style=for-the-badge&logoColor=ffffff&color=C71B42&labelColor=2A2C33&logo=github&label=Version" alt="Releases"/>
  </a> &nbsp;
  <a href="https://tkmm.org/downloads/">
    <img src="https://img.shields.io/github/downloads/TKMM-Team/TKMM-NX/total?style=for-the-badge&labelColor=2A2C33&color=31c059" alt="Downloads"/>
  </a>
</div>

<br />

**TKMM-NX** is a Linux operating system based on [Lakka (LibreELEC)](https://github.com/libretro/Lakka-LibreELEC) with custom adaptations that allows the TotK Mod Manager to seamlessly run on the Nintendo Switch, without needing a PC (or needing to modify the partition table on your SD card).

## Help and Documentation

- **[Discord Server](https://tkmm.org/discord)**: Join our community for support and updates.
- **[Documentation](https://tkmm.org/docs)**: Your guide to setup, configuration, and troubleshooting.

## Downloads

Get the latest OS images to run TKMM on your Switch:
- **Stable Release:** [Download TKMM OS for Switch](https://tkmm.org/downloads/?tabs=switch)

## Installation

After downloading the .zip file, extract the `tkmm` and `bootloader` folders at the root of your SD card.

- boot your Switch into RCM mode
- inject the Hekate payload
- go to "More Configs"
- select "TKMM"

Your Switch should now boot into TKMM-NX.

## Building TKMM-NX

To build your own image, follow these steps:

1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/TKMM-Team/TKMM-NX.git
   cd TKMM-NX
   ```

2. **Install Dependencies:**  
   Ensure you have the required toolchain installed (see the [build-basics](https://wiki.libreelec.tv/development/build-basics) and [build-advanced](https://wiki.libreelec.tv/development/build-advanced) pages on the LibreELEC wiki for details).

   ```bash
   sudo apt update
   sudo apt upgrade -y
   sudo apt install -y gcc make git unzip wget xz-utils bc gperf zip g++ \
        xfonts-utils xsltproc openjdk-11-jre-headless libparse-yapp-perl \
        libxml-parser-perl patchutils lzop rdfind dotnet-sdk-9.0 
   ```

3. **Build the Image:**  
   Use the provided build scripts and package definitions. For example, to build the release version run:
   ```bash
   DISTRO=TKMM TKMM_VERSION=<tag_name> PROJECT=L4T DEVICE=Switch ARCH=aarch64 make image
   ```
   For a debug build (with dotnet SDK and git installed), run:
   ```bash
   DISTRO=TKMM TKMM_VERSION=<tag_name> PROJECT=L4T DEVICE=Switch ARCH=aarch64 DEVMODE=enabled make image
   ```

## The Team

- **[Arch Leaders](https://github.com/ArchLeaders)**: Lead TKMM Developer
- **[Lord Bubbles](https://github.com/LordBubblesDev)**: TKMM-NX Developer
- **[Aster](https://github.com/AsteroidPizza39)**: Co-Founder, Artist, & Operations Manager
- **[The5thTear](https://github.com/The5thTear)**: Co-Founder & Developer
- **[Mikachan](https://github.com/okmika)**: Developer

## Special Thanks

A heartfelt thank you to:
- The [**Switchroot**](https://switchroot.org) community for pioneering open-source development on the Nintendo Switch.
- The [**Lakka**](https://www.lakka.tv) team, for its work that allowed us to create a custom OS for TKMM on Switch.
- The [**LibreELEC**](https://libreelec.tv) team for creating the Linux distribution upon which all of this is built.

<br>

---
