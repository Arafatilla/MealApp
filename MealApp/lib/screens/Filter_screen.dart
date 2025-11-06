import 'package:flutter/material.dart';
import 'package:responsive_1/screens/tabs_screen.dart';
import 'package:responsive_1/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          Text("Adjust your meal selection"),
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
}