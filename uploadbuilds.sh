#!/bin/sh

# Clean up folders
rm -rf releases && mkdir -p releases
rm -rf debug && mkdir -p debug
rm -rf target/*

# Clean up TKMM package from build environment
DISTRO=TKMM PROJECT=L4T DEVICE=Switch ARCH=aarch64 scripts/clean tkmm

# Build regular image
DISTRO=TKMM TKMM_VERSION=0.0.0 PROJECT=L4T DEVICE=Switch ARCH=aarch64 make image
mv target/* releases/

# Build debug image
DISTRO=TKMM TKMM_VERSION=0.0.0 PROJECT=L4T DEVICE=Switch ARCH=aarch64 DEVMODE=enabled make image
mv target/* debug/

# Upload builds to mirror
scp -i ~/.ssh/github_runner_sftp_key releases/* ubuntu@repo.tkmm.org:/var/www/html/repo/.tkmm-nx/Releases
scp -i ~/.ssh/github_runner_sftp_key debug/* ubuntu@repo.tkmm.org:/var/www/html/repo/.tkmm-nx/Debug

# Cleanup
rm -rf releases
rm -rf debug
rm -rf target/*
