import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/meal_model.dart';
import 'package:food_app/ui/meal_detial.dart';
import 'package:shimmer/shimmer.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  //final Function removeItem;

  MealItem({
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
    this.id,
    // this.removeItem
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.pushNamed(ctx, MealDetailScreen.routeName, arguments: id)
        .then((resultId) {
      if (resultId != null) {
        //  removeItem(resultId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: CachedNetworkImage(
                placeholder: (context, url) => SizedBox(
                  width: double.infinity,
                  height: height * 0.30,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[50],
                    //period: const Duration(microseconds: 3000),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: width * 0.95,
                        height: height * 0.30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                imageUrl: imageUrl,
                height: height * 0.30,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Image.network(
              //   imageUrl,
              //   fit: BoxFit.cover,
              //   height: height*0.30,
              //   width: double.infinity,
              // ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Colors.black54,
                width: width,
                child: Text(
                  title,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$duration min",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$complexityText",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    // SizedBox(width: 10,),
                    Text(
                      "$affordabilityText",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
