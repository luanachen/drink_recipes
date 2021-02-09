class Drink {
  final String name;
  final String recipe;
  final int numberOfIngredients;

  Drink.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        recipe = json['recipe'],
        numberOfIngredients = json['number_of_ingredients'];
}
