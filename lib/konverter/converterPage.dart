import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String _konversi1;
  String _konversi2;
  double _inputKonversi;
  String _hasilKonversi;

  void initState() {
    _inputKonversi = 0;
    super.initState();
  }

  final List<String> _konversi = [
    'km',
    'hm',
    'dam',
    'm',
    'dm',
    'cm',
    'mm',
  ];
  final Map<String, int> _konversiMap = {
    'km': 0,
    'hm': 1,
    'dam': 2,
    'm': 3,
    'dm': 4,
    'cm': 5,
    'mm': 6,
  };

  dynamic _perhitungan = {
    '6': [0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1],
    '5': [0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10],
    '4': [0.0001, 0.001, 0.01, 0.1, 1, 10, 100],
    '3': [0.001, 0.01, 0.1, 1, 10, 100, 1000],
    '2': [0.01, 0.01, 1, 10, 100, 1000, 10000],
    '1': [0.1, 1, 10, 100, 1000, 10000, 100000],
    '0': [1, 10, 100, 1000, 10000, 100000, 1000000],
  };

  void convert(double value, String from, String to) {
    int nFrom = _konversiMap[from];
    int nTo = _konversiMap[to];
    var multiplier = _perhitungan[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      _hasilKonversi = 'This conversion cannot be performed';
    } else {
      _hasilKonversi = ' ${result.toString()}';
    }
    setState(() {
      _hasilKonversi = _hasilKonversi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Measures Converter'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            TextField(
              decoration: InputDecoration(
                hintText: "Please enter the value",
              ),
              onChanged: (text) {
                var rv = double.tryParse(text);
                if (rv != null) {
                  setState(() {
                    _inputKonversi = rv;
                  });
                }
              },
            ),
            Spacer(),
            Row(
              children: [
                DropdownButton(
                  hint: Text(
                    "Unit",
                  ),
                  items: _konversi.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _konversi1 = value;

                      if (_konversi1.isEmpty ||
                          _konversi2.isEmpty ||
                          _inputKonversi == 0) {
                        return;
                      } else {
                        convert(_inputKonversi, _konversi1, _konversi2);
                      }
                    });
                  },
                  value: _konversi1,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue[600],
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Spacer(),
                DropdownButton(
                  hint: Text(
                    "Unit",
                  ),
                  items: _konversi.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _konversi2 = value;

                      if (_konversi1.isEmpty ||
                          _konversi2.isEmpty ||
                          _inputKonversi == 0) {
                        return;
                      } else {
                        convert(_inputKonversi, _konversi1, _konversi2);
                      }
                    });
                  },
                  value: _konversi2,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              (_hasilKonversi == null) ? '' : _hasilKonversi,
            ),
            Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
