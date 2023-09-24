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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
         padding: EdgeInsets.only(left: 20),
          child: Text("Herry Potter",
        
              
          style: TextStyle(
                  fontSize: 22.0,
                  color: const Color.fromARGB(255, 255, 254, 254),
                ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 30),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Add this line to handle the back navigation
            },
          ),
        ),
        
       actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your close icon functionality here
              },
            ),
          
          ),
           
        ],

        
        
      ),
       
      
      body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            // Add your new text widget here
            Padding(
              padding: EdgeInsets.only(left:40),
              child: Text(
                "Harry Potter and the Philosophers...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.black,
                ),
                
              ),
              
              
            ),
             Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "JK Rowling",
              style: TextStyle(
                fontSize: 18,
               // fontWeight: FontWeight.bold,
               color:  Colors.black54
              ),
            ),
          ),
            SizedBox(height:40),
            Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "Harry Potter and the Chamber of...",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "JK Rowling",
              style: TextStyle(
                fontSize: 18,
               // fontWeight: FontWeight.bold,
               color:  Colors.black54
              ),
            ),
          ),

           SizedBox(height:40),
            Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "Harry Potter and the Prisoner of...",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "JK Rowling",
              style: TextStyle(
                fontSize: 18,
               // fontWeight: FontWeight.bold,
               color:  Colors.black54
              ),
            ),
          ),
            // Rest of your widgets...
          ],


          
        ),
        
      );
      
    
  }
}
