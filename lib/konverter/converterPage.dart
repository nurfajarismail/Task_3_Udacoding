import 'package:flutter/material.dart';
import 'package:task_3/konverter/clikpage.dart';

class ConverterPage extends StatefulWidget {
  @override
  _KonverterPageState createState() => _KonverterPageState();
}

class _KonverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: CategoryList()),
      ),
    );
  }
}
