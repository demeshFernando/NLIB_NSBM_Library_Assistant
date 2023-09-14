import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class admin_req_handle extends StatefulWidget {
  final String user;
  const admin_req_handle({super.key, required this.user});

  @override
  State<admin_req_handle> createState() => _admin_req_handleState();
}

class _admin_req_handleState extends State<admin_req_handle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2D0F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Requests',
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('   You are loggin in as',
                    style: GoogleFonts.roboto(fontSize: 17)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.user,
                      style: GoogleFonts.roboto(
                          fontSize: 15, color: HexColor('#460b9c')),
                    ))
              ],
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.4),
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hall Requests',
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Check'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff430ba3),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey.withOpacity(0.4),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Requests',
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Check'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor('#430ba3'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
