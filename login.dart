import 'package:flutter/material.dart';
import 'package:libraryapp/loginstudent.dart';
//import 'loginstudent.dart';


class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/register.png',
            width: 250,
            height: 250,
            ), 
             // Replace with the actual asset path
           
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // Add your navigation logic here
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyRegister()), // Replace with the actual class name
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}