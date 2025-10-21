import 'package:flutter/material.dart';

class Mealsscreen extends StatelessWidget {
  const Mealsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
     title: Text("Meals of this country"),
      ),
      body: Text("Meal"),
    );
  }
}
