import 'package:flutter/material.dart';

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
            'Search Library \nBooks Online', // Add your text here
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
          SizedBox(height: 100), // Add spacing between text and button
          ElevatedButton(
            onPressed: () {
              // Add your navigation logic here
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
