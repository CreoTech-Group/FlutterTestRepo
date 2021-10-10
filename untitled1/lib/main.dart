import 'package:flutter/material.dart';
import 'list_item.dart';
import 'items.dart';
import 'package:untitled1/items_info.dart';
import 'package:http/http.dart';
import 'dart:convert';


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

  ];

  void getData() async{

    Response response = await get(Uri.parse('https://reqres.in/api/users'));
    Map data = jsonDecode(response.body);
    List items = data['data'];
    setState(() {
      items.forEach((element) {
        this.items.add(Item(element['first_name'], element['last_name'], element['email'], element['avatar']));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
