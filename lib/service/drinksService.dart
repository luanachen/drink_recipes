import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/drink.dart';

class DrinksService {
  static String _url =
      "https://run.mocky.io/v3/2f10f18f-f8b0-45d5-b247-d192a6392a07";

  static Future<List<Drink>> browse() async {
    http.Response response = await http.get(_url);

    String content = response.body;
    List collection = json.decode(content);

    Iterable<Drink> _drinks = collection.map((json) => Drink.fromJson(json));

    return _drinks.toList();
  }
}
