import 'package:flutter/material.dart';
import 'package:responsive_1/Data/dummy_data.dart';
import 'package:responsive_1/screens/Filters_screen.dart';
import 'package:responsive_1/screens/mealsScreen.dart';
import 'package:responsive_1/widgets/main_drawer.dart';

import '../models/meal.dart';
import 'categoriesScreen.dart';


const kIntialFilters = {
  Filter.GlutenFree : false,
  Filter.LactoseFree : false,
  Filter.Vegan : false,
  Filter.Vegetarian : false
};
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _SlectedPageIndex = 0;
  final List<Meal> _FavoriteMeals = [];
  Map<Filter, bool> SelectedFilters = kIntialFilters ;
  // snackBar to show message when adding a meal to favorites or removing it
    void ShowInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    }

    // Function to control drawer icons 
    void _SetScreen(String identifier){
     
     // first we pop the drawer 
     // then if this condition is right we go to filterScreen then when we comeback we comeBack directly to the previous screen which is  MealsScreen
     if(identifier == 'filters'){
     Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentState : SelectedFilters, 
          ),
        ),
      ).then((value) => setState(() => SelectedFilters = value??  kIntialFilters),
        
      );
      
  
     }

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

     final List<Meal> availableMeals = dummyMeals.where((element) {

        if(SelectedFilters[Filter.GlutenFree]! && !element.isGlutenFree){
          return false ;
        }
         if(SelectedFilters[Filter.LactoseFree]! && !element.isLactoseFree){
          return false ;
        }
         if(SelectedFilters[Filter.Vegan]! && !element.isVegan){
          return false ;
        }
         if(SelectedFilters[Filter.Vegetarian]! && !element.isVegetarian){
          return false ;
        }

  return true;
    }).toList();
    
    Widget SelectedPage = Categoriesscreen(
      ToggleFavorite: _ToggleFavorite, 
      availableMeals:availableMeals,);


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
      drawer: MainDrawer(
        OnSelectScreen:_SetScreen,
        ),  
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