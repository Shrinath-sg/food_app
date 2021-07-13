import 'package:flutter/material.dart';
import 'package:food_app/ui/tabs_screen.dart';
import 'package:food_app/widgets/drawer_screen.dart';

class Filters extends StatefulWidget {
  static const routeName = '/Filters';
  final Function saveFilters;
 final Map<String , bool> currentFilters;
  Filters(this.saveFilters,this.currentFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  void initState(){
    _glutenFree=widget.currentFilters['gluten'];
    _lactosFree=widget.currentFilters['lactose'];
    _vegetarian=widget.currentFilters['vegetarian'];
    _vegan=widget.currentFilters['vegan'];
    super.initState();
  }
  Widget buildSwitchListTile(
      {String title, String subtitle, bool value, Function onTapHandler}) {
    return SwitchListTile(
      value: value,
      onChanged: onTapHandler,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle,
          style: TextStyle(
            fontSize: 16,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:(){
            final selectedFilters={
              'gluten': _glutenFree,
              'lactose': _lactosFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian};
            widget.saveFilters(selectedFilters);
            Navigator.pushReplacementNamed(context, TabsScreen.routeName);
          }),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  title: "Gluten_Free",
                  subtitle: "only include Gluten_free",
                  value: _glutenFree,
                  onTapHandler: (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  }),
              buildSwitchListTile(
                  title: "Lactose-Free",
                  subtitle: "only include Lactose-Free",
                  value: _lactosFree,
                  onTapHandler: (value) {
                    setState(() {
                      _lactosFree = value;
                    });
                  }),
              buildSwitchListTile(
                  title: "Vegetarian",
                  subtitle: "only include Vegetarian",
                  value: _vegetarian,
                  onTapHandler: (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
              buildSwitchListTile(
                  title: "Vegan",
                  subtitle: "only include Vegan",
                  value: _vegan,
                  onTapHandler: (value) {
                    setState(() {
                      _vegan = value;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }
}
