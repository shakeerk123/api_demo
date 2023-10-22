import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _popularMovies(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _popularMovies(double screenWidth, double screenHeight) {
    return SizedBox(height: screenHeight * 0.50,width: screenWidth,child: Container(
      color: Colors.yellow,
    ),);
  }
}
