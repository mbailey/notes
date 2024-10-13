## Install from USB

- Custom partitioning
    - Standard partitioning (not LVM)
    - EXT4
    - Select Full disk encryption
    - Extra partition:  /var 300GB # for VMS
- Reboot
- Create login
- **Update packages:**  `sudo dnf update -y`  
- **Enable [automatic-updates](automatic-updates.md)**  