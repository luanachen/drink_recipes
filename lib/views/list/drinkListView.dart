import 'package:drink_recipes/views/list/drinksListBuilder.dart';
import 'package:flutter/material.dart';

import '../../manager/drinksManager.dart';
import '../../model/drink.dart';
import '../detail/drinkDetailView.dart';

class DrinkListView extends StatefulWidget {
  DrinkListView({Key key}) : super(key: key);

  @override
  _DrinkListViewState createState() => _DrinkListViewState();
}

class _DrinkListViewState extends State<DrinkListView> {
  DrinksManager manager = DrinksManager();

  bool showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Drinks"),
              actions: [
                IconButton(
                    padding: EdgeInsets.only(right: 28),
                    icon: Icon(showFavorites ? Icons.star : Icons.star_border,
                        color: showFavorites ? Colors.amber : Colors.white),
                    onPressed: () {
                      setState(() {
                        showFavorites = !showFavorites;
                      });
                    }),
              ],
            ),
            body: DrinksListBuilder(
              stream: manager.drinksListView,
              builder: (context, drinks) {
                drinks = showFavorites ? manager.favoriteDrinks : drinks;
                return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      Drink _drink = drinks[index];
                      bool isFavorite = manager.favoriteDrinks
                          .map((e) => e.name)
                          .contains(_drink.name);

                      return ListTile(
                        title: Text(_drink.name),
                        subtitle: Text(
                            "ingredientes: ${_drink.numberOfIngredients.toString()}"),
                        leading: CircleAvatar(
                          child: Icon(Icons.no_drinks_outlined),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                              isFavorite ? Icons.star : Icons.star_border,
                              color: isFavorite ? Colors.amber : null),
                          onPressed: () {
                            setState(() {
                              if (isFavorite) {
                                manager.favoriteDrinks.removeWhere(
                                    (element) => element.name == _drink.name);
                              } else {
                                manager.favoriteDrinks.add(_drink);
                              }
                            });
                          },
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
            )));
  }
}
