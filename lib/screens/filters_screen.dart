import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters';
  final Function _saveFilters;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters, this._saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _isGlutenFree = widget._currentFilters['gluten'];
    _isVegetarian = widget._currentFilters['vegetarian'];
    _isVegan = widget._currentFilters['vegan'];
    _isLactoseFree = widget._currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final savedOptions = {
                  'gluten': _isGlutenFree,
                  'vegan': _isVegan,
                  'lactose': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                };

                widget._saveFilters(savedOptions);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    title: Text('Gluten-free'),
                    value: _isGlutenFree,
                    subtitle: Text('Only include gluten free meals'),
                    onChanged: (newvalue) {
                      setState(() {
                        _isGlutenFree = newvalue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose-free'),
                    value: _isLactoseFree,
                    subtitle: Text('Only include lactose free meals'),
                    onChanged: (newvalue) {
                      setState(() {
                        _isLactoseFree = newvalue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: _isVegan,
                    subtitle: Text('Only include vegan meals'),
                    onChanged: (newvalue) {
                      setState(() {
                        _isVegan = newvalue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _isVegetarian,
                    subtitle: Text('Only include vegetarian meals'),
                    onChanged: (newvalue) {
                      setState(() {
                        _isVegetarian = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
