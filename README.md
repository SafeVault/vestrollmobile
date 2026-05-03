# VestRoll Mobile

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.16+-blue?style=for-the-badge&logo=flutter" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.2+-blue?style=for-the-badge&logo=dart" alt="Dart" />
  <img src="https://img.shields.io/badge/BLoC-State-red?style=for-the-badge&logo=flutter" alt="BLoC" />
  <img src="https://img.shields.io/badge/Stellar-Network-black?style=for-the-badge&logo=stellar" alt="Stellar" />
</p>

**VestRoll Mobile** is a cross-platform mobile application built with Flutter. It serves as the mobile gateway for the VestRoll payroll and invoicing orchestration platform, enabling global businesses and contractors to manage financial operations on the go via the Stellar network.

## Features

- **Global Payouts**: Review and approve payroll disbursements directly from your mobile device.
- **Real-time Status**: Instant notifications for invoice settlement and balance updates.
- **Invoice Management**: Generate blockchain-verifiable invoices on the move.
- **Tax Insights**: View tax deductions and reporting details for every transaction.
- **Biometric Security**: Secure access and transaction signing using FaceID and TouchID.

## Stack

- **Framework**: [Flutter 3.16+](https://flutter.dev/)
- **Language**: [Dart 3.2+](https://dart.dev/)
- **State Management**: BLoC / Riverpod
- **Blockchain**: Stellar Network integration
- **Storage**: Hive & Secure Storage

## Quick Start

1. **Prerequisites**:
   - Flutter SDK installed and configured.
   - Android Studio / Xcode for native builds.

2. **Clone and Prepare**:

   ```bash
   git clone https://github.com/SafeVault/vestrollmobile.git
   cd vestrollmobile
   ```

3. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

4. **Code Generation**:

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the Application**:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── app/                # App-wide configuration, themes, and routes
├── core/               # Shared utilities, constants, and network logic
├── data/               # Models, repositories, and data sources
├── domain/             # Business entities and use cases
├── features/           # Feature-specific logic (Auth, Payroll, Leave)
├── presentation/       # UI layer (Screens, Widgets, and BLoCs)
└── main.dart           # Application entry point
```

## Documentation

Comprehensive documentation for the mobile application:

- [Documentation Index](./docs/README.md)
- [Architecture Overview](./docs/architecture/overview.md)
- [Project Vision](./docs/context/project-overview.md)
- [Mobile Security Best Practices](./docs/security/best-practices.md)

## Use Cases

### Mobile Payroll Approval

Managers can review and approve payroll disbursements from anywhere, ensuring team members are paid on time.

### Contractor Invoice Tracking

Contractors can generate invoices and receive push notifications the moment funds are settled.

### Secure Balance Management

Individuals can safely manage their stablecoin and fiat balances with biometric security.

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for detailed guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/SafeVault/vestrollmobile/issues)
- **Email**: vestrollofficail@gmail.com

## Maintainers

<table align="center">
  <tr>
    <td align="center">
      <img src="https://github.com/codeze-us.png" alt="codeZe-us" width="150" />
      <br /><br />
      <strong>codeZe-us</strong>
      <br /><br />
      <a href="https://github.com/codeze-us" target="_blank">GitHub</a>
    </td>
  </tr>
</table>

---

## **Thanks to all the contributors who have made this project possible!**

[![Contributors](https://contrib.rocks/image?repo=SafeVault/vestrollmobile)](https://github.com/SafeVault/vestrollmobile/graphs/contributors)

---

<p align="center">
  <i>Empowering mobile financial orchestration with Stellar</i>
</p>

---
