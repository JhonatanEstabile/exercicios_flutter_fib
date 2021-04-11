import 'package:flutter/material.dart';

class CardFinance extends StatelessWidget {
  String moeda;
  String valor;

  CardFinance(String moeda, String valor) {
    this.moeda = moeda;
    this.valor = valor;
  }

  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 300.0,
      margin: new EdgeInsets.all(4),
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius:
              new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
              offset: new Offset(2.0, 5.0),
            )
          ]),
      child: ListTile(
          leading: SizedBox(
              height: 50.0,
              width: 50.0, // fixed width and height
              child: const Icon(Icons.monetization_on)),
          title: Text(
            moeda,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            valor,
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}