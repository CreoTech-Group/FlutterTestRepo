import 'package:flutter/material.dart';
import 'list_item.dart';
import 'items.dart';


void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {

    List<Item> items = [
      Item("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
      Item("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
      Item("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
      Item("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya")
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Lists items"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Column(
          children: items.map((item) => ListItem(
              item: item,
              delete: () {
                setState(() {
                  items.remove(item);
                });
              },
          )).toList(),
        ),
      ),
    );
  }
}