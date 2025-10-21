import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {

  final category cat ;
  const CategoryGridItem({super.key , required this.cat});

  @override
  Widget build(BuildContext context) {
    // Wrapped the Container with the InkWell that contain Ontap to make the category card clickable
    return InkWell(
      onTap: (){

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
              // this means the current theme of the app ( all data ) .thne set the text theme large copy this properties
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
