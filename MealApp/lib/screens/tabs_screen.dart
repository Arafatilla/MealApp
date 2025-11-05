import 'package:flutter/material.dart';
import 'package:responsive_1/screens/mealsScreen.dart';

import '../models/meal.dart';
import 'categoriesScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _SlectedPageIndex = 0;
  final List<Meal> _FavoriteMeals = [];

  // snackBar to show message when adding a meal to favorites or removing it
    void ShowInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    }

  // Function to manage the toggling between adding meal to favorites or remove it when clicking on the star button
  void _ToggleFavorite(Meal meal) {
    final isExisting = _FavoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _FavoriteMeals.remove(meal);
        
      });
      ShowInfoMessage("Meal removed from favorites");
    } else {
      setState(() {
        _FavoriteMeals.add(meal);
       
      });
       ShowInfoMessage("Meal added to favorites");
    }
  }

  // function to transist between the pages in the bottom nav bar
  void _PageIndex(int index) {
    setState(() {
      _SlectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget SelectedPage = Categoriesscreen(ToggleFavorite: _ToggleFavorite);

    var selectedpageTitle = "cat";

    if (_SlectedPageIndex == 1) {
      SelectedPage = Mealsscreen(
        title: "Meals",
        meals: _FavoriteMeals,
        ToggleFavorite: _ToggleFavorite,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text("..")),
      body: SelectedPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _PageIndex,
        currentIndex: _SlectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}