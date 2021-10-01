import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget{
  late String t1;
  late String t2;
  late String t3;

  ListItem(this.t1, this.t2, this.t3);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(color: Colors.redAccent, width: 1.0)
      ),
      child: Container(
        margin: EdgeInsets.all(3),
        child: Row(
          children:[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(t1, style: TextStyle( fontSize: 20, color: Colors.cyan), ),
                  Text(t2, style: TextStyle( fontSize: 16, color: Colors.grey), ),
                  Text(t3, style: TextStyle( fontSize: 18, color: Colors.black),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.edit, color: Colors.blue,),
                          Icon(Icons.delete, color: Colors.blue,)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("PP:", style: TextStyle(fontSize: 16),),
                            color: Colors.grey[300],
                            margin: EdgeInsets.all(3),
                          ),
                          Container(
                            child: Text("PR:", style: TextStyle(fontSize: 16),),
                            color: Colors.grey[300],
                            margin: EdgeInsets.all(3),
                          ),
                          Container(
                            child: Text("PV: 5", style: TextStyle(fontSize: 16),),
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
    );
  }
}