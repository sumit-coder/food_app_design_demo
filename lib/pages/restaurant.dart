import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  var infoOrMenu = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 450,
                  width: 1000,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        height: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: const Offset(
                                0.0,
                                8.0,
                              ),
                              blurRadius: 10.0,
                              // spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              child: Image.asset(
                                'assets/food.jpg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Restaurant 1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 32,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Restaurant Address (',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                            children: const <TextSpan>[
                                              TextSpan(
                                                text: '3.5km',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                              TextSpan(text: ')'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // we could us images for Rating start
                                              Text(
                                                '* * * * * ', //i cant find right way to do this
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              Text(
                                                '(254 Reviews)',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        foodbyCountry(
                                            'Australian', Colors.pink),
                                        foodbyCountry('Asian', Colors.purple),
                                        foodbyCountry('chinese', Colors.red),
                                        foodbyCountry('Other', Colors.green),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 200,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                offset: const Offset(
                                  0.0,
                                  8.0,
                                ),
                                blurRadius: 10.0,
                                // spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ), // did't get the right icon
                          ),
                        ),
                      ),
                      // Top Back Button
                      Positioned(
                        child: Container(
                          width: size.width,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20, left: 20),
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(15, 17, 14, 0.8),
                                Color.fromRGBO(10, 10, 10, 0.2),
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      // info and menu
                      Positioned(
                        bottom: 5,
                        child: Container(
                          width: 290,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Colors.grey[500], width: 1),
                          ),
                          child: Row(
                            children: [
                              // Information section Button
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      infoOrMenu = true;
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: infoOrMenu
                                          ? Colors.red
                                          : Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Information',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: infoOrMenu
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // menu section Button
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      infoOrMenu = false;
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: infoOrMenu
                                          ? Colors.white
                                          : Colors.red,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Menu',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: infoOrMenu
                                              ? Colors.red
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Simple Check for info button on or menu button on
                infoOrMenu
                    ? Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // this Method can make unlimited info list cards like. Opening Hours, Contact us, etc
                            // Opening Hours
                            infoTitleWithWidget(
                              'Opening Hours',
                              Container(
                                child: Column(
                                  children: [
                                    // this container for Time Hours Table
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Row(
                                        children: [
                                          // Table Colum 1
                                          Expanded(
                                            child: Column(
                                              children: [
                                                opningTimeList(
                                                    'Name 1', '10:00'),
                                                opningTimeList(
                                                    'Name 2', '20:00'),
                                                opningTimeList(
                                                    'Name 3', '23:00'),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          // Table Colum 2
                                          Expanded(
                                            child: Column(
                                              children: [
                                                opningTimeList('Name 4', ''),
                                                opningTimeList('Name 5', ''),
                                                opningTimeList('Name 6', ''),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // this container for phone and website buttons
                                    Container(
                                      child: Row(
                                        children: [
                                          // Phone Button
                                          smallButton(
                                            'Phone',
                                            Colors.green,
                                            Colors.green[900],
                                            Icons.call,
                                            () {},
                                          ),
                                          SizedBox(width: 10),
                                          // Website Button
                                          smallButton(
                                            'Website',
                                            Colors.blue,
                                            Colors.blue[900],
                                            Icons.web,
                                            () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Contact Us
                            infoTitleWithWidget(
                              'Contact Us',
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // input Fields

                                    inputFields((size.width) - 35, 'Name'),
                                    SizedBox(height: 10),
                                    inputFields((size.width) - 35, 'Email'),
                                    SizedBox(height: 10),
                                    inputFields(size.width, 'Message'),

                                    bigButton('Send'),
                                  ],
                                ),
                              ),
                            ),
                            // Our Loaction
                            infoTitleWithWidget(
                              'Our Loaction',
                              Container(
                                height: 250,
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset('assets/food.jpg'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : menuSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // This method is used for Opning Hours time list
  Container opningTimeList(String hourName, String hourTime) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hourName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              fontSize: 20,
            ),
          ),
          Text(
            ':',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              fontSize: 20,
            ),
          ),
          Text(
            hourTime,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

// This method is used for Custom Input Field
  Container inputFields(
    double width,
    String hintTitle,
  ) {
    return Container(
      height: hintTitle == 'Message' ? 130 : 50,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintTitle,
          hintStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
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

// this Method for phone and website buttons
  Expanded smallButton(
      String title, Color colorA, Color colorB, IconData icon, Function onTap) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 40,
        decoration: BoxDecoration(
          color: colorA,
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
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: colorB,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // this Method can make unlimited info list cards like. Opening Hours, Contact us, etc
  Container infoTitleWithWidget(String title, Widget infoWidget) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          infoWidget,
        ],
      ),
    );
  }

  Container foodbyCountry(String name, Color color) {
    return Container(
      child: Row(
        children: [
          Text(name),
          Container(
            margin: EdgeInsets.only(left: 5),
            height: 10,
            width: 10,
            color: color,
          )
        ],
      ),
    );
  }

//  Menu Section
  Container menuSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          menuInfoSction(
            'Lorem Ipsum is simply',
            'Lorem /Ipsum /is /simply',
            '20.9',
          ),
          menuInfoSction(
            'Lorem Ipsum ',
            'Lorem /Ipsum /is /simply /Ipsum',
            '11.9',
          ),
          menuInfoSction(
            'Lorem Ipsum is simply',
            'Lorem /Ipsum /is /simply',
            '16.9',
          ),
          menuInfoSction(
            'Lorem ',
            'Lorem /Ipsum /is /simply',
            '13.9',
          ),
        ],
      ),
    );
  }

//  Menu Section List Item
  Container menuInfoSction(String name, String iCantSeeInImage, String price) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 1,
                    width: 20,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$${price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            iCantSeeInImage,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
