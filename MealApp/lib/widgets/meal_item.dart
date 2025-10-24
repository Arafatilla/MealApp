import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal});

  final Meal meal ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
     children: [
       // if you have a image url from the internt and u want to display it use image.network

       FadeInImage(
           placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl),
       ),
     ],
      ),
    );
  }
}
