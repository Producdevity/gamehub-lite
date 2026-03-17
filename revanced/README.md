# GameHub Lite - ReVanced Patches - WORK IN PROGRESS

ReVanced-based patches for transforming GameHub into GameHub Lite.

## Overview

This is an **alternative** to the diff-based patching system in the parent directory. It uses the [ReVanced Patcher](https://github.com/ReVanced/revanced-patcher) framework for bytecode-level modifications.

### When to Use Which Approach

| Approach                       | Best For                                            |
| ------------------------------ | --------------------------------------------------- |
| **Diff-based** (`../patch.sh`) | Quick patching, full control, simpler maintenance   |
| **ReVanced** (this)            | Integration with ReVanced Manager, portable patches |

## Available Patches

| Patch                       | Description                                  |
| --------------------------- | -------------------------------------------- |
| `Disable JPush`             | Disables JPush push notification SDK         |
| `Disable All Telemetry`     | Removes Umeng, Firebase, and all analytics   |
| `Remove Tracking Resources` | Removes tracking permissions from manifest   |
| `Remove Tracking SDKs`      | Deletes tracking native libraries and assets |
| `GameHub Lite`              | Complete transformation (includes all above) |

## Quick Start

### Prerequisites

1. **Java 17+**

   ```bash
   # macOS
   brew install openjdk@17

   # Ubuntu
   sudo apt install openjdk-17-jdk
   ```

2. **GitHub Token** (for downloading ReVanced dependencies)
   ```bash
   export GITHUB_ACTOR=your-username
   export GITHUB_TOKEN=your-token
   ```

### Apply Patches

```bash
# Using the helper script
./apply-patches.sh path/to/GameHub-5.3.5.apk

# With custom output
./apply-patches.sh GameHub-5.3.5.apk -o GameHub-Lite.apk

# List available patches
./apply-patches.sh -l
```

### Using ReVanced CLI Directly

```bash
# Build patches first
./gradlew build

# Apply with ReVanced CLI
java -jar tools/revanced-cli.jar patch \
    --patch-bundle build/libs/gamehub-lite-patches.jar \
    --out GameHub-Lite.apk \
    GameHub-5.3.5.apk
```

### Using ReVanced Manager

1. Build the patches: `./gradlew build`
2. Copy `build/libs/gamehub-lite-patches.jar` to your device
3. Open ReVanced Manager
4. Select GameHub APK
5. Load the patches JAR
6. Select patches and apply

## Project Structure

```
revanced/
├── patches/
│   └── src/main/kotlin/app/revanced/patches/gamehub/
│       ├── shared/
│       │   └── Fingerprints.kt      # Method fingerprints
│       ├── telemetry/
│       │   ├── DisableTelemetryPatch.kt
│       │   └── DisableAllTelemetryPatch.kt
│       └── misc/
│           ├── RemoveTrackingResourcesPatch.kt
│           └── GameHubLitePatch.kt
├── gradle/
│   ├── libs.versions.toml           # Dependency versions
│   └── wrapper/
├── tools/                           # ReVanced CLI (auto-downloaded)
├── output/                          # Patched APKs
├── settings.gradle.kts
├── gradle.properties
├── apply-patches.sh                 # Helper script
└── README.md
```

## Development

### Building Patches

```bash
# Full build
./gradlew build

# Clean build
./gradlew clean build
```

### Adding New Patches

1. Create a fingerprint in `shared/Fingerprints.kt`:

   ```kotlin
   internal val myFingerprint = fingerprint {
       accessFlags(AccessFlags.PUBLIC)
       returns("V")
       custom { method, classDef ->
           classDef.type == "Lcom/example/MyClass;" &&
               method.name == "myMethod"
       }
   }
   ```

2. Create a patch:

   ```kotlin
   val myPatch = bytecodePatch(
       name = "My Patch",
       description = "Does something useful",
   ) {
       compatibleWith("com.xiaoji.egggame"("5.3.5"))

       execute {
           myFingerprint.method.addInstructions(0, "return-void")
       }
   }
   ```

### Testing Patches

```bash
# Build and apply in one step
./gradlew build && ./apply-patches.sh ../apk/GameHub-5.3.5.apk

# Install on device
adb install output/GameHub-Lite.apk
```

## Limitations

The ReVanced approach has some limitations compared to diff-based patching:

1. **Package Removal**: ReVanced can't easily delete entire SDK packages (Umeng, JPush). The bytecode patches disable initialization, but dead code remains.

2. **Resource Changes**: Limited support for bulk resource modifications. The diff-based approach handles PNG→WebP conversion and bulk deletions better.

3. **Build Complexity**: Requires Gradle, GitHub authentication, and understanding of the ReVanced API.

4. **Update Resilience**: Fingerprints may break with GameHub updates if method signatures change.

## Comparison with Diff-Based Approach

| Feature             | Diff-Based    | ReVanced              |
| ------------------- | ------------- | --------------------- |
| APK size reduction  | Better (-56%) | Moderate              |
| SDK removal         | Complete      | Disabled only         |
| Maintenance         | Simpler       | More complex          |
| Portability         | Script-based  | JAR-based             |
| Manager integration | No            | Yes                   |
| Update resilience   | Good          | Fingerprint-dependent |

## Troubleshooting

### Build Fails with Authentication Error

Ensure GitHub credentials are set:

```bash
export GITHUB_ACTOR=your-username
export GITHUB_TOKEN=ghp_xxxxxxxxxxxx
```

Or add to `gradle.properties`:

```properties
gpr.user=your-username
gpr.key=ghp_xxxxxxxxxxxx
```

### Patch Not Found

Ensure the fingerprint matches the target method. Use jadx to inspect the APK:

```bash
jadx GameHub-5.3.5.apk -d jadx-output
```

### APK Won't Install

- Uninstall existing GameHub first
- Check signature: patched APKs use a different signature

## Related

- [OG patcher (diff-based)](../) - Simpler alternative
- [ReVanced Patcher](https://github.com/ReVanced/revanced-patcher) - Framework documentation
- [ReVanced Patches](https://github.com/ReVanced/revanced-patches) - Example patches
