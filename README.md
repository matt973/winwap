![WinWarp Logo](winwarp.png)
# WinWarp 🚀

**Quick boot to Windows from Batocera Linux via EFI boot manager**

WinWarp is a lightweight bash script that allows you to reboot directly into Windows from Batocera Linux with a single click, without manually changing the boot order in the BIOS/UEFI settings.

---

## ✨ Features

- Automatically detects the Windows EFI boot entry (`bootmgfw.efi`)
- No need to manually configure the boot entry — works on any PC
- Sets Windows as the next boot only once (BootNext), then Batocera resumes as default
- Displays a custom splash screen before rebooting
- Simple one-line installation via SSH

---

## 📋 Requirements

- Batocera Linux installed on a UEFI system
- Windows installed on the same machine with its own EFI entry
- `efibootmgr` available on the system (usually pre-installed on Batocera)
- SSH access to the Batocera machine

---

## ⚡ Quick Installation via SSH

Connect to your Batocera machine via SSH and run:
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/matt973/winwarp/main/install_winwarp.sh)
```

The installer will:
1. Create the script in `/userdata/roms/ports/WinWarp.sh`
2. Set the correct execution permissions
3. Verify that `efibootmgr` is available
4. Automatically scan and detect the Windows EFI boot entry

---

## 🎮 Usage

After installation, WinWarp will appear in the **Ports** section of the Batocera menu. Simply select it and your system will:

1. Automatically detect the Windows EFI boot entry
2. Display a splash screen for 2 seconds
3. Reboot directly into Windows

On the next reboot, Batocera will resume as the default operating system.

---

## 🔄 Update

To update WinWarp to the latest version, simply run the installation command again:
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/matt973/WinWarp/main/install_winwarp.sh)
```

---

## 🛠️ Manual Installation

If you prefer to install manually via SSH:
```bash
# 1. Copy the installer to Batocera
scp install_winwarp.sh root@<BATOCERA_IP>:/userdata/

# 2. Connect via SSH
ssh root@<BATOCERA_IP>

# 3. Run the installer
bash /userdata/install_winwarp.sh
```

---

## 🔍 Troubleshooting

**Windows EFI entry not found**
Run the following command to list all available EFI entries:
```bash
efibootmgr -v
```
Make sure Windows Boot Manager is present in the list.

**Permission error on efibootmgr**
Make sure you are running the script as root:
```bash
sudo bash /userdata/roms/ports/WinWarp.sh
```

**Script has Windows line endings (CRLF)**
If you copied the script manually on Windows, fix it with:
```bash
sed -i 's/\r//' /userdata/roms/ports/WinWarp.sh
```

---

## 📁 Repository Structure
```
WinWarp/
└── install_winwarp.sh   # Installer — generates WinWarp.sh on the target machine
```

---

## 📄 License

This project is licensed under the MIT License.

---

## 👤 Author

**Retroamestation**
- GitHub: [@matt973](https://github.com/matt973)

---

> WinWarp — Because switching to Windows should take one click, not ten.
