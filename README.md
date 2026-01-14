# Rick and Morty Characters App (Flutter)

## 📱 Project Description

This is a **Flutter-based mobile application** that displays characters from the **Rick and Morty API**.
The app supports **pagination**, **offline caching**, and **favorites management**, ensuring smooth usage even without an internet connection.

### Key Features
- 📜 Infinite scrolling (pagination)
- ⭐ Favorites management (saved locally)
- 💾 Offline support using Hive
- 🔄 Pull-to-refresh
- 🌗 Light & Dark theme
- 🧭 Bottom navigation (Characters & Favorites)
- ⚡ GetX for state management
- 🖼 Image caching

---

## 🛠 Tech Stack
- Flutter
- Dart
- GetX
- Hive
- HTTP
- Cached Network Image

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.7.3
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  cached_network_image: ^3.4.1
  http: ^1.6.0
```

---

## 🚀 Assembly & Start-up Instructions

### Prerequisites
- Flutter SDK installed
- Android Studio / VS Code
- Emulator or physical device

### Steps
```bash
git clone https://github.com/usmanahmad007/rick_morty_app.git
cd project-folder
flutter pub get
flutter run
```

---

## 🔧 Flutter Environment
- Flutter SDK: 3.40.0-0.2.pre
- Dart SDK: 3.11.0

---

## 📂 Project Structure
```
lib/
 ├── controllers/
 ├── models/
 ├── services/
 ├── screens/
 ├── widgets/
 ├── theme/
 └── main.dart
```

---

## 💾 Offline & Favorites
- Data cached locally using Hive
- Favorites persist after app restart
- Works without internet once data is cached

---

## 👤 Author
**Usman Ahmad**
Flutter Developer
