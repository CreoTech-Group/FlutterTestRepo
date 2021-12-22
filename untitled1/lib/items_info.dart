import 'package:flutter/material.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/items.dart';

class ItemsInfo extends StatefulWidget {
  const ItemsInfo({Key? key}) : super(key: key);

  @override
  _ItemsInfoState createState() => _ItemsInfoState();
}

class _ItemsInfoState extends State<ItemsInfo> {
  Future<bool> getData() async {
    Future<bool> name = await Future.delayed(const Duration(seconds: 3), () {
      return Future<bool>.value(true);
    });
    return name;
  }

  @override
  void initState() {
    super.initState();
    print("init");
    Future<bool> data = getData();
    data.then((data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("${user.firstName} Info"),
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
                  user.avatar,
                ),
                fit: BoxFit.cover,
                height: 500,
              ))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Hero(
                      tag: "FirstName",
                      child: Text(user.firstName,
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 24))),
                ),
                Hero(
                  tag: "LastName",
                  child: Text(user.lastName,
                      style: const TextStyle(color: Colors.blue, fontSize: 24)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "Email",
                  child: Text(user.email,
                      style: const TextStyle(color: Colors.grey, fontSize: 22)),
                ),
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
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                            label: const Text(
                              "BACK",
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
