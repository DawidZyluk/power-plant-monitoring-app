import 'package:flutter/material.dart';

class DisplayBool extends StatefulWidget {
  final String? title;
  final bool? value;

  const DisplayBool({super.key, this.title, this.value});

  @override
  State<DisplayBool> createState() => _DisplayBoolState();
}

class _DisplayBoolState extends State<DisplayBool> {
  @override
  Widget build(BuildContext context) {
    Widget light = Container(
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 17, 0),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 17, 0),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]
        ),
      );

    if(widget.value!) {
      light = Container(
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 255, 8),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 255, 8),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]
        ),
      );
    }
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 3),
          child: Text(
            "${widget.title}: ",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(width: 3,),
        light
      ],
    );
  }
}
