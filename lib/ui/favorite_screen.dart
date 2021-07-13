import 'package:flutter/material.dart';
import 'package:food_app/model/meal_model.dart';

import 'meal_item.dart';

class FavoriteScreen extends StatelessWidget {
   List<Meal> favoriteMeals=[];
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty?Center(
        child: Container(
      child: Text(
        "No Favorites Selected ",
        style: Theme.of(context).textTheme.title,
      ),
    )):Center(child: ListView.builder(
      itemBuilder: (context, index) => MealItem(
        title: favoriteMeals[index].title,
        imageUrl: favoriteMeals[index].imageUrl,
        duration: favoriteMeals[index].duration,
        affordability: favoriteMeals[index].affordability,
        complexity: favoriteMeals[index].complexity,
        id: favoriteMeals[index].id,
      ),
      itemCount: favoriteMeals.length,
    ),);
  }
}
