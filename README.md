# DemoApp

## Purpose
DemoApp is a simple iOS SwiftUI application that simulates the user registration, login, logout, and user management flow. The app follows the MVVM architecture with a routing system for navigation.

## Features
- **User Registration**: Create a new account with email, username, and password.
- **Login**: Sign in with registered email and password.
- **Login State Persistence**: Automatically navigates to Home if already logged in when reopening the app.
- **Logout**: Logs out and navigates back to the Login screen.
- **User List**: Home screen displays a list of registered users.
- **View Profile**: Tap a user in the list to view their detailed profile.

## Architecture & Structure
- **Scenes/**: Screens (Home, Login, Register, Profile) with their ViewModels and Routers.
- **Root/**: `CoreBuilder` and `CoreRouter` for navigation and view initialization.
- **Helpers/**: Utilities such as `AccountStore` for saving users to `UserDefaults`.
- **Extensions/**: String, UIApplication, View extensions, etc.
- **Services/Model/**: Data models (`UserModel`).

## How It Works
1. **App Launch**  
   - If logged in → Navigate to Home  
   - If not → Navigate to Login  
2. **Register**: Tap "Register" on Login screen → Fill details → Save user locally.  
3. **Login**: Enter credentials → On success, save current user session.  
4. **Logout**: Tap "Logout" on Home → Return to Login screen.  
5. **View Profile**: Tap a username on Home to see their profile.

## Tech Stack
- SwiftUI
- MVVM
- `UserDefaults` (local storage)
- SwiftfulRouting (navigation)
- NotificationCenter (login/logout state sync)

## Notes
- Local data only — no backend.
- Passwords are stored in **plain text** (for demo purposes only — do not use in production).

## Run the App
1. Open the project in **Xcode 16+**
2. Build & run on simulator
3. Register, login, and try the features

