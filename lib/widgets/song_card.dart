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
  var _elevation = 0.5;

  onCardTap() {
    setState(() {
      if (_icon == Icons.play_arrow) {
        _icon = Icons.pause;
        _elevation = 1.0;
      } else {
        _icon = Icons.play_arrow;
        _elevation = 0.5;
      }
    });
    print('yey0');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GestureDetector(
      onTap: () => onCardTap(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: _elevation,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // color: Colors.transparent,
            elevation: _elevation,
            child: SizedBox(
              height: 250,
              // width: mediaQuery.size.width,
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
                            width: mediaQuery.size
                                .width // TODO: Make responsive, probably not good to hard code image width
                            )),
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
                        widget.title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  // The play button grows in the hero animation.
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
      ),
    );
  }
}
