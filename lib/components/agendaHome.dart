import 'package:exercicios_flutter_fib/components/cadastroAgenda.dart';
import 'package:exercicios_flutter_fib/models/Agenda.dart';
import 'package:exercicios_flutter_fib/repositories/AgendaRepository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgendaHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AgendaHomeState();
  }
}

class AgendaHomeState extends State<AgendaHome> {
  void _showMenuOption(BuildContext context, Agenda agenda) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    launch("tel://" + agenda.telefone);
                    Navigator.pop(context);
                  },
                  child: Text("Ligar")
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => Colors.purple
                    ),
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroAgenda(agenda)),
                    );

                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text("Editar")
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => Colors.red
                    ),
                  ),
                  onPressed: () async {
                    await AgendaRepository.delete(agenda.id);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text("Excluir")
                )
              ],
            ),
          );
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agenda')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CadastroAgenda(new Agenda('', ''))),
          );
          setState(() {});
        },
        child: const Icon(Icons.add_circle),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: FutureBuilder(
            future: AgendaRepository.list(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return Text('Nenhum Placar encontrado');
              }

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          _showMenuOption(context, snapshot.data[index]);
                          setState(() {});
                        },
                        child: Container(
                          height: 80.0,
                          width: 300.0,
                          margin: new EdgeInsets.all(4),
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
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
                                  child: const Icon(Icons.person)),
                              title: Text(
                                snapshot.data[index].nome,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                snapshot.data[index].telefone,
                                style: TextStyle(fontSize: 16),
                              )),
                          )
                        );
                  });
            }),
      ),
    );
  }
}
