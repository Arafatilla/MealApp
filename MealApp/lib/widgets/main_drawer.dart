import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.OnSelectScreen});

  final void Function(String identifier) OnSelectScreen ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
DrawerHeader(
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
      Theme.of(context).colorScheme.primaryContainer,
      Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7) ,
     ]) ,
  ),
  child : Row(
    children: [
      Icon(
        Icons.fastfood,
        size: 48,
        color: Theme.of(context).colorScheme.primary,
      ), 
      SizedBox(width: 20,),
      Text(
        "Cooking up", 
       style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ],
    )
  ),
  
  //  Meals ListTile 
  ListTile(
     onTap: () {
        OnSelectScreen('meals');
      },
    leading: Icon(
      Icons.restaurant,
      color : Theme.of(context).colorScheme.onBackground,

    ),
    title: Text(
        "Meals", 
       style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
  ),
  // filters ListTile 
  ListTile(
      onTap: () {
          OnSelectScreen('filters');
        },
    leading: Icon(
      Icons.settings,
      color : Theme.of(context).colorScheme.onBackground,
      
    ),
    title: Text(
        "filters", 
       style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
  )
        ],
      ),
    );
  }
}