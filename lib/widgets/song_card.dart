import 'package:flutter/material.dart';

class SongCard extends StatefulWidget {
  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.size.height * 0.6,
      width: mediaQuery.size.width,
      child: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF764BA2),
            Color(0xFF667EEA),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple,
            blurRadius: 90.0,
            spreadRadius: 5.0,
          ),
        ],
      )),
    );
  }
}
