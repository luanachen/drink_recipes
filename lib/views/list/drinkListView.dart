import 'package:drink_recipes/views/list/drinksListBuilder.dart';
import 'package:flutter/material.dart';

import '../../manager/drinksManager.dart';
import '../../model/drink.dart';
import '../detail/drinkDetailView.dart';

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
                      child: Icon(Icons.no_drinks_outlined),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DrinkDetailView(drink: _drink)));
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: drinks?.length ?? 0);
          },
        ));
  }
}
