import 'package:exercicios_flutter_fib/components/agendaHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AgendaApp());
}

class AgendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: AgendaHome(),
    );
  }
}