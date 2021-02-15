import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VolumePage extends StatefulWidget {
  @override
  _VolumePageState createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController nilai1Controller = TextEditingController();
  TextEditingController nilai2Controller = TextEditingController();
  TextEditingController nilai3Controller = TextEditingController();

  double nilai1;
  double nilai2;
  double nilai3;
  double hasil;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Hitung Volume"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Card(
                  shadowColor: Colors.blue,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Volumenya adalah:"),
                      Text(
                        hasil.toString() + " m3",
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nilai1Controller,
                      // onSaved:(value )=> _username =value,

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: "Masukkan panjang sisi",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nilai2Controller,
                      //  onSaved: (value) => _password =value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: "Masukkan lebar sisi",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nilai3Controller,
                      //  onSaved: (value) => _password =value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        hintText: "Masukkan tinggi",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  // width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          nilai1 = double.parse(nilai1Controller.text);
                          nilai2 = double.parse(nilai2Controller.text);
                          nilai3 = double.parse(nilai3Controller.text);
                          if (nilai1.toString().isEmpty &&
                              nilai2.toString().isEmpty) {
                            print("Wajib diisi");
                            Fluttertoast.showToast(
                              msg: "Semua Kolom Wajib Diisi",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else {
                            hasil = nilai1 * nilai2 * nilai3;
                          }
                        });
                      },
                      child: Text(
                        "HITUNG LUAS",
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
