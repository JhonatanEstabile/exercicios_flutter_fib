import 'package:flutter/material.dart';

void main() {
  runApp(MainPlacar());
}

class MainPlacar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Placar',
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(title: Text("Placar"),),
          body: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Center(
            child: Row(
                //geral
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      //bandeira
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.0),
                          child: Image.asset(
                            'assets/images/brazil.png',
                            height: 40,
                            width: 40,
                          ),
                        )
                      ]),
                  Column(
                    //Brasil
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("Brasil",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("10",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40)),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    //X
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 3.0, right: 3.0),
                          child: Text('X',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 40)))
                    ],
                  ),
                  Column(
                      //Alemanha
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Alemanha",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                      ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.1),
                        child: Image.asset(
                          'assets/images/germany.png',
                          height: 35,
                          width: 35,
                        ),
                      )
                    ],
                  )
                ]),
          ),
        )));
  }
}
