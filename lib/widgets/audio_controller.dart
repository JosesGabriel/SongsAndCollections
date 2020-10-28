import 'package:flutter/material.dart';

class AudioController extends StatefulWidget {
  @override
  _AudioControllerState createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  var isPlay = false;

  void togglePlay() {
    setState(() {
      isPlay = !isPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Color(0XFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 5),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 4),
      width: mediaQuery.size.width * 0.8,
      height: mediaQuery.size.height * 0.1,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              splashRadius: 20,
              icon: Icon(Icons.skip_previous_rounded),
              onPressed: () {},
            ),
            Container(
              decoration: const ShapeDecoration(
                color: Color(0XFFfd4483),
                shape: CircleBorder(),
              ),
              child: IconButton(
                splashRadius: 1,
                icon: isPlay
                    ? Icon(Icons.play_arrow_rounded)
                    : Icon(Icons.pause_outlined),
                color: Colors.white,
                onPressed: () => togglePlay(),
              ),
            ),
            IconButton(
              splashRadius: 20,
              icon: Icon(Icons.skip_next_rounded),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
