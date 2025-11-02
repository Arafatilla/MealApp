import 'package:flutter/material.dart';
import 'package:responsive_1/widgets/meal_item.dart';

import '../models/meal.dart';
import 'meal_detail_screen.dart';

class Mealsscreen extends StatelessWidget {
  const Mealsscreen({super.key ,
  required this.title ,
  required this.meals});

  final String title;
  final List<Meal> meals;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
     title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          /* .map((e) => Text(e.title)) goes through each element e in that list and transforms it into a Text widget that displays the meal’s title.
        
        So for every Meal object, we create a Text widget showing e.title.
        
        Finally, .toList() converts the resulting sequence of widgets
        (from the map) into a list — because the
        children: property of a widget like Column or Row expects a List<Widget>*/
          children: meals.map((meal) => MealItem(meal: meal, OnSelect: (Meal meal) {

            Navigator.push(context,
                MaterialPageRoute(
                    builder:(context) => MealDetailScreen(meal: meal)));
          },)).toList(),
        ),
      ),
    );
  }
}