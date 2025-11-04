import 'package:flutter/material.dart';
import 'package:responsive_1/screens/mealsScreen.dart';

import 'categoriesScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _SlectedPageIndex = 0;

  // function to transist between the pages in the bottom nav bar
  void _PageIndex(int index) {
    setState(() {
      _SlectedPageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    Widget SelectedPage = Categoriesscreen();

    var selectedpageTitle = "cat";

    if (_SlectedPageIndex == 1 ){
    SelectedPage= Mealsscreen(title: "Meals", meals: [],);

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
