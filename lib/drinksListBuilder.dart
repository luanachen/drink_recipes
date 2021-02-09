import 'package:flutter/material.dart';
import 'dart:async';
import 'model/drink.dart';

class DrinksListBuilder extends StatelessWidget {
  final Stream<List<Drink>> stream;
  final Function builder;

  DrinksListBuilder({this.stream, this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text("There was an error: ${snapshot.error}");
              List<Drink> drinks = snapshot.data;
              return builder(context, drinks);
          }
        });
  }
}
