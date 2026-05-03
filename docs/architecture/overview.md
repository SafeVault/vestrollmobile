# Mobile Architecture Overview

The VestRoll Mobile application is built using **Clean Architecture** principles to ensure separation of concerns and testability.

## Layers

### 1. Data Layer (`lib/data`)
- **Models**: Data transfer objects and JSON serialization.
- **Repositories**: Implementation of domain repositories.
- **DataSources**: Remote (API via Dio) and Local (Hive/Secure Storage) data providers.

### 2. Domain Layer (`lib/domain`)
- **Entities**: Core business objects.
- **Repositories**: Abstract interfaces for data operations.
- **Usecases**: Specific business logic units.

### 3. Presentation Layer (`lib/presentation`)
- **Screens**: View widgets.
- **Widgets**: Reusable UI components.
- **BLoCs/Providers**: State management handling user events and data flow.

## State Management
We primarily use **BLoC** (Business Logic Component) for feature-specific state and **Riverpod** for global dependency injection and shared state.

## Navigation
Navigation is handled using **GoRouter**, providing a declarative way to manage deep links and complex routing logic.
