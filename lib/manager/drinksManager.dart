import 'dart:async';
import 'package:drink_recipes/service/drinksService.dart';
import '../model/drink.dart';

class DrinksManager {
  Stream<List<Drink>> get drinksListView =>
      Stream.fromFuture(DrinksService.browse());
}
