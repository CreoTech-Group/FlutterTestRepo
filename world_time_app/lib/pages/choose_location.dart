import 'dart:io';

import 'package:flutter/material.dart';
import 'location_args.dart';



class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as LocationArguments;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: ElevatedButton(onPressed: (){
            setState(() {
              args.i += 1;
            });
          }, child: Text("c = ${args.i}"))
      ),
    );
  }
}
