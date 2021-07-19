import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class DistanceRangeSelector extends StatefulWidget {
  @override
  StateDistanceRangeSelector createState() => StateDistanceRangeSelector();
}

class StateDistanceRangeSelector extends State<DistanceRangeSelector> {
  double up = 50;

  SfRangeValues currentRangeValues = SfRangeValues(1.0, 20.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double allWidth = size.width - 0;
    return Container(
      // color: Colors.grey,
      width: allWidth,
      height: 80,
      child: Stack(
        children: [
          // For Rang data Candles
          Positioned(
            bottom: 28,
            child: Container(
              margin: EdgeInsets.only(right: 0),
              width: allWidth,
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
                  20, //this should be same as interval value in SfRangeSliderThemeData
                ), // this Function return list of candles
              ),
            ),
          ),
          // For Rang Selecter
          Positioned(
            bottom: 5,
            child: Container(
              // color: Colors.black,
              width: allWidth,
              child: SfRangeSliderTheme(
                data: SfRangeSliderThemeData(
                  activeTrackHeight: 5,
                  thumbStrokeWidth: 3,
                  thumbStrokeColor: Colors.red[400],
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
                  inactiveColor: Colors.grey[400],
                  activeColor: Colors.red[400],
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
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: allWidth,
                padding: EdgeInsets.only(left: 17, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3km',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '300km',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  // this function for returning list of candels
  List<Widget> giveGandleList(int itemCound) {
    List<Widget> candlesList = [];
    List sampleData = [
      500,
      400,
      450,
      350,
      600,
      100,
      400,
      450,
      350,
      600,
      100,
      400,
      450,
      350,
      600,
      100,
      400,
      450,
      350,
      600,
    ];

    for (var i = 0; i < itemCound; i++) {
      if (i >= currentRangeValues.start.round() / 1 &&
          i + 1 <= currentRangeValues.end.round() / 1) {
        candlesList.add(distanceCandle(Colors.red[200], sampleData[i] / 10));
      } else if (i <= currentRangeValues.end.round() / 1) {
        candlesList.add(distanceCandle(Colors.transparent, 40));
      } else {
        candlesList.add(distanceCandle(Colors.transparent, 40));
      }
    }

    return candlesList;
  }

  Container distanceCandle(Color candleColor, double heightData) {
    return Container(
      height: heightData,
      width: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: candleColor,
      ),
    );
  }
}
