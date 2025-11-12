
  import 'package:flutter/material.dart';
  import 'package:responsive_1/Data/dummy_data.dart';

  import '../models/category.dart';
  import '../models/meal.dart';
  import '../screens/mealsScreen.dart';

  class CategoryGridItem extends StatelessWidget {

    final category cat ;
    final void Function(Meal meal) ToggleFavorite  ;
    CategoryGridItem({super.key , required this.cat, required this.ToggleFavorite , required this.availableMeals});
  final List<Meal> availableMeals;

    @override
    Widget build(BuildContext context) {
      // Wrapped the Container with the InkWell that contain Ontap to make the category card clickable
      return InkWell(
        onTap: (){
          //  since it's in the onTap function so when the user click on a cat form the dummymeals filter just the elements who has the cat.id equal to the clicked category
          final List<Meal> Filteredmeal = availableMeals.where((element) => element.categories.contains(cat.id)).toList();
         Navigator.push ( context ,
             MaterialPageRoute(builder: (ctx)=>  Mealsscreen(
               title : cat.title,
               meals : Filteredmeal, ToggleFavorite: ToggleFavorite,
             ),
             )
         );
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(
            15
          ),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             gradient: LinearGradient(
               colors: [
                 cat.col.withOpacity(0.5),
             cat.col.withOpacity(0.89),
               ],
           )
           ),
            child: Text(
              cat.title ,
                // this means the current theme of the app ( all data ) .then set the text theme large copy this properties
              // with the current theme colorScheme , show it on the bg
              //“We take the app’s themed large text style and recolor it using the appropriate text color for the current background
                  style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,

              ),
            ),

        ),
      );
    }
  }
