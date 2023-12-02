enableFeaturePreview("TYPESAFE_PROJECT_ACCESSORS")
pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "Car_KMM"
include(":androidApp")
include(":androidAuto")
include(":androidAutomotive")
include(":androidCarCommon:car-app-service")
include(":shared")