import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String title;
  final playButtonSize = 50.0;

  SongCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // color: Colors.transparent,
        elevation: 10,
        child: SizedBox(
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.grey,
                    BlendMode.modulate,
                  ),
                  child: Image.asset("assets/images/ses.jpg",
                      fit: BoxFit.fitWidth,
                      width:
                          350 // TODO: Make responsive, probably not good to hard code image width
                      ),
                ),
              ),
              // The song title banner slides off in the hero animation.
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  height: 60,
                  // color: Colors.black12,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 12),
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
                    color: Colors.white.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.play_arrow,
                      size: playButtonSize, color: Colors.black38),
                ),
              ),
            ],
          ),
        ));
  }
}
