import 'package:flutter/material.dart';
import 'package:food_app/model/dummy_meals.dart';
import 'package:food_app/ui/category_meal_screen.dart';
import 'package:food_app/ui/filter_screen.dart';
import 'package:food_app/ui/meal_detial.dart';
import 'package:food_app/ui/tabs_screen.dart';

import 'model/meal_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal= DUMMY_MEALS;
  List<Meal> _favoriteMeal=[];
  void _setFilters(Map<String,bool>filterData){
    setState(() {
      _filters=filterData;
      _availableMeal=DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void toggleFavorite(String mealId){
    final existingIndex=_favoriteMeal.indexWhere((meal)=>
      meal.id==mealId
    );
    if(existingIndex>-1){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed"))),
      home: TabsScreen(_favoriteMeal),
      debugShowCheckedModeBanner: false,
       initialRoute: '/TabScreen',
      routes: {
        TabsScreen.routeName: (ctx)=> TabsScreen(_favoriteMeal),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleFavorite,isMealFavorite),
        Filters.routeName: (ctx)=> Filters(_setFilters,_filters),
      },
    );
  }
}
