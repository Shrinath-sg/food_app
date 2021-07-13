import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTiles(String title,IconData iconData,BuildContext ctx,Function tapHandler){
    return Column(children: [
      ListTile(
        onTap: tapHandler,
        leading: Icon(iconData,color: Theme.of(ctx).primaryColor,),
        title: Text(
          title,
          style: TextStyle( fontWeight: FontWeight.w600),
        ),
      ),
      Divider(),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: height*0.20,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Text(
                "Cooking Up!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: "RobotoCondensed-Italic"),
              ),
            ),
          ),
          buildListTiles("Meals", Icons.restaurant,context,(){Navigator.pushReplacementNamed(context, '/TabScreen');}),
          buildListTiles("Filters", Icons.settings,context,(){Navigator.pushReplacementNamed(context, '/Filters');}),
          buildListTiles("Logout", Icons.login,context, (){}),
        ],
      ),
    );
  }
}
