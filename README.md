# Shared Preferences in Flutter - Registration & Login System

This project demonstrates a simple registration and login system in Flutter using the **Shared Preferences** package to store user data locally.

## Features
- User Registration with username, email, phone number, and password.
- Local storage of user data using Shared Preferences.
- Persistent login state.
- Login and logout functionality.

## Folder Structure

```
lib/
├── data/
│   └── models/
│       └── userModel.dart
├── presentation/
│   ├── screens/
│   │   ├── homeScreen.dart
│   │   ├── loginScreen.dart
│   │   └── registrationScreen.dart
│   └── widgets/
│       └── customWidgets.dart
└── main.dart
```

### Key Files

- **main.dart**: The entry point of the application.
- **registrationScreen.dart**: Handles user registration.
- **loginScreen.dart**: Handles user login.
- **homeScreen.dart**: Displays user information and provides logout functionality.
- **userModel.dart**: Defines the `User` model.
- **customWidgets.dart**: Contains reusable UI components like text fields.

### Steps
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd <project-folder>
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the project:
   ```bash
   flutter run
   ```

## Shared Preferences Keys
- `userData`: Stores the serialized user data as a JSON string.
- `isLogin`: Stores the login state (`true` or `false`).