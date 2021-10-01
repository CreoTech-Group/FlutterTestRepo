import 'package:flutter/material.dart';
import 'names.dart';
import 'list_item.dart';


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

  List<ListItem> items = [
    ListItem("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    ListItem("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya"),
    ListItem("Vasil", "Paligorov", "d-r Luba Grigorova 22, gorna banya")
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
        child: Column(
          children: items.map((item) => item).toList(),
        ),
      ),
    );
  }
}
// appBar: AppBar(
// title: const Text(
// 'my first app',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// letterSpacing: 2,
// fontFamily: 'IndieFlower',
// ),
// ),
// centerTitle: true,
// backgroundColor: Colors.orange,
// ),
// body: SafeArea(
// child: Row(
// children: [
// Expanded(
// flex: 3,
// child: Container(
// padding: EdgeInsets.all(30.0),
// color: Colors.red,
// child: Text(
// i.toString(),
// textAlign: TextAlign.center,
// ),
// ),
// ),
// Expanded(
// flex: 2,
// child: Container(
// padding: EdgeInsets.all(30.0),
// color: Colors.orange,
// child: Text(
// (i+1).toString(),
// textAlign: TextAlign.center
// )
// ),
// ),
// Expanded(
// flex: 3,
// child: Container(
// padding: EdgeInsets.all(30.0),
// color: Colors.yellow,
// child: Text(
// (i+2).toString(),
// textAlign: TextAlign.center
// ),
//
// ),
// )
// ],
// )
// ),
// floatingActionButton: FloatingActionButton(
// onPressed: () {
// setState(() {
// i++;
// });
// },
// child: Icon(Icons.add),
// backgroundColor: Colors.orange,
// ),
// );
// }