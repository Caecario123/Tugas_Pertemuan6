import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmiResult;
  String? _bmiStatus;

  void _calculateBMI() {
    if (_heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty) {
      double height = double.parse(_heightController.text) / 100.0;
      double weight = double.parse(_weightController.text);

      double bmi = weight / (height * height);

      setState(() {
        _bmiResult = bmi;
        if (bmi < 18.5) {
          _bmiStatus = "Kekurangan berat badan";
        } else if (bmi >= 18.5 && bmi < 25) {
          _bmiStatus = "Normal (ideal)";
        } else if (bmi >= 25 && bmi < 30) {
          _bmiStatus = "Kelebihan berat badan";
        } else {
          _bmiStatus = "Kegemukan (obesitas)";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME, ${widget.username}!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Image.asset(
                  'assets/page1.jpg',
                  width: 400,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Berat Badan (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Hitung BMI'),
              ),
              SizedBox(height: 16.0),
              _bmiResult != null
                  ? Column(
                      children: [
                        Text(
                          'BMI: ${_bmiResult!.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Status BMI: $_bmiStatus',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
