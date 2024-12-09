import 'package:app_json/screens/ListaExterna_Screen.dart';
import 'package:app_json/screens/listaLocal_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo()
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice=0;
  List <Widget> paginas =[const ListaLocal(), const ListaexternaScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: const Color.fromRGBO(255, 8, 8, 1),),
      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap:(value) {
          setState(() {
            indice = value;
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.data_object_rounded), label: "Local"),
        BottomNavigationBarItem(icon: Icon(Icons.web_stories_sharp), label: "Externo" )
      ]),
    );
  }
}