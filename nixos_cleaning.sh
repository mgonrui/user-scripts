#!/bin/sh

sudo nix-channel --update     # update channel
sudo nixos-rebuild switch     # update packages
sudo nix-collect-garbage -d   # Delete old generations of packages
sudo nix-store --optimise     # Optimize the Nix store
