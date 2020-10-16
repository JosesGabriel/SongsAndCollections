import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String title;
  final playButtonSize = 50.0;

  SongCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFadd8e6),
      child: SizedBox(
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // The song title banner slides off in the hero animation.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                color: Colors.black12,
                padding: EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // The play button grows in the hero animation.
            Padding(
              padding: EdgeInsets.all(45),
              child: Container(
                height: playButtonSize,
                width: playButtonSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.play_arrow,
                    size: playButtonSize, color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
