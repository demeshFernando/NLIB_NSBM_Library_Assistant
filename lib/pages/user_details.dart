import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../util/util.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key });

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: HexColor('#E2D0F9'),
      appBar: AppBar(
        title: Text(
          'User Details',
          style: GoogleFonts.roboto(color: Colors.black,fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
      ),
       body: Container(
         decoration: BoxDecoration(
           color: Colors.grey.withOpacity(0.3),
           borderRadius: BorderRadius.circular(10),boxShadow: [
           BoxShadow(
               color: Colors.grey.withOpacity(0.1),
               spreadRadius: 1,
               blurRadius: 1,
               offset: const Offset(2, 3))
         ] ),
        width: double.infinity,

        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              secondrytext(stxt: 'Edit/View your details'),
              const SizedBox(height: 50,),
              textinput(
                  txt: 'Name', obs: false),
              const SizedBox(
                  height: 10
              ),textinput(
                  txt: 'Student ID', obs: false),
              const SizedBox(
                  height: 10
              ),
              textinput(txt: 'Privilage', obs: false),
              const SizedBox(
                  height: 30
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}
                  , child: Text('update'))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}