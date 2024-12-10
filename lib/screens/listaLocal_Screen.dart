import 'dart:convert';

import 'package:flutter/material.dart';

class ListaLocal extends StatelessWidget {
  const ListaLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Local"),
        backgroundColor: Color.fromRGBO(90, 254, 95, 1),
      ),
      body: listViewLocal(context)
    );
  }
}

Future<List> jsonLocal(context) async {
  final jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/crash.json");

  return json.decode(jsonString);
}

Widget listViewLocal(context){
  return FutureBuilder(future: jsonLocal(context), builder: (context, snapshot){
    if( snapshot.hasData ){
      final data = snapshot.data!;
      return ListView.builder( itemCount: data.length ,itemBuilder: (context, index){
        final item = data[index];
        return  ListTile(
          title: Text(item['name']),
          subtitle: Image.network(item['image'], height: 100,),
        );

      } );

    }else{
      return Text("NO HAY DATA");
    }
  } );
}