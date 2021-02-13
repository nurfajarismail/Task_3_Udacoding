import 'package:flutter/material.dart';

class ValidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berhasil"),
      ),
      body: Center(
        child: Container(
          child: Text("Yeay berhasil login"),
        ),
      ),
    );
  }
}
