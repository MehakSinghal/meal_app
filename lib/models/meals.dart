enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {this.title, this.id, this.affordability, this.categories, this.complexity, this.duration, this.isGlutenFree, this.imageUrl, this.ingredients, this.isLactoseFree, this.isVegan, this.isVegetarian, this.steps,});
}