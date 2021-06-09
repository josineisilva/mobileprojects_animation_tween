import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _newColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tween Animation"),),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/stars.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: TweenAnimationBuilder<Color>(
              tween: ColorTween(begin: Colors.white, end: _newColor),
              duration: Duration(seconds: 4),
              onEnd: () {
                setState(() {
                  _newColor = _newColor == Colors.red ? Colors.white : Colors.red;
                });
              },
              builder: (_, Color color, __) {
                return ColorFiltered(
                  child: Image.asset('assets/images/sun.png'),
                  colorFilter: ColorFilter.mode(color, BlendMode.modulate),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}