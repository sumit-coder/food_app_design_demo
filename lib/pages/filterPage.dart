import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.grey,
        child: Container(
          height: size.height * 0.6,
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
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    //  iam out of time now 1pm and i am going to sleep
                    Text(' iam out of time now 1pm and i am going to sleep'),
                    SizedBox(height: 30),
                    Container(
                      child: Row(
                        children: [
                          filterDropDownButton('Price', '\$Min', 105),
                          SizedBox(width: 5),
                          filterDropDownButton('', '\$Max', 105),
                          SizedBox(width: 15),
                          filterDropDownButton('Rating', 'Any', 90),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        children: [
                          filterDropDownButton('Kitchen', 'Asian', 140),
                          SizedBox(
                            width: 15,
                          ),
                          filterDropDownButton('Hours', 'Any', 100),
                        ],
                      ),
                    ),
                    // the big apply button
                    bigButton('Apply'),
                  ],
                ),
              ),
              // Bttom Navigation Bar
              Container(
                margin: EdgeInsets.only(top: 20),
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
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
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
      ),
    );
  }

  Container filterDropDownButton(String headTitle, String title, double width) {
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
            padding: EdgeInsets.all(10),
            height: 50,
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
                    fontSize: 20,
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

  InkWell bigButton(String title) {
    return InkWell(
      onTap: () {},
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
