import 'package:flutter/material.dart';
import 'package:responsive_1/screens/tabs_screen.dart';
import 'package:responsive_1/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

   bool _GlutenFree = false ;
   bool _LactoseFree = false ;
   bool _VeganFree = false ;
   bool _vegetarianFree = false ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          CustomSwitch(context, 
          "Gluten-free", 
          "free of gluten meal",
          (value) {
            setState(() {
              _GlutenFree = value ;
            });
          }, 
          _GlutenFree),

           CustomSwitch(context, 
          "Vegan", 
          "Vegan meal",
           (value) {
            setState(() {
              _VeganFree = value ;
            });
          },
          _VeganFree),

           CustomSwitch(context, 
          "Vegetarian", 
          "Vegetarian meal",
           (value) {
            setState(() {
              _vegetarianFree = value ;
            });
          },
          _vegetarianFree),

        CustomSwitch(context, 
          "LactoseFree", 
          "LactoseFree meal",
           (value) {
            setState(() {
              _LactoseFree = value ;
            });
          } ,
          _LactoseFree),
          

          
          
        ],  
      ),
      drawer: MainDrawer(OnSelectScreen: (identifier) {

      if(identifier == 'meals'){
        Navigator.of(context).pop();
       
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const TabsScreen(),
            ),
          );
        
      }
    }
      ),
  
    );
  }

  SwitchListTile CustomSwitch(BuildContext context , String title , String subtitle , Function (bool value) onChanged , bool ffilter){ {
    return SwitchListTile(
         title: Text(
      "Gluten free", 
     style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
      ),
      subtitle: Text(
      "free of gluten meal", 
     style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34 , right: 22),
      
          value: filter  , 
          onChanged: onChanged
          );
  }
}