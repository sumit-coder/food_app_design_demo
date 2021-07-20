import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black12,
        // Use From Here
        child: Container(
          color: Colors.transparent,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: size.width / 1.65 + 30,
                height: size.height * 0.3,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: size.width / 1.65,
                        height: size.height * 0.3,
                        color: Color(0xFFFFB95C),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Icon(
                              Icons.people_alt_outlined,
                              size: size.width < 350 ? 50 : 60,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Hallo',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width < 350 ? 25 : 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.3 / 2 - 30,
                      left: 6,
                      child: Transform.rotate(
                        angle: 4,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFB95C),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Transform.rotate(
                            angle: 10,
                            child: Icon(
                              Icons.close,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width / 1.65,
                height: size.height * 0.7,
                padding: EdgeInsets.only(top: 20, left: 30),
                color: Colors.white,
                child: Column(
                  children: [
                    navLinks(
                      'Login',
                      () {},
                      Icons.login,
                      size,
                    ),
                    navLinks(
                      'Register',
                      () {},
                      Icons.contact_page_outlined,
                      size,
                    ),
                    navLinks('Favoriten', () {}, Icons.favorite_border_outlined,
                        size),
                    navLinks(
                      'Setting',
                      () {},
                      Icons.settings_applications_outlined,
                      size,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container navLinks(String title, Function onTap, IconData icon, Size size) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                icon,
                size: size.width < 350 ? 30 : 32,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width < 350 ? 20 : 24,
                  // fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
