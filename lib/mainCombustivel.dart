import 'package:exercicios_flutter_fib/components/resultadoCombustivel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CombustivelApp());
}

class CombustivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: CombustivelPage(title: 'Pagina de Login'),
    );
  }
}

class CombustivelPage extends StatefulWidget {
  CombustivelPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CombustivelPageState createState() => _CombustivelPageState();
}

class _CombustivelPageState extends State<CombustivelPage> {
  final TextEditingController alcoolController = new TextEditingController();
  final TextEditingController gasolinaController = new TextEditingController();

  String resultado = '';

  String calcularCombustivel(double precoAlcool, double precoGasolina) {
    double valor = precoAlcool/precoGasolina;

    if (valor < 0.7) {
      return 'Etanol';
    }

    return 'Gasolina';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 150.0, left: 50.0, right: 50.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 30,
          children: [
            Text("Calculo de combustivel", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            TextField(
              controller: alcoolController,
              obscureText: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                hintText: "Preço do Etanol",
              ),
            ),
            TextField(
              controller: gasolinaController,
              obscureText: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                hintText: "Preço da gasolina",
              ),
            ),
            SizedBox(
                width: double.maxFinite,
                height: 45, // set width to maxFinite
                child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      double precoAlcool = double.parse(
                        alcoolController.text.replaceFirst(RegExp(','), '.')
                      );

                      double precoGasolina = double.parse(
                        gasolinaController.text.replaceFirst(RegExp(','), '.')
                      );

                      String combustivel =  calcularCombustivel(precoAlcool, precoGasolina);

                      setState(() {
                        resultado = "O combustivel mais vantojoso é $combustivel";
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultadoCombustivel(text: resultado)),
                      );
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ))),   
            Text(resultado, style: TextStyle(fontSize: 20))
          ],
        ),
      )
    );
  }
}
