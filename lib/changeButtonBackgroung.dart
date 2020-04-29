import 'package:flutter/material.dart';

class ChangeButtonBackground extends StatefulWidget {
  @override
  ChangeButtonBackgroundState createState() {
    return new ChangeButtonBackgroundState();
  }
}

class ChangeButtonBackgroundState extends State<ChangeButtonBackground> {
  List<Color> _colors = [ //Get list of colors
    Colors.yellowAccent[400],
    Colors.amber[600]
  ];

  int _currentIndex = 0;

  _onChanged() { //update with a new color when the user taps button
    int _colorCount = _colors.length;

    setState(() {
      if (_currentIndex == _colorCount - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex += 1;
      }
    });

    //setState(() => (_currentIndex == _colorCount - 1) ? _currentIndex = 1 : _currentIndex += 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Button Background color'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Tap to change color'),
            onPressed: _onChanged,
            color: _colors[_currentIndex], //specify background color  of button from our list of colors
          ),
        ));
  }
}