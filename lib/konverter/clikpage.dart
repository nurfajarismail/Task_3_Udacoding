import 'package:flutter/material.dart';
import 'package:task_3/konverter/item.dart';
import 'package:task_3/konverter/model.dart';

final _backgroundColor = Colors.white;

class CategoryList extends StatefulWidget {
  CategoryList();

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var _categories = [
    CategoryModel(
        name: 'Mulai Konversi',
        color: Colors.white,
        icon: null,
        unitMap: {
          'km': 1000.0,
          'hm': 100.0,
          'dam': 10.0,
          'm': 1.0,
          'dm': 0.1,
          'cm': 0.01,
          'mm': 0.001
        }),
  ];

  Widget _buildCategoryWidgets(List<Widget> categories) {
    // ignore: unrelated_type_equality_checks
    if (Orientation.landscape == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: GridView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  categories[index],
              itemCount: 1,
              gridDelegate: null,
            ),
          ),
        ],
      );
    } else {
      return Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => categories[index],
          itemCount: 1,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = <CategoryItem>[];
    for (var i = 0; i < _categories.length; i++) {
      categories.add(
          CategoryItem(index: i, category: _categories[i], onTap: (index) {}));
    }
    final page = Scaffold(
      appBar: AppBar(
        title: Text("Konversi Panjang"),
      ),
      body: Center(
        child: Container(
          //height: 100,
          color: _backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              height: 100,
              color: Colors.blue,
              child: _buildCategoryWidgets(categories)),
        ),
      ),
    );

    return page;
  }
}
