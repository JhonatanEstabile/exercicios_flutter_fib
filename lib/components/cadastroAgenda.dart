import 'package:exercicios_flutter_fib/models/Agenda.dart';
import 'package:exercicios_flutter_fib/repositories/AgendaRepository.dart';
import 'package:flutter/material.dart';

class CadastroAgenda extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final nome = TextEditingController();
  final telefone = TextEditingController();

  Agenda agenda;

  CadastroAgenda(Agenda agenda) {
    this.agenda = agenda;

    nome.text = agenda.nome;
    telefone.text = agenda.telefone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
        ),
        body: Container(
          margin: new EdgeInsets.only(top: 10),
          padding: new EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: nome,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Nome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: telefone,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Telefone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30)
                  )
                ),
                onPressed: () {
                  this.agenda.nome = nome.text;
                  this.agenda.telefone = telefone.text;

                  if (this.agenda.id != null) {
                    AgendaRepository.update(this.agenda);
                  } else {
                    AgendaRepository.save(this.agenda);
                  }

                  Navigator.of(context).pop();
                },
                child: Text("Salvar")
              ),
            ],
          ),
        ));
  }
}