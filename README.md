
# 🍲 DKSRecipe

## 📖 Project Overview

DKSRecipe is a mobile recipe-sharing application developed with Flutter.

The application allows users to browse recipes, search for recipes, filter recipes by category, view recipe details, and add new recipes through a simple and user-friendly interface.

This project was developed as part of a mobile application development course.

---

## ✨ Features

### Authentication
- Registration interface
- Login interface
- Local authentication simulation

### Recipe Management
- Browse recipes
- Search recipes by name
- Filter recipes by category
- View recipe details
- Add new recipes

### Favorites
- Favorites page interface

### Profile
- Profile page interface

---

## 🏗️ Project Structure

```text
lib/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── recipes/
│   ├── favorites/
│   ├── profile/
│   └── search/
│
├── providers/
│
└── main.dart
```

The project is organized using a feature-based architecture to improve code readability and maintainability.

---

## 🎨 State Management

### Riverpod

Riverpod is used to manage and share application state across different screens.

Benefits:
- Better code organization
- Shared application state
- Automatic UI updates

---

## 📊 Data Model

### RecipeModel

```dart
class RecipeModel {
  final String title;
  final String description;
  final String image;
  final String duration;
  final String category;
  final List<String> ingredients;
  final List<String> steps;
  final bool isFavorite;
}
```

---

## 🛠️ Technologies Used

- Flutter
- Dart
- Riverpod
- Material Design

---

## 📱 Screens

### Welcome Screen
Entry screen of the application.

### Login Screen
Allows users to access the application.

### Sign Up Screen
Allows users to create an account.

### Home Screen
Displays recipes with category filtering and search functionality.

### Recipe Detail Screen
Displays:
- Recipe image
- Description
- Ingredients
- Preparation steps

### Add Recipe Screen
Allows users to add a new recipe.

### Favorites Screen
Displays favorite recipes.

### Profile Screen
Displays profile interface.

---

## 🚀 Installation

Clone the repository:

```bash
git clone https://github.com/your-username/dksrecipe.git
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 🔮 Future Improvements

- Persistent data storage
- Image upload
- User profile management
- Recipe comments
- Recipe ratings
- Recipe sharing
- Advanced search filters
- Supabase integration

---
## 🎯 Design Patterns

### Observer Pattern
Implemented using Riverpod state management.
-- -
## 👩‍💻 Author

**Douaya Kagbe Sano**

- 
Master's Student in IT Expertise, Software Development and Database Management(IRIS4)
MediaSchool Montpellier


Academic Flutter project developed using Flutter and Riverpod.