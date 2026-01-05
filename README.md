# Installation process

Clone configuration repo:
```bash
git clone https://github.com/Uberch/NixOSConf
cd NixOSConf
```

Check disk names with `lsblk` and adjust disko.nix if needed.
Run disko to format storage:
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko disko.nix
```

Generate configuration for hardware:
```bash
sudo nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix .
```

Install desired configuration:
```bash
sudo nixos-install --flake .#[hostname]
```
