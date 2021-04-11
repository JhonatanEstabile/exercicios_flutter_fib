import 'dart:convert';
import 'package:exercicios_flutter_fib/components/CardFinance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cotacao = TextEditingController();
  double valor = 1;

  Future<Map> getData() async {
    Uri requestURL = Uri.https("api.hgbrasil.com", "finance",
        {'format': 'json-cors', 'key': '042324f4'});

    http.Response response = await http.get(requestURL);
    return jsonDecode(response.body);
  }

  String calculaCotacao(String valorMoeda) {
    double valorMoedaConvertido = double.parse(valorMoeda);
    return (valorMoedaConvertido * valor).toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cotação de moedas",
        home: Scaffold(
          appBar: AppBar(title: Text("Cotação de moedas")),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Column(children: [
              TextField(
                controller: cotacao,
                obscureText: false,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15.0),
                  hintText: 'Valor',
                ),
              ),
              ElevatedButton(
                  child: Text("Realizar cotação"),
                  onPressed: () {
                    setState(() {
                      valor = double.parse(cotacao.text.toString());
                    });
                  }),
              SizedBox(
                height: 5.0,
              ),
              FutureBuilder<Map>(
                  future: getData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(
                          child: Text("Esperando"),
                        );
                      case ConnectionState.waiting:
                        return Center(
                            child: Text(
                          "Aguarde...",
                          style: TextStyle(color: Colors.green, fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ));
                      default:
                        if (snapshot.hasError) {
                          return Center(child: Text("error"));
                        }
                        return Expanded(
                          child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            new CardFinance(
                                "Dolar",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["USD"]["buy"].toString()
                                )
                              ),
                              new CardFinance(
                                "Euro",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["EUR"]["buy"].toString()
                                )
                              ),

                              new CardFinance(
                                "Libra Esternina",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["GBP"]["buy"].toString()
                                )
                              ),

                              new CardFinance(
                                "Peso Argentino",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["ARS"]["buy"].toString()
                                )
                              ),

                              new CardFinance(
                                "Dolar Canadense",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["CAD"]["buy"].toString()
                                )
                              ),

                              new CardFinance(
                                "Dolar australiano",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["AUD"]["buy"].toString()
                                )
                              ),

                              new CardFinance(
                                "Iene",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["JPY"]["buy"].toString()
                                )
                              ),
                              new CardFinance(
                                "Remimbi (chinesa)",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["CNY"]["buy"].toString()
                                )
                              ),
                              new CardFinance(
                                "Bitcoin",
                                calculaCotacao(
                                  snapshot.data["results"]["currencies"]["BTC"]["buy"].toString()
                                )
                              )
                          ]
                        ));
                    }
                  })
            ]),
          ),
        ));
  }
}
