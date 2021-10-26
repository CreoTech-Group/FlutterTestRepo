import 'package:flutter/material.dart';
import 'location_args.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data = {};
  late String bgImage;
  late Color color;
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(data);
    print(1);
    if(data['isDaytime'] == '1') {
      color = Colors.black;
      bgImage = 'https://i.pinimg.com/564x/02/7b/69/027b69846abc18125c65f146701e2bf9.jpg';
    }
    else {
      color = Colors.white;
      bgImage = 'https://i.pinimg.com/564x/5e/74/4d/5e744db5c710c7d1ad3a0f919dd2eb55.jpg';
    }
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(bgImage)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location', arguments: LocationArguments(1));
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                      },
                    icon: Icon(Icons.edit_location, size: 35, color: color,),
                    label: Text('Edit location', style: TextStyle(fontSize: 20, color: color),),),

                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (data['location']).toString(),
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                        color: color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'].toString(),
                  style: TextStyle(
                    fontSize: 66.0,
                    color: color,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
