
import 'package:flutter/material.dart';


class space extends StatefulWidget {
  const space({super.key});

  @override
  State<space> createState() => _spaceState();
}

class _spaceState extends State<space> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.1,
    );
  }
}

class textfield extends StatefulWidget {
  bool obst;
  var textno;
  textfield({super.key, required this.obst, required this.textno});

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: TextField(
          onChanged: (widget.textno),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
            ),
          ),
          obscureText: widget.obst,
        ),
      ),
    );
  }
}

class headtext extends StatefulWidget {
  String txt;
  headtext({super.key, required this.txt});

  @override
  State<headtext> createState() => _headtextState();
}

class _headtextState extends State<headtext> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.txt,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class secondrytext extends StatefulWidget {
  String stxt;
  secondrytext({super.key, required this.stxt});

  @override
  State<secondrytext> createState() => _secondrytextState();
}

class _secondrytextState extends State<secondrytext> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.stxt,
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}

class textinput extends StatefulWidget {
  final String txt;
  // final TextEditingController controller;
  final bool obs;

  const textinput(
      {super.key,
        required this.txt,
        // required this.controller,
        required this.obs});

  @override
  State<textinput> createState() => _textinputState();
}

class _textinputState extends State<textinput> {
  bool _isEmpty = true;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(widget.txt),
            // SizedBox(width: MediaQuery.of(context).size.width*0.4),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(

                    obscureText: widget.obs,
                  ),
                ),
                _isEmpty
                    ? const Icon(
                  Icons.close,
                  size: 30,
                )
                    : const Icon(
                  Icons.check,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class snackBar {
  final String text;
  final BuildContext context;

  snackBar({
    required this.text,
    required this.context,
  });

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show() {
    // AnimationController controller = AnimationController(
    //   duration: Duration(seconds: 0),
    //   vsync: this,
    // );
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(''),
        width: MediaQuery.of(context).size.width * 0.9,
        elevation: 1,
      ),
    );
  }
}

//
// class textinputupdate extends StatefulWidget {
//   final String txt;
//   final TextEditingController controller;
//   final bool obs;
//   final String hint;
//
//   const textinputupdate({super.key, required this.txt , required this.controller , required this.obs , required this.hint});
//
//   @override
//   State<textinputupdate> createState() => _textinputupdateState();
// }
//
// class _textinputState extends State<textinputupdate> {
//   bool _isEmpty = false;
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(() {_textChangeListener();});
//   }
//
//   void _textChangeListener(){
//     setState(() {
//       _isEmpty = widget.controller.text.isEmpty;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Center(
//             child:
//             Text(widget.txt),
//             // SizedBox(width: MediaQuery.of(context).size.width*0.4),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left:10 , right: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width*0.8,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: widget.
//                     ),
//
//                     controller: widget.controller,
//                     obscureText: widget.obs,
//
//                   ),
//                 ),
//                 _isEmpty ? const Icon(Icons.close,size: 30,) :const Icon(Icons.check,size: 30,)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }
// }
//
