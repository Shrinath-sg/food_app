import 'package:flutter/material.dart';
import 'package:food_app/model/dummy_meals.dart';
import 'package:food_app/model/meal_model.dart';
import 'package:food_app/ui/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryMealTitle;
  List<Meal> categoryMeals;
  bool isDataLoaded=false;
  @override
  void didChangeDependencies() {
    if(!isDataLoaded) {
      final routeArguments =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      final String id = routeArguments['id'];
       categoryMealTitle = routeArguments['title'];

       categoryMeals =
      widget.availableMeals.where((meal) => meal.categories.contains(id)).toList();
       isDataLoaded=true;
      super.didChangeDependencies();
    }
  }
  void removeMeal(String id){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id==id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryMealTitle,style: TextStyle(fontWeight: FontWeight.w600),),centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            id: categoryMeals[index].id,
            //removeItem: removeMeal,
          ),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
