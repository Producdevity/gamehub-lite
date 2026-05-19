group = "app.revanced"

patches {
    about {
        name = "GameHub Lite Patches"
        description = "Privacy-focused patches for GameHub that remove telemetry, bypass authentication, and add offline support"
        source = "git@github.com:Producdevity/gamehub-lite.git"
        author = "GameHub Lite Community"
        contact = "https://github.com/Producdevity/gamehub-lite"
        website = "https://github.com/Producdevity/gamehub-lite"
        license = "GNU General Public License v3.0"
    }
}

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    kotlinOptions {
        freeCompilerArgs += "-Xcontext-receivers"
    }
}
