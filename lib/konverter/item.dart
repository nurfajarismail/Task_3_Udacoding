import 'package:flutter/material.dart';
import 'package:task_3/konverter/model.dart';
import 'converter.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final onTap;
  final index;
  CategoryItem(
      {@required this.category, @required this.onTap, @required this.index});

  void _navigateToConverter(BuildContext context) {
    var nav = Navigator.of(context);
    if (nav.canPop()) {
      nav.pop();
    }
    nav.push(MaterialPageRoute(builder: (BuildContext context) {
      return Converter(
        category: this.category,
      );
    }));
  }

  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: Build the custom widget here, referring to the Specs.
    return Material(
        color: Colors.transparent,
        child: Container(
          height: 100.0,
          padding: EdgeInsets.all(12.0),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            highlightColor: this.category.color,
            splashColor: this.category.color,
            onTap: () {
              print("I was tapped");
              _navigateToConverter(context);
              this.onTap(index);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      this.category.icon,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      this.category.name,
                      textAlign: TextAlign.center,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
