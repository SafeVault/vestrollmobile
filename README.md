# VestRoll Payroll System - Mobile Application

Cross-platform mobile application built with Flutter for iOS and Android, featuring biometric authentication, real-time payroll access and crypto wallet integration.

## Technology Stack

- **Framework**: Flutter 3.16+
- **Language**: Dart 3.2+
- **State Management**: BLoC
- **Local Storage**: Hive / SQLite
- **Networking**: Dio with retry interceptors
- **Blockchain**: web3dart
- **Authentication**: flutter_secure_storage
- **Biometrics**: local_auth
- **Push Notifications**: Firebase Cloud Messaging

## Project Structure

```
├── lib/
│   ├── main.dart                    # Application entry point
│   ├── app/
│   │   ├── routes/                  # Navigation and routing
│   │   ├── theme/                   # App theming
│   │   └── config/                  # App configuration
│   ├── core/
│   │   ├── constants/               # Constants and enums
│   │   ├── utils/                   # Utility functions
│   │   ├── network/                 # API client and interceptors
│   │   └── errors/                  # Error handling
│   ├── data/
│   │   ├── models/                  # Data models
│   │   ├── repositories/            # Data repositories
│   │   ├── datasources/             # Local/Remote data sources
│   │   └── services/                # API services
│   ├── domain/
│   │   ├── entities/                # Business entities
│   │   ├── repositories/            # Repository interfaces
│   │   └── usecases/                # Business logic
│   ├── presentation/
│   │   ├── screens/                 # Screen widgets
│   │   ├── widgets/                 # Reusable widgets
│   │   ├── providers/               # State management
│   │   └── blocs/                   # BLoC pattern (if used)
│   └── features/
│       ├── auth/                    # Authentication feature
│       ├── payroll/                 # Payroll feature
│       ├── leave/                   # Leave management
│       ├── attendance/              # Time & attendance
│       ├── crypto/                  # Cryptocurrency features
│       └── profile/                 # User profile
├── assets/
│   ├── images/                      # Image assets
│   ├── icons/                       # Icon assets
│   └── fonts/                       # Custom fonts
├── test/                            # Unit tests
├── integration_test/                # Integration tests
└── android/                         # Android native code
└── ios/                             # iOS native code
```

## Prerequisites

- Flutter SDK 3.16+
- Dart SDK 3.2+
- Android Studio / Xcode
- Firebase project setup
- CocoaPods (for iOS)

## Installation

```bash
# Clone repository
git clone https://github.com/SafeVault/vestrollmobile.git
cd vestroll-mobile

# Get dependencies
flutter pub get

# Run code generation (if using freezed/json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

## Configuration Files

### Android (`android/app/build.gradle`)

```gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        applicationId "com.vestroll.app"
        minSdkVersion 24
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### iOS (`ios/Runner/Info.plist`)

```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access to scan receipts and QR codes</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to verify attendance</string>
<key>NSFaceIDUsageDescription</key>
<string>We use Face ID for secure authentication</string>
```

## Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.0
  
  # Networking
  dio: ^5.4.0
  retrofit: ^4.0.0
  
  # Local Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_secure_storage: ^9.0.0
  
  # Authentication
  local_auth: ^2.1.7
  
  # Blockchain
  web3dart: ^2.7.1
  walletconnect_flutter_v2: ^2.1.0
  
  # UI
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.9
  shimmer: ^3.0.0
  
  # Location
  geolocator: ^10.1.0
  geocoding: ^2.1.1
  
  # Push Notifications
  firebase_messaging: ^14.7.6
  flutter_local_notifications: ^16.2.0
  
  # Utilities
  intl: ^0.18.1
  qr_code_scanner: ^1.0.1
  file_picker: ^6.1.1
  path_provider: ^2.1.1
  
  # Code Generation
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.7
  freezed: ^2.4.5
  json_serializable: ^6.7.1
  flutter_launcher_icons: ^0.13.1
```



## Build & Release

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release

# Build with flavors
flutter build apk --release --flavor production
```

### iOS

```bash
# Build IPA
flutter build ipa --release

# Build with specific configuration
flutter build ios --release --no-codesign
```

## Code Generation

```bash
# Generate model classes, serializers
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes
flutter pub run build_runner watch
```


```yaml
# pubspec.yaml
flutter:
  generate: true
```

## Performance Optimization

- **Image Caching**: Use cached_network_image for remote images
- **Lazy Loading**: Implement pagination for large lists
- **Memory Management**: Dispose controllers and streams properly
- **Build Optimization**: Use const constructors where possible
- **State Management**: Minimize unnecessary rebuilds with Riverpod selectors

## Security Best Practices

- Store sensitive data in flutter_secure_storage
- Enable certificate pinning for API calls
- Obfuscate code in release builds
- Implement jailbreak/root detection
- Use ProGuard rules for Android
- Enable bitcode for iOS




## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check code quality
- Format code with `dart format .`
- Use linter rules defined in `analysis_options.yaml`

## Troubleshooting

### Common Issues

**Issue**: Build fails on iOS
```bash
cd ios && pod install
flutter clean && flutter pub get
```

**Issue**: Android build fails
```bash
cd android && ./gradlew clean
flutter clean && flutter pub get
```

**Issue**: Hot reload not working
```bash
flutter clean
flutter pub get
```

## License

Proprietary - All rights reserved

## Support

- Email: vestrollofficail@gmail.com
