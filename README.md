# NixOS Configuration

## Building iso image

```bash
nix build .#iso
```
After iso file builded, plug in USB drive and find its name with `lsblk`

Ensure it is unmounted
```bash
sudo umount /dev/sdX*
```

And copy iso to the flash drive to obtain bootable drive
```bash
sudo dd bs=4M conv=fsync \
    oflag=direct status=progress \
    if=<path-to-image> of=/dev/sdX
```

## Installing along with nixos from Bootable USB

Clone configuration repo:
```bash
git clone https://github.com/Uberch/NixOSConf
cd NixOSConf
```

Check disk names with `lsblk` and remember path to right device
Check that disko intend to do without modifying: 
```bash
disko --mode mount --flake .#<disko_config> --argstr device <path_to_device>
```
Run disko to format storage:
```bash
disko --mode disko --flake .#<disko_config> --argstr device <path_to_device>
```

Generate configuration for hardware:
```bash
sudo nixos-generate-config \
    --root /mnt \
    --dir modules/_hardware
```

Install desired configuration:
```bash
sudo nixos-install --flake .#[hostname]
```
