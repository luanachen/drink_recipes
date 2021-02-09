import 'package:drink_recipes/model/drink.dart';
import 'package:flutter/material.dart';

class DrinkDetailView extends StatelessWidget {
  final Drink drink;

  DrinkDetailView({this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${drink.name}'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.no_drinks_outlined),
            Text('${drink.recipe}'),
          ],
        ),
      ),
    );
  }
}
