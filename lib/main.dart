import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          thumbColor: Colors.greenAccent,
          activeTrackColor: Colors.greenAccent,
        ),
        fontFamily: 'Barlow',
      ),
      home: Scaffold(
        body: BMICalculator(),
        backgroundColor: Color.fromARGB(255, 10, 18, 27),
      ),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _weightSliderValue = 30.0;
  double _heightSliderValue = 1.0;

  double calculateBMI() {
    if (_heightSliderValue == 0.0) {
      return 0;
    } else {
      return _weightSliderValue / (_heightSliderValue * _heightSliderValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    double BMI = calculateBMI();
    Color textColor =
        BMI >= 20.0 && BMI <= 25.0 ? Colors.greenAccent : Colors.redAccent;

    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Weight (kg): ' +
                      _weightSliderValue.toStringAsPrecision(3) +
                      'kg',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Slider(
                  value: _weightSliderValue,
                  min: 30.0,
                  max: 200.0,
                  onChanged: (newValue) {
                    setState(() {
                      _weightSliderValue = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                calculateBMI().toStringAsPrecision(3),
                style: TextStyle(
                    fontSize: 120.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: textColor, blurRadius: 10.0)]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Height (m): ' +
                      _heightSliderValue.toStringAsPrecision(3) +
                      'm',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Slider(
                    value: _heightSliderValue,
                    min: 1.0,
                    max: 2.1,
                    onChanged: (newValue) {
                      setState(() {
                        _heightSliderValue = newValue;
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
