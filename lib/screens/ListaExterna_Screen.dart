import 'dart:convert';

import 'package:app_json/screens/listaLocal_Screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ListaexternaScreen extends StatelessWidget {
  const ListaexternaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Externa"),
      ),
      body: listViewLocal("https://jritsqmet.github.io/web-api/crash.json"),
    );
  }
}

Future<List> jsonExterno(url) async {
  final response = await http.get(Uri.parse(url));

  if( response.statusCode == 200){
     return json.decode(response.body);
  }
  else{
    return throw Exception("Sin conexión");
  }
}

Widget listViewExterno(url){
  return FutureBuilder(future: jsonExterno(url), builder: (context, snapshot){
    if( snapshot.hasData){
      final data = snapshot.data!;
      return ListView.builder( itemCount: data.length ,itemBuilder: (context, index){
        final item = data[index];
        return ListTile(
          title: Text("hola"),
        );
      });
    }else{
      return Text("NO HAY INFO");
    }
  });
}