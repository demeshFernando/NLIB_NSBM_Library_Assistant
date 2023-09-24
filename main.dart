import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: MySetting(),
      ),
    );
  }
}

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  bool _allowNotifications = false; // Store the switch state
  bool _privacyVisibility = false; // Store the privacy visibility switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",
        style: TextStyle(
                //fontSize: 15.0,
                color: const Color.fromARGB(255, 255, 254, 254),
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Add this line to handle the back navigation
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSwitch("Allow Notifications", _allowNotifications, (value) {
            setState(() {
              _allowNotifications = value;
            });
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Any lorem word about 20 word count\nAny lorem word about 20",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          customSwitch("Privacy Visibility", _privacyVisibility, (value) {
            setState(() {
              _privacyVisibility = value;
            });
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Any lorem word about 20 word count\nAny lorem word about 20",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 355),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                // Add your navigation logic here
                // Replace Started1 with the appropriate class name in started1.dart
              },
              child: Text('Save settings'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 16, 101, 17),
                ),

              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(Size(310, 52)),
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
    );
  }

  Widget customSwitch(
      String text, bool value, void Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
