# Security Policy

## Supported Versions
Only the latest version of the VestRoll Mobile Application is supported with security updates.

| Version | Supported          |
| ------- | ------------------ |
| latest  | :white_check_mark: |
| < latest| :x:                |

## Reporting a Vulnerability
We prioritize the security of our mobile application and user data. If you find a vulnerability, please report it privately.

### How to Report
Please do NOT open public issues for security vulnerabilities. Send an email to the project maintainers.

### Security Best Practices (Mobile)
- We use `flutter_secure_storage` for all sensitive tokens.
- Biometric authentication (FaceID/TouchID) is used for secure access.
- We implement code obfuscation and root/jailbreak detection in release builds.
