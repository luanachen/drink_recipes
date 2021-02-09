import 'package:drink_recipes/drinksListBuilder.dart';
import 'package:flutter/material.dart';

import 'manager/drinksManager.dart';
import 'model/drink.dart';

class DrinkListView extends StatelessWidget {
  DrinksManager manager = DrinksManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Drinks"),
        ),
        body: DrinksListBuilder(
          stream: manager.drinksListView,
          builder: (context, drinks) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Drink _drink = drinks[index];
                  return ListTile(
                    title: Text(_drink.name),
                    subtitle: Text(
                        "ingredientes: ${_drink.numberOfIngredients.toString()}"),
                    leading: CircleAvatar(
                      child: Icon(Icons.local_drink),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: drinks?.length ?? 0);
          },
        ));
  }
}
