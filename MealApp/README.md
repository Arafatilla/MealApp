# 🍽️ Meals App – Flutter Project

A simple and beginner-friendly Flutter application that displays meals, categories, filters, and details using clean UI and basic state management.  
This project demonstrates navigation, widget composition, data modeling, and the use of Flutter’s built-in `setState()` for reactive updates.

---

## 📂 Project Structure
lib/
├── Data/
│ └── dummy_data.dart # Contains all static/dummy data used across the app
│
├── models/
│ ├── category.dart # Category model
│ └── meal.dart # Meal model
│
├── screens/
│ ├── categoriesScreen.dart # Displays all categories
│ ├── Filters_screen.dart # Filters logic (gluten-free, vegan, etc.)
│ ├── meal_detail_screen.dart # Shows detailed meal information
│ ├── mealsScreen.dart # Displays meals from a selected category
│ └── tabs_screen.dart # Main tab navigation between screens
│
├── widgets/
│ ├── category_grid_item.dart # Widget for the category card in the grid
│ ├── main_drawer.dart # App drawer with navigation
│ └── meal_item.dart # Single meal card widget
│
└── main.dart # App entry point
---

## 🧠 State Management

This project uses **Flutter’s simplest state management: `setState()`**.

- No external libraries like Provider, Riverpod, Bloc, or GetX  
- UI updates happen directly inside `StatefulWidgets`  
- Perfect for learning how Flutter rebuilds UI based on internal state changes  

Example:

```dart
setState(() {
  _filters['gluten'] = newValue;
});

## Getting Started – Run the Project Locally

Follow these steps to clone and run this project on your machine.

1. Clone the repository
git clone https://github.com/your-username/your-repo.git
2. Navigate to the project directory
cd your-repo
3. Install dependencies
flutter pub get
4. Run the app
flutter run
## 🔧 Technologies Used

Flutter

Dart

Material Design

setState() for state management