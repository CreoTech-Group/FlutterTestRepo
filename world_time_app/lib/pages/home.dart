import 'package:flutter/material.dart';
import 'location_args.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(data);
    print(1);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location', arguments: LocationArguments(1));
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit location'))
          ],
        ),
      ),
    );
  }
}
