# GameHub Lite

## What is GameHub Lite?

GameHub Lite is a community-maintained modified version of GameHub for education purposes.

---

## GameHub Lite Patcher

A patching system that transforms GameHub 5.1.0 into GameHub Lite. A privacy-focused, lightweight version with telemetry removed and offline support added.

## What is GameHub Lite?

GameHub Lite is a modified version of GameHub that:

- **Removes telemetry and tracking** - Umeng analytics, Firebase, JPush, crash reporting
- **Removes bloat** - Cloud Streaming, Xbox Cloud Gaming, Social features, etc.
- **Removes account requirement** - Use the app without logging in
- **Reduces app size** - From 118MB to 52MB (-56%)
- **Removes unnecessary permissions** - Location, contacts, phone state, etc.
- **Adds offline support** - Works without constant network connectivity
- **Changes package name** - `gamehub.lite` for side-by-side installation
- **Adds custom news page** - Uses community API for updates

## Quick Start

### Prerequisites

Install the required tools:

Get `adb` either via Android Studio or `platform-tools` package.

```bash
# macOS
brew install apktool openjdk

# Ubuntu/Debian
sudo apt install apktool openjdk-17-jdk

# Arch
sudo pacman -S apktool jdk17-openjdk

# Fedora (dnf):
sudo dnf install apktool java-17-openjdk

# Windows
stop using windows
# JK.
# Download apktool from https://apktool.org/
# Install Java JDK 17+ from Oracle or AdoptOpenJDK
# Not tested but should work in WSL2

```

### Patching

1. Download GameHub 5.1.0 APK and place it at `apk/GameHub-5.1.0.apk`

2. Run the patcher:

   ```bash
   ./patch.sh
   ```

3. Install the output APK:
   ```bash
   adb install output/GameHub-Lite.apk
   ```

#### How to use your custom keystore

By default the patch generates a debug keystore for you,
but you can override the keystore settings using environment variables:

```bash
  KEYSTORE="./keystore/release.keystore" \
  KEYSTORE_PASS="your_password" \
  KEY_ALIAS="your_key_alias" \
  ./patch.sh
```

Or export them first:

```bash
  export KEYSTORE="./keystore/release.keystore"
  export KEYSTORE_PASS="your_password"
  export KEY_ALIAS="your_key_alias"
  ./patch.sh
```

To find your key alias, run:

```bash
keytool -list -keystore ./keystore/release.keystore
```

## How It Works

The patcher uses a multi-step process:

1. **Decompile** - Uses apktool to decompile the original APK to smali bytecode
2. **Delete** - Removes telemetry SDKs, unused assets, and tracking libraries
3. **Patch** - Applies unified diff patches to modify smali code
4. **Add** - Copies new files (resources, additional smali)
5. **Rebuild** - Reassembles the APK using apktool
6. **Sign** - Signs with a debug keystore for installation

## Patch Contents

| Category      | Count | Description                                  |
| ------------- | ----- | -------------------------------------------- |
| Deletions     | 3,385 | Telemetry SDKs, tracking code, unused assets |
| Additions     | 2,856 | New resources, modified assets, new features |
| Modifications | 223   | Smali code patches for behavior changes      |

### Removed Components

- **Native libraries**: libumeng-spy.so, libcrashsdk.so, libalicomphonenumberauthsdk_core.so, etc.
- **SDKs**: Umeng Analytics, JPush, Firebase Analytics, Tencent login
- **Assets**: Splash video, auth videos, emoji font (saves ~30MB)
- **Permissions**: Location, contacts, phone state, ad tracking

### Added Features

- Custom splash/intro video from community CDN
- Local game ID copy functionality
- Offline mode improvements
- News page integration with community API

## For Developers

### Regenerating Patches

If you've modified the Lite APK and want to update the patches:

```bash
./generate-patches.sh [path/to/original.apk] [path/to/lite.apk]
```

This will:

1. Decompile both APKs
2. Generate diff patches for modified files
3. Copy new files to patches directory
4. Create deletion and addition lists

### Patch Directory Structure

```
patches/
├── files_to_delete.txt    # List of files to remove
├── files_to_add.txt       # List of files to add
├── files_to_patch.txt     # List of files to modify
├── diffs/                 # Unified diff patches
│   ├── AndroidManifest.xml.patch
│   ├── smali/...
│   └── res/...
├── new_files/             # New files to add
│   ├── res/...
│   └── smali_classes10/...
└── stats.txt              # Patch statistics
```

### Modifying Patches

1. Decompile the Lite APK manually:

   ```bash
   apktool d apk/GameHub-Lite.apk -o work/lite
   ```

2. Make your changes to files in `work/lite/`

3. Rebuild and test:

   ```bash
   apktool b work/lite -o work/test.apk
   # Sign and install for testing
   ```

4. When satisfied, regenerate patches:
   ```bash
   ./generate-patches.sh
   ```

## Troubleshooting

### Patch fails to apply

If patches fail due to APK version mismatch:

