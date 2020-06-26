import '../models/meals.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavourites;
  final Function isMealFavourite;
  MealDetailScreen(this.toggleFavourites, this.isMealFavourite);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final mealTitle = routeArgs['title'];
    final mealImage = routeArgs['imageUrl'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(mealTitle),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                //padding: EdgeInsets.all(15),
                child: Image.network(
                  mealImage,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'INGREDIENTS'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'STEPS'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),

            ],
          ),

        ),
        floatingActionButton: FloatingActionButton(
          child: Icon( isMealFavourite(mealId) ? Icons.star : Icons.star_border),
          onPressed: () => toggleFavourites(mealId),
        ),
    );
  }
}
