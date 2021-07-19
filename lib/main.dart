import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:food_app_design_demo/pages/filterPage.dart';
import 'package:food_app_design_demo/pages/restaurant.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

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
  RangeValues _currentRangeValues = RangeValues(1, 18);
  SfRangeValues currentRangeValues = SfRangeValues(2.0, 3.0);

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
                SizedBox(height: 20),
                Container(
                  // color: Colors.grey,
                  width: 250,
                  height: 80,
                  child: Stack(
                    children: [
                      // For Rang data Candles
                      Positioned(
                        bottom: 22,
                        child: Container(
                          width: 250,
                          height: 50,
                          // color: Colors.grey[600],
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          // height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: giveGandleList(
                              20, //this should be same as divisions value RangeSlider
                            ), // this Function return list of candles
                          ),
                        ),
                      ),
                      // For Rang Selecter
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 250,
                          // child: // RangeSlider(
                          //   activeColor: Colors.red[400],
                          //   inactiveColor: Colors.red,
                          //   values: _currentRangeValues,
                          //   min: 0,
                          //   max: 100,
                          //   divisions: 20,
                          //   // labels: RangeLabels(
                          //   //   _currentRangeValues.start.round().toString(),
                          //   //   _currentRangeValues.end.round().toString(),
                          //   // ),
                          //   onChanged: (RangeValues values) {
                          //     setState(() {
                          //       _currentRangeValues = values;
                          //     });
                          //   },
                          // ),
                          child: SfRangeSliderTheme(
                            data: SfRangeSliderThemeData(
                              activeTrackHeight: 5,
                              thumbStrokeWidth: 3,
                              thumbStrokeColor: Colors.red,
                            ),
                            child: SfRangeSlider(
                              startThumbIcon: Container(
                                color: Colors.white,
                                margin: EdgeInsets.all(3),
                              ),
                              endThumbIcon: Container(
                                color: Colors.white,
                                margin: EdgeInsets.all(3),
                              ),
                              activeColor: Colors.red,
                              min: 0.0,
                              max: 20.0,
                              interval: 20,
                              onChanged: (SfRangeValues data) {
                                setState(() {
                                  currentRangeValues = data;
                                });
                              },
                              values: SfRangeValues(
                                currentRangeValues.start.round(),
                                currentRangeValues.end.round(),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  constraints: BoxConstraints(maxWidth: 250),
                  child: SfRangeSliderTheme(
                    data: SfRangeSliderThemeData(
                      activeTrackHeight: 5,
                      thumbStrokeWidth: 3,
                      thumbStrokeColor: Colors.red,
                    ),
                    child: SfRangeSlider(
                      startThumbIcon: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(3),
                      ),
                      endThumbIcon: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(3),
                      ),
                      activeColor: Colors.red,
                      min: 1,
                      max: 100,
                      interval: 1,
                      onChanged: (data) {},
                      values: SfRangeValues(
                        _currentRangeValues.start.round(),
                        _currentRangeValues.end.round(),
                      ),
                    ),
                  ),
                )
                // start here
              ],
            ),
          ), //RestaurantPage(), <--- This is Filter Page and on Menu Click menu work
        ),
      ),
    );
  }

  // this function for returning list of candels
  List<Widget> giveGandleList(int itemCound) {
    List<Widget> candlesList = [];
    List sampleData = [
      100,
      400,
      450,
      350,
      600,
    ];

    for (var i = 0; i < itemCound + 1; i++) {
      if (i >= currentRangeValues.start.round() / 4 &&
          i <= currentRangeValues.end.round() / 5) {
        candlesList
            .add(distanceCandle(Colors.red[200], (sampleData[i] / 10) / 2));
      } else {
        candlesList.add(distanceCandle(Colors.red, 40));
      }
    }

    return candlesList;
  }

  Container distanceCandle(Color candleColor, double heightData) {
    return Container(
      height: heightData,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: candleColor,
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
