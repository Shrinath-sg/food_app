
import 'package:flutter/material.dart';
import 'package:food_app/ui/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id,this.title, this.color});
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,arguments: {'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap:()=> selectCategory(context),
      child: Container(
       // margin: EdgeInsets.only(top: 20,),
        padding: EdgeInsets.all(25),
          child: Text(title,style: TextStyle(fontSize: 19, fontFamily: "RobotoCondensed")),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight))),
    );
  }
}
