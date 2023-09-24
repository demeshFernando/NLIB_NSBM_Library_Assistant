import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 84, 168, 87),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: 180,
            transform: Matrix4.translationValues(0, -10, 0), // Slide up the rectangle
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80, right: 12),
                      child: Container(
                        width: 30,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 15, 152, 20),
                            width: 0.1,
                          ),
                          color: Color.fromARGB(255, 15, 152, 20),
                        ),
                        child: IconButton(
                          iconSize: 15,
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Handle camera icon press here
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Olivia Austin',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'oliva@students.nsbm.ac.lk',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 70),
                // Add more widgets here
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40), 
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Color.fromARGB(255, 15, 152, 20),
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 2), 
                              child: Text(
                                'About Me',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                         padding: EdgeInsets.only(right: 40), 
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 35),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                               padding: EdgeInsets.only(left: 40),
                              child: Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 15, 152, 20),
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                'My Favorites',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                             padding: EdgeInsets.only(left: 40),
                            child: Icon(
                              Icons.notifications_none,
                              color: Color.fromARGB(255, 15, 152, 20),
                              size: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                             padding: EdgeInsets.only(left: 2),
                            child: Text(
                              'Notifications',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                         padding: EdgeInsets.only(right: 40),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),


                 SizedBox(height: 35),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:EdgeInsets.only(left: 40),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 15, 152, 20),
                              size: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding:  EdgeInsets.only(right: 40),
                            child: Text(
                              'Sign out',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                     
                    ],
                  ),
                
                ),



                
              ],
            ),
          ),
        ],
      ),
    );
  }
}