import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal , required this.OnToggleFavorite });

  final Meal meal;
  final void Function(Meal meal) OnToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: ()=> OnToggleFavorite(meal), icon: Icon(Icons.star),),],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 12),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 12),
            for (var ing in meal.ingredients)
              Text(
                ing,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,

                ),
              ),
            // display the steps of a meal

            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12 ,
                vertical: 8,
              ),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(height: 12),
            for (var Steps in meal.steps)
              Text(
                Steps,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,

                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
