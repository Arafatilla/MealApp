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
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
        clipBehavior: Clip.hardEdge,
       elevation :2 ,
      child: InkWell(
        child: Stack(

       children: [
         // if you have a image url from the internt and u want to display it use image.network

         FadeInImage(
             placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl),

         ),
         Positioned(
           bottom: 0,
           left: 0,
           right: 0,
           child: Container(
             padding: EdgeInsets.symmetric(
               vertical: 10,
               horizontal: 10 ,
             ),
             color : Colors.black45,
             child: Column(
               children: [
                 Text(meal.title,
                 textAlign: TextAlign.center,
                 maxLines: 2,
                 softWrap: true,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 24 ,
                   fontWeight: FontWeight.bold,
                 ),),

               ],
             ),
           ),
         ),
         SizedBox(height:12),
         Row(
           children: [],
         )
       ],
        ),
      ),
    );
  }
}
