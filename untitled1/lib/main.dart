import 'package:flutter/material.dart';
import 'list_item.dart';
import 'items.dart';
import 'package:untitled1/items_info.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
      '/info': (context) => ItemsInfo(),
      '/home': (context) => Home(),
  },
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get onPressed => null;

  List<Item> items = [
    Item("Vasil1", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    Item("Vasil3", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    Item("Vasil4", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    Item("Vasil5", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    Item("Vasil6", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    Item("Vasil7", "Paligorov", "d-r Luba Grigorova 22, gorna banya")
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Lists items"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return ListItem(
                item: items[index],
                delete: () {
                  setState(() {
                    items.removeAt(index);
                  });
                }
            );
          }
        ),
      ),
    );
  }
}
