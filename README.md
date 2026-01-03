# 🧹 macOS Cleaner Script

A comprehensive system cleaning script for macOS. Safely removes unnecessary cache, logs, and temporary files to free up disk space.

**[Türkçe README için tıklayın](README_TR.md)** | **[Click for Turkish README](README_TR.md)**

## ✨ Features

- 🗑️ **Purgeable Space Cleanup**: Time Machine snapshots and purgeable files
- 🌐 **Chrome Cleanup**: Service Worker caches and IndexedDB files
- 📝 **System Logs**: Cleans system and application logs
- 💾 **Cache Cleanup**: Removes user and application caches
- 🛠️ **Xcode Cleanup**: DerivedData, Archives, and iOS DeviceSupport files
- 🎵 **Application Caches**: Discord, SoundCloud, and other apps
- 📊 **Detailed Report**: Shows freed disk space

## 📋 Requirements

- macOS operating system
- Terminal access
- Sudo privileges for some operations

## 🚀 Installation

### Quick Install (Recommended)

Run directly from your terminal without cloning:

```bash
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/oguzoldev/macos-cleaner-script/main/script.sh)"
```

This command downloads and executes the script directly from GitHub.

### Manual Installation

#### 1. Clone the repository

```bash
git clone git@github.com:oguzoldev/macos-cleaner-script.git
cd macos-cleaner-script
```

#### 2. Make the script executable

```bash
chmod +x script.sh
```

## 💻 Usage

**Two versions available:**

- `script.sh` - English
- `script_tr.sh` - Turkish (Türkçe)

### Normal Usage

```bash
./script.sh
# or for Turkish
./script_tr.sh
```

### Usage with Sudo (Recommended)

To clean system logs and protected files:

```bash
sudo ./script.sh
# or for Turkish
sudo ./script_tr.sh
```

## 📸 Example Output

```
======================================
Initial: 45.23 GB free space
======================================

======================================
Starting system cleanup...
======================================

[1/6] Cleaning Time Machine local snapshots (purgeable space)...
[2/6] Cleaning Chrome cache and databases...
[3/6] Cleaning system logs...
[4/6] Cleaning user caches...
[5/6] Cleaning Xcode files...
[6/6] Cleaning application caches and other files...

======================================
Cleanup completed!
======================================

Final: 52.18 GB free space
✅ Freed space: 6.95 GB
```

## ⚠️ Important Warnings

- **Data Loss Risk**: This script permanently deletes files. Back up important data.
- **Chrome Sessions**: Some Chrome sessions may be closed.
- **Xcode Projects**: Projects may need to be recompiled after DerivedData cleanup.
- **System Files**: Sudo privileges required to delete some system files.

## 🗂️ Cleaned Files

### Purgeable Space

- Time Machine local snapshots
- `/private/var/vm/sleepimage` (sleep image file)
- `~/Library/Caches/com.apple.bird`
- System periodic maintenance tasks

### Chrome

- `~/Library/Application Support/Google/Chrome/*/Service Worker/CacheStorage`
- `~/Library/Application Support/Google/Chrome/*/IndexedDB`
- `~/Library/Application Support/Google/Chrome/OptGuideOnDeviceModel`

### System

- `/Library/Logs/*`
- `/private/var/db/diagnostics`
- `/private/var/folders/*`
- `/private/var/log/*`

### User

- `~/Library/Caches/*`
- `~/Library/Logs/*`
- `~/Library/Caches/Homebrew/downloads`

### Xcode

- `~/Library/Developer/Xcode/Archives`
- `~/Library/Developer/Xcode/DerivedData`
- `~/Library/Developer/Xcode/iOS DeviceSupport`

### Applications

- `~/Library/Application Support/SoundCloud/Cache`
- `~/Library/Application Support/discord/Cache`
- `~/Library/pnpm`
- `~/Library/Metadata/CoreSpotlight`

## 🔧 Customization

You can customize the script for your needs. Open `script.sh` and comment out or remove lines you don't want to clean.

Example:

```bash
# rm -rf ~/Library/Caches/Homebrew/downloads
```

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/newFeature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/newFeature`)
5. Create a Pull Request

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## ⚡ FAQ

### Is the script safe?

Yes, the script only cleans cache and temporary files. However, we recommend reviewing the contents before use.

### How often should I run it?

Run it when you experience disk space issues or once a month.

### Can I undo the changes?

No, deleted files are permanently removed. Back up important data.

### Which macOS versions does it work on?

Tested on macOS 10.14 (Mojave) and later.

### Why aren't some files being deleted?

macOS's System Integrity Protection (SIP) feature protects some system files. Safari cache, HomeKit, CloudKit, and other Apple service caches cannot be deleted even with sudo. This is normal and important for your system's security. The script automatically hides these errors.

## 🙏 Thanks

Thank you for using this script! Feel free to open an issue to report problems or make suggestions.

---

**⭐ Don't forget to star if you like it!**
