import 'package:flutter/material.dart';

class DrinkListView extends StatefulWidget {
  final String title;

  DrinkListView({this.title});

  @override
  _DrinkListViewState createState() => _DrinkListViewState();
}

class _DrinkListViewState extends State<DrinkListView> {
  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) => ListTile(title: Text("drinks")),
        ));
  }
}
