import 'package:flutter/material.dart';
import 'package:libraryapp/started2.dart';

class MyStarted extends StatefulWidget {
  const MyStarted({super.key});

  @override
  State<MyStarted> createState() => _MyStartedState();
}

class _MyStartedState extends State<MyStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10),
            child: Center(
              child: Image.asset(
                'assets/register1.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
           SizedBox(height: 25),
          Text(
            'Search Library \nBook Online', // Add your text here
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                'you dont need to search to books in racks\nany more just search here!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
           // Add spacing between text and button
           Container(
  padding: EdgeInsets.all(5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(right: 30), // Adjust the margin to change the spacing
        child: ElevatedButton(
          onPressed: null,
          child: Text(' '),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 25, 228, 32),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(68, 8)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 20), // Adjust the margin to change the spacing
        child: ElevatedButton(
          onPressed: null,
          child: Text(' '),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 213, 232, 214),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(35, 8)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 20), // Adjust the margin to change the spacing
        child: ElevatedButton(
          onPressed: null,
          child: Text(' '),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 213, 232, 214),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(35, 8)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),


        SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Add your navigation logic here
             Navigator.push(
                 context,
             MaterialPageRoute(builder: (context) => MyStartedone()), // Replace Started1 with the appropriate class name in started1.dart
                          );
            },
           child: Text('Next'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 20, 71, 22),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(Size(350, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
          ),
          ),
        ],
      ),
    );
  }
}
