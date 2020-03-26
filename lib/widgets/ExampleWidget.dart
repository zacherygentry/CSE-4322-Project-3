import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  final String exampleVar;
  const ExampleWidget({this.exampleVar = "Hello World"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(exampleVar),
      ),
    );
  }
}
