import 'package:flutter/material.dart';
import 'package:food_app/model/dummy_meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function _toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this._toggleFavorite,this.isFavorite);
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Widget buildPageTitle(BuildContext ctx, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.title,
        ),
      );
    }

    Widget buildPageContainer(Widget child) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: height*0.30,
        width: width*0.95,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: child,
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: isFavorite(mealId)?Icon(Icons.star):Icon(Icons.star_border),
          onPressed:()=>  _toggleFavorite(mealId)
              //Navigator.of(context).pop(mealId),
        ),
        appBar: AppBar(
          title: Text(selectedMeal.title,style: TextStyle(fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height*0.30,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildPageTitle(context, "Ingredients"),
              buildPageContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildPageTitle(context, "Steps"),
              buildPageContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${(index + 1)}",style: TextStyle(fontSize: 18)),
                      ),
                      title: Text(selectedMeal.steps[index],style: TextStyle(fontSize: 16)),
                    ),
                    Divider()
                  ]),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
              SizedBox(
                height: height*0.05,
              )
            ],
          ),
        ));
  }
}
