import 'dart:convert';

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
      body: listViewExterno("https://jritsqmet.github.io/web-api/video_juegos.json"),
    );
  }
}

Future<List> jsonExterno(url) async {
  final response = await http.get(Uri.parse(url));

  if( response.statusCode == 200){
     //return json.decode(response.body);

    final data = json.decode(response.body);
    return data['videojuegos'];

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
        return Card(
          child:  ListTile(
          title: Text(item['titulo']),
          subtitle: Row(
            children: [
              Image.network(item["imagen"], width: 150, height: 150,),
              Expanded(child: Text(item['descripcion']))     
            ],
          ),
        ),
        ) ;
      });
    }else{
      return Center(child: Image.network("https://i.gifer.com/ZKZg.gif"));
    }
  });
}