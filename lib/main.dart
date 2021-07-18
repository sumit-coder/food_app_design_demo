// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:food_app_design_demo/pages/filterPage.dart';
import 'package:food_app_design_demo/pages/restaurant.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: true,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     ); For Testing
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, // Add the builder here
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child:
              RestaurantPage(), // Filter(), <--- This is Filter Page and on Menu Click menu work
        ),
      ),
    );
  }
}
