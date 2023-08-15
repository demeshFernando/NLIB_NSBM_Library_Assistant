import 'package:flutter/material.dart';
import 'package:libraryapp/started1.dart';
//import 'started1.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool rememberMe = false; // Store the switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Center(
              child: Image.asset(
                'assets/register.png',
                width: 220,
                height: 220,
              ),
            ),
          ),
          
          // Sign In Text
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          
          SizedBox(height: 30),
          
          // Student Email Text Field
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.green.shade50,
                filled: true,
                hintText: 'Student text',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 45, 192, 50),
                  ),
                  borderRadius: BorderRadius.vertical(),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          // Password Text Field
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.green.shade50,
                filled: true,
                hintText: 'Your password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 45, 192, 50),
                  ),
                  borderRadius: BorderRadius.vertical(),
                ),
                prefixIcon: Icon(Icons.private_connectivity_sharp),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Remember Me and Forgot Password
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Switch(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Add logic for the "Forgot Password" action
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color.fromARGB(255, 109, 150, 119),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 20),
          
          // Sign In Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add sign-in logic here
                      // Navigate to the started1.dart file
                       Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => MyStarted()), // Replace Started1 with the appropriate class name in started1.dart
                             );
                    },
                    child: Text('SIGN IN'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 20, 71, 22),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(Size(10, 57)),
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
        ],
      ),
    );
  }
}
