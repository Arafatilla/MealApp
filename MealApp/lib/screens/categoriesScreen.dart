import 'package:flutter/material.dart';
import 'package:responsive_1/widgets/category_grid_item.dart';

import '../Data/dummy_data.dart';
import '../models/meal.dart';


class Categoriesscreen extends StatelessWidget {

  final void Function(Meal meal) ToggleFavorite  ;
  const Categoriesscreen({super.key, required this.ToggleFavorite, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      title : const Text("Meal App"),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15 ,
          //childAspectRatio: 1.5 ,
            ),
      children: [
        //in flutter the loop does not have {} ?
        for (final category in availableCategories)
        CategoryGridItem(
            cat:category, ToggleFavorite: ToggleFavorite, availableMeals: availableMeals,
        ),
      ],),
    );
  }
}
