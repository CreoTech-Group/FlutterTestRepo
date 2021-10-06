import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class ListItem extends StatelessWidget {
  late Item item;
  late VoidCallback delete;

  ListItem({required this.item, required this.delete});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/info', arguments: (item));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.redAccent, width: 1.0)),
        child: Container(
          margin: EdgeInsets.all(3),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.t1,
                        style: TextStyle(fontSize: 20, color: Colors.cyan)),
                    Text(item.t2,
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Text(item.t3,
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            TextButton.icon(
                                onPressed: delete,
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.blue,
                                ),
                                label: Text("       "),),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "PP:",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey[300],
                              margin: EdgeInsets.all(3),
                            ),
                            Container(
                              child: Text(
                                "PR:",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey[300],
                              margin: EdgeInsets.all(3),
                            ),
                            Container(
                              child: Text(
                                "PV: 5",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey[300],
                              margin: EdgeInsets.all(3),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
