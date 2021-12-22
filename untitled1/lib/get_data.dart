import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled1/items.dart';

Future<List<Item>> getData() async {
  List<Item> items = [];
  Response response = await get(Uri.parse('https://reqres.in/api/users'));
  Map data = jsonDecode(response.body);
  List apiItems = data['data'];
  for (var element in apiItems) {
    items.add(Item(element['first_name'], element['last_name'],
        element['email'], element['avatar']));
  }
  return items;
}
