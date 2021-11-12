import 'package:flutter/material.dart';
import 'get_data.dart';
import 'list_item.dart';
import 'items.dart';
import 'package:untitled1/items_info.dart';
import 'package:untitled1/di/injection_container.dart' as di;

void main() {
  di.init();
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/info': (context) => ItemsInfo(),
      '/home': (context) => Home(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get onPressed => null;

  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      getData().then((value) => {items.addAll(value)});
    });
  }

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
            itemBuilder: (context, index) {
              return ListItem(
                  item: items[index],
                  delete: () {
                    setState(() {
                      items.removeAt(index);
                    });
                  });
            }),
      ),
    );
  }
}
