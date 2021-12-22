import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features/users/domain/model/user.dart';
import 'items.dart';

class ListItem extends StatefulWidget {
  late User user;
  late VoidCallback delete;

  ListItem({Key? key, required this.user, required this.delete}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/info', arguments: (widget.user));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.redAccent, width: 1.0)),
        child: Container(
          margin: const EdgeInsets.all(3),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "FirstName",
                      child: Text(widget.user.firstName,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.cyan)),
                    ),
                    Hero(
                      tag: "LastName",
                      child: Text(widget.user.lastName,
                          style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    ),
                    Hero(
                      tag: "Email",
                      child: Text(widget.user.email,
                          style: const TextStyle(fontSize: 18, color: Colors.black)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            TextButton.icon(
                              onPressed: widget.delete,
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.blue,
                              ),
                              label: const Text("       "),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: const Text(
                                "PP:",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey[300],
                              margin: const EdgeInsets.all(3),
                            ),
                            Container(
                              child: const Text(
                                "PR:",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey[300],
                              margin: const EdgeInsets.all(3),
                            ),
                            Container(
                              child: const Text(
                                "PV: 5",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.grey[300],
                              margin: const EdgeInsets.all(3),
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
