  import 'package:flutter/material.dart';
  import 'package:transparent_image/transparent_image.dart';
  import '../models/meal.dart';
  class MealItem extends StatelessWidget {
    const MealItem({
      super.key,
      required this.meal});

    final Meal meal ;

    String get ComplexityText {
      switch (meal.complexity) {
        case Complexity.simple:
          return 'Simple';
          break;
        case Complexity.challenging:
          return 'Challenging';
          break;
        case Complexity.hard:
          return 'Hard';
          break;
        default:
          return 'Unknown';
          break;
      }
    }
      String get AffordabilityText {
        switch (meal.affordability) {
          case Affordability.affordable:
            return 'affordable';
            break;
          case Affordability.pricey:
            return 'pricey';
            break;
          case Affordability.luxurious:
            return 'luxurious';
            break;
          default:
            return 'Unknown';
            break;
        }
      }
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
          child: Column(
            children: [ Stack(

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
                     // new learned properties
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
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [

               ],
             )
                   ],
            ),
              // here we'll continue Building the UI

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          const SizedBox(width: 6),
                          Text('${meal.duration} min',
                            style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          Icon(Icons.work),
                          const SizedBox(width: 6),
                          Text("$ComplexityText",
                          style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          const SizedBox(width: 6),
                          Text("$AffordabilityText" ,
                            style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


            ],

          ),

        ),

      );
    }
  }
