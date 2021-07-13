import 'package:flutter/material.dart';
import 'package:food_app/model/dummy_data.dart';
import 'package:food_app/widgets/catergory_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          children: DUMMY_CATEGORIES
              .map((dummyData) =>
                  CategoryItem(id: dummyData.id,title: dummyData.title, color: dummyData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 5 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 130)
    );
  }
}
