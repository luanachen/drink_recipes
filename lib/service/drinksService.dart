import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/drink.dart';

class DrinksService {
  static String _url =
      "https://run.mocky.io/v3/ebe197c2-ed2e-4b87-ae92-a632daaa8740";

  static Future<List<Drink>> browse() async {
    http.Response response = await http.get(_url);

    String content = response.body;
    List collection = json.decode(content);

    Iterable<Drink> _drinks = collection.map((json) => Drink.fromJson(json));

    return _drinks.toList();
  }
}
