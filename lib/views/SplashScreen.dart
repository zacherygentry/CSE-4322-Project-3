import 'dart:async';

import 'package:flutter/material.dart';
import 'TabScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => TabScreen(),
        ),
      ),
    );

    AssetImage assetsImage = AssetImage(
        'assets/images/icon.png'); //<- Creates an object that fetches an image.
    Image image = Image(image: assetsImage);

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "My To-Dos",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  image,
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('© Team <insert team name here>'),
            ),
          ],
        ),
      ),
    );
  }
}