- Ensure you're using GameHub 5.1.0 exactly
- Check the MD5 hash matches expected value
- Try regenerating patches with your APK version

### APK won't install

- Uninstall any existing GameHub Lite first
- Check if device is rooted - some patches may conflict (unlikely)

### Build errors

- Ensure apktool is version 2.8.0+ (`apktool --version`)
- Check Java version is 17+ (`java -version`)
- Try cleaning work directory: `rm -rf work/`

## Version Compatibility

| GameHub Version | Patcher Version | Status         |
| --------------- | --------------- | -------------- |
| 5.1.0           | 1.0             | Supported      |
| 5.3.3           | -               | in development |

## Alternative: ReVanced Patches (WORK IN PROGRESS)

An alternative ReVanced-based patching system is available in the `revanced/` directory. This approach uses the [ReVanced Patcher](https://github.com/ReVanced/revanced-patcher) framework for bytecode-level modifications.
This doesn't currently support all features of the Lite APK, but you are free to contribute patches for missing features and resolve existing issues.

```bash
cd revanced
./apply-patches.sh ../apk/GameHub-5.1.0.apk
```

See [revanced/README.md](revanced/README.md) for details.

### When to Use Which

| Approach                      | Best For                                                |
| ----------------------------- | ------------------------------------------------------- |
| **Diff-based** (`./patch.sh`) | Full control, complete SDK removal, simpler maintenance |
| **ReVanced** (`revanced/`)    | ReVanced Manager integration, portable JAR patches      |

## License

This project is for educational and personal privacy purposes only. The patches and tooling are provided as-is. GameHub is a product of its respective owners.

## Contributing

1. Fork the repository
2. Make your changes
3. Regenerate patches with `./generate-patches.sh`
4. Test the full patch cycle with `./patch.sh`
5. Submit a pull request

## Different versions of GameHub Lite

The different versions are identical. What we do is a very old android trick to gain extra performance on some devices.

**Antutu**

Some manufacturers “cheat” by setting the governor to performance when they detect the Antutu package name.

_Nerd explanation:_

The CPU governor essentially controls the CPU's frequency scaling. allowing it to operate at different clock speeds and voltages based on the system load. So making the CPU go fast for sustained usage, what is actually made for peak usage. This comes with a risk of overheating, but I don’t believe in this. Android does a well enough job of thermal management and makes it extremely hard for software to exceed what the hardware is capable of and damaging itself.

That said, it’s still extra heat. More heat == more bad. I just think it’s negligible, especially if your device has a fan.

**PUBG**

On a high level it’s the same as Antutu, but some slight differences that only benefit games. Think of network prioritization and touch input latency improvements. The manufacturers goal when they detect Antutu is **ALL THE POWER**. Benchmarks are relatively short and it makes them look better on comparison websites.

The goal for PUBG is more like **MORE POWER**, since the intention is often to have a game running for longer it has less aggressive changes.

**TLDR and summary:**

**Antutu** spoofing:

    •    Maximum CPU/GPU frequencies unlocked
    •    Aggressive performance governors
    •    Short-duration performance boost (benchmark workload)
    •    Thermal limits are less strict
    •    All cores available

**PUBG** and other games spoofing:

    •    Sustained gaming performance profiles
    •    GPU driver optimizations (Adreno/Mali game-specific paths)
    •    Frame pacing and scheduling improvements
    •    Reduced touch latency
    •    Network QoS prioritization
    •    Different thermal management (sustained vs burst)
    •    Qualcomm “Game Performance Mode”
    •    Sometimes enables features like frame-gen

**Ludashi** spoofing:

    •    Similar to Antutu but slightly less aggressive
    •    Longer sustained performance boost (multi-minute tests)
    •    Memory frequency optimization

## Support

If you have trouble running a game, please see if anyone shared a solution on [EmuReady](https://www.emuready.com) before you ask for help in the Discord server.

For support, discussion and development updates join the [EmuReady Discord server](https://discord.gg/CYhCzApXav).

---

## Related Projects

| Repository                                                                               | Description                                                                                                                                                      |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [gamehub-lite](https://github.com/Producdevity/gamehub-lite)                             | Main project with pre-built APK releases and patch files                                                                                                         |
| [gamehub-lite-api](https://github.com/Producdevity/gamehub-lite-api)                     | Static JSON API hosting component manifests, configuration files, and mock responses that replace the original Chinese servers                                   |
| [gamehub-lite-worker](https://github.com/Producdevity/gamehub-lite-worker)               | Cloudflare Worker API proxy that handles token management, signature regeneration, privacy protection (IP hiding, fingerprint sanitization), and content routing |
| [gamehub-lite-news](https://github.com/Producdevity/gamehub-lite-news)                   | News aggregator that collects gaming news from RSS feeds and GitHub releases, transforms them into GameHub's API format                                          |
| [gamehub-lite-token-refresh](https://github.com/Producdevity/gamehub-lite-token-refresh) | Automated token refresher that uses Mail.tm OTP authentication to maintain valid GameHub tokens, runs every 4 hours via Cloudflare Cron                          |
