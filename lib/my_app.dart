import 'dart:math' as math;
import 'package:flutter/material.dart';

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

/// this is the main page that will be displayed
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The size for the text displayed in the middle of the screen
  final double textSize = 40;

  /// The maximum anount of luminance before the text has to be set to dark
  /// luminance value is returned so that 0 is darkest and 1 is lightest
  final double luminanceThreshold = 0.5;

  /// The maximum hex value of color
  final int maxColorInt = 0xFFFFFFFF;

  /// The color of the widget that underlies the entire screen.
  Color backgroundColor = Colors.white;

  /// The color of the text to be displayed on the screen
  /// This is set to dark or light depending on the luminance of the background
  Color textColor = Colors.black;

  /// Generates a random color value and sets it to background color
  void _changeColor() {
    setState(() {
      backgroundColor =
          Color(math.Random().nextInt(maxColorInt)).withOpacity(1.0);
      textColor = backgroundColor.computeLuminance() > luminanceThreshold
          ? Colors.black
          : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _changeColor method above.
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Text(
            'Hello there',
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
