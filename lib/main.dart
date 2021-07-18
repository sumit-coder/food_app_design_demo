import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:food_app_design_demo/pages/filterPage.dart';
import 'package:food_app_design_demo/pages/restaurant.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    ); //For Testing
// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      theme: ThemeData(fontFamily: 'PTSans'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double up = 50;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: size.height,
            padding: EdgeInsets.all(20),
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bigButton(
                  'RestaurantPage',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantPage()),
                    );
                  },
                ),
                SizedBox(height: 20),
                bigButton(
                  'FilterPage',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Filter()),
                    );
                  },
                ),
                Container(
                  height: 100,
                  width: size.width,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        child: Container(
                          height: up,
                          color: Colors.red,
                          child: Text('d'),
                        ),
                        curve: Curves.bounceIn,
                        top: up == 50 ? 50 : 80,
                        duration: const Duration(seconds: 1),
                      ),
                    ],
                  ),
                ),
                bigButton(
                  'FilterPage',
                  () {
                    if (up != 80) {
                      setState(() {
                        up = 80;
                      });
                    } else {
                      setState(() {
                        up = 50;
                      });
                    }
                  },
                ),
              ],
            ),
          ), //RestaurantPage(), <--- This is Filter Page and on Menu Click menu work
        ),
      ),
    );
  }

  InkWell bigButton(String title, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 50,
        width: 1000,
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: const Offset(
                0.0,
                2.0,
              ),
              blurRadius: 2.0,
              // spreadRadius: 2.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
