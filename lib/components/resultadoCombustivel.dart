import 'package:flutter/material.dart';

class ResultadoCombustivel extends StatelessWidget {
  final String text;

  // receive data from the FirstScreen as a parameter
  ResultadoCombustivel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Second screen')),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
            ),
          ),
        )
      );
  }
}
