import 'package:flutter/material.dart';

class SongCard extends StatefulWidget {
  final String title;

  SongCard(this.title);

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  var _playButtonSize = 80.0;
  var _icon = Icons.play_arrow;

  onCardTap() {
    setState(() {
      if (_icon == Icons.play_arrow) {
        _icon = Icons.pause;
      } else {
        _icon = Icons.play_arrow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GestureDetector(
      onTap: () => onCardTap(),
      child: Card(
          child: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/ses.jpg",
              fit: BoxFit.fitHeight,
              height: mediaQuery.size.height,
            ),
            // Song Title Banner
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
                height: 90,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            // Play Button
            Padding(
              padding: EdgeInsets.all(45),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 900),
                height: _playButtonSize,
                width: _playButtonSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                alignment: Alignment.center,
                child: Icon(
                  _icon,
                  size: 50.0,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
