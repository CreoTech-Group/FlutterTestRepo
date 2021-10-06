import 'package:flutter/material.dart';
import 'package:untitled1/items.dart';

class ItemsInfo extends StatefulWidget {
  const ItemsInfo({Key? key}) : super(key: key);

  @override
  _ItemsInfoState createState() => _ItemsInfoState();
}

class _ItemsInfoState extends State<ItemsInfo> {

  void getData(){
    Future.delayed(Duration(seconds: 3), () {
      print("Vasil");
    });
  }

  @override
  void initState() {
    super.initState();
    print("init");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Item: ${item.t1} Info"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text("${item.t1}",
                      style: TextStyle(color: Colors.blue, fontSize: 24)),
                ),
                Text("${item.t2}",
                    style: TextStyle(color: Colors.blue, fontSize: 24)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${item.t3}",
                    style: TextStyle(color: Colors.grey, fontSize: 22)),
              ],
            ),
            Expanded(
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.thumb_up_alt_outlined,
                              size: 30,
                            ),
                            label: Text(
                              "Rabotix",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

