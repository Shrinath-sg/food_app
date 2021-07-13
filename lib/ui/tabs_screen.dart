import 'package:flutter/material.dart';
import 'package:food_app/model/meal_model.dart';
import 'package:food_app/ui/categories_screen.dart';
import 'package:food_app/ui/favorite_screen.dart';
import 'package:food_app/widgets/drawer_screen.dart';

class TabsScreen extends StatefulWidget {
   List<Meal> favoriteMeal=[];
  TabsScreen(this.favoriteMeal);
  static const routeName = '/TabScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<dynamic, dynamic>> screens=[];
  int _selectedPageIndex = 0;
  @override
  void initState() {
    screens=[
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeal), 'title': 'Your Favorite'}
    ];
    super.initState();
  }
  void _selectedItem(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(screens[_selectedPageIndex]['title'],style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: screens[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectedItem,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              label: "Categories",
              icon: Icon(Icons.category),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              label: "Favorites",
              icon: Icon(Icons.star),
              backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}
