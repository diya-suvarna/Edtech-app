# EdTech Learning App 📚

A modern Flutter-based EdTech application designed to provide students with an engaging and interactive learning experience.

## ✨ Features

- 🏠 Student Home Dashboard
- 📚 Multiple subjects and courses
- 📖 Chapters and lesson navigation
- 🎥 Lesson learning interface
- 📝 Interactive multiple-choice quizzes
- 🎯 Automatic quiz score calculation
- 📊 Learning progress tracking
- 👤 Student profile
- 🔥 Daily learning streak
- ⚡ Quick learning actions
- 🎨 Modern and responsive UI
- 🧭 Simple navigation between learning sections

## 📱 Application Flow

Splash Screen  
↓  
Login / Register  
↓  
Notification  
↓  
Home Dashboard  
↓  
Subjects  
↓  
Chapters  
↓  
Lessons  
↓  
Quiz  
↓  
Results  
↓  
Progress / Profile

## 🛠️ Technologies Used

- Flutter
- Dart
- Material UI
- Local application state
- Mock/demo data

## 📂 Project Structure

```text
lib/
├── app/
├── screens/
│   ├── home_screen.dart
│   ├── subjects_screen.dart
│   ├── chapters_screen.dart
│   ├── lesson_screen.dart
│   ├── quiz_screen.dart
│   ├── progress_screen.dart
│   ├── profile_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── splash_screen.dart
│
├── services/
│   ├── auth_service.dart
│   └── progress_service.dart
│
└── widgets/
    ├── lesson_tile.dart
    ├── quick_action.dart
    ├── subject_card.dart
    └── stuff_card.dart
