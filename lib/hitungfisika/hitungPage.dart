import 'package:flutter/material.dart';
import 'package:task_3/hitungfisika/luasPage.dart';
import 'package:task_3/hitungfisika/volumePage.dart';

class HitungPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hitung Fisika"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LuasPage()),
                      );
                    },
                    child: Text(
                      "Hitung Luas",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.blue,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VolumePage()),
                      );
                    },
                    child: Text(
                      "Hitung Volume",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
