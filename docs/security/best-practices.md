# Mobile Security Best Practices

Security is paramount in a financial application. VestRoll Mobile implements several layers of protection.

## Data Protection
- **Encryption**: Sensitive data is stored using `flutter_secure_storage` which utilizes Keychain (iOS) and Keystore (Android).
- **No Local PII**: We minimize the storage of Personally Identifiable Information on the device.

## Network Security
- **SSL Pinning**: Ensures the application only communicates with our verified servers.
- **Secure Transport**: All API communication is forced over HTTPS with TLS 1.2+.

## Runtime Security
- **Biometric Lock**: Critical actions (like signing transactions) require biometric verification.
- **Obfuscation**: Production builds are obfuscated to prevent reverse engineering.
- **Root/Jailbreak Detection**: The app detects and warns users if it is running on a compromised device.
