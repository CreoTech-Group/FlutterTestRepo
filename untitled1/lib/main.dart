import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'my first app',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontFamily: 'IndieFlower',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.orange,
                child: Text("1"),
              ),
              Container(),
              Container()
            ],
          ) 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: const Text("+"),
        backgroundColor: Colors.orange,
      ),
    );
  }
}