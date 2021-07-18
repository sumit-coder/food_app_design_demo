import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool slidUp = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.bottomCenter,
        color: Colors.grey[300],
        child: Stack(
          children: [
            // Container is used for showing UI contant
            Positioned(
              top: size.height - 100,
              child: Container(
                // height: size.height - 70,
                child: Text('dsdfasdfasdfasdfasdf'),
              ),
            ),
            // this is bottom nav and filter popUp
            Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  filterPopUp(size),
                  Container(
                    // margin: EdgeInsets.only(top: size.height < 600 ? 0 : 20),
                    padding: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: const Offset(
                            0.0,
                            -5.0,
                          ),
                          blurRadius: 6.0,
                          // spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[800],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt,
                                size: 30,
                                color: Colors.white,
                              ),
                              InkWell(
                                onTap: () {
                                  if (slidUp) {
                                    setState(() {
                                      slidUp = false;
                                    });
                                  } else {
                                    setState(() {
                                      slidUp = true;
                                    });
                                  }
                                  // setState(() {
                                  //   slidUp = false;
                                  // });
                                },
                                child: Text(
                                  'Filter',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.search_rounded,
                          size: 35,
                          color: Colors.grey[700],
                        ),
                        Icon(
                          Icons.menu_open_outlined,
                          size: 35,
                          color: Colors.grey[700],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded filterPopUp(Size size) {
    return Expanded(
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeIn,
            top: slidUp ? size.height - 570 : size.height - 50,
            duration: const Duration(milliseconds: 800),
            child: Container(
              // height: size.height < 600 ? 550 : 600,
              height: 520,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Filter Tab
                  Container(
                    constraints: BoxConstraints(maxHeight: 530),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SingleChildScrollView(
                      //For Small Phones
                      child: Column(
                        children: [
                          GestureDetector(
                            onVerticalDragEnd: (gestureData) {
                              Velocity dragVelocity = gestureData.velocity;

                              if (dragVelocity.pixelsPerSecond.dy.abs() > 0) {
                                setState(() {
                                  if (slidUp) {
                                    setState(() {
                                      slidUp = false;
                                    });
                                  } else {
                                    setState(() {
                                      slidUp = true;
                                    });
                                  }
                                });
                              } else {
                                print('no Drag down, wait 1sec to do again');
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: size.height < 600 ? 20 : 30,
                              ),
                              width: size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.5),
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  // Filter text Box
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Filter',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                            fontSize: 32,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Distance',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '5.0km - 300km',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Distance Filter
                          Container(
                            height: size.height < 600 ? 70 : 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: Text('Distance range box'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Row(
                              children: [
                                filterDropDownButton(
                                  'Price',
                                  '\$Man',
                                  size.height < 600 ? 90 : 105,
                                  size,
                                ),
                                SizedBox(width: 5),
                                filterDropDownButton(
                                  '',
                                  '\$Max',
                                  size.height < 600 ? 90 : 105,
                                  size,
                                ),
                                SizedBox(width: 10),
                                filterDropDownButton(
                                  'Rating',
                                  'Any',
                                  size.height < 600 ? 85 : 90,
                                  size,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Row(
                              children: [
                                filterDropDownButton(
                                  'Kitchen',
                                  'American',
                                  130,
                                  size,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                filterDropDownButton(
                                  'Hours',
                                  'Any',
                                  100,
                                  size,
                                ),
                              ],
                            ),
                          ),
                          // the big apply button
                          bigButton('Apply'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bttom Navigation Bar
        ],
      ),
    );
  }

  Container filterDropDownButton(
      String headTitle, String title, double width, Size size) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headTitle,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(size.height < 600 ? 8 : 10),
            height: size.height < 600 ? 45 : 50,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: size.width < 350 ? 18 : 20,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Material bigButton(String title) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 20),
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
      ),
    );
  }
}
