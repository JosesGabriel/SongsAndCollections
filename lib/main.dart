import 'dart:async';
import 'package:flutter/material.dart';

import './widgets/song_card.dart';
import './widgets/song_listview.dart';

void main() => runApp(App());

final appBarTitle = "Songs & Collections";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collections',
      home: _HomePageState(),
      theme: ThemeData(
        fontFamily: "Nunito",
        textTheme: ThemeData.light().textTheme,
        primarySwatch: Colors.grey,
        primaryColor: Color.fromRGBO(254, 219, 208, 1),
      ),
    );
  }
}

class _HomePageState extends StatefulWidget {
  @override
  __HomePageStateState createState() => __HomePageStateState();
}

class __HomePageStateState extends State<_HomePageState> {
  var songProgress = 0.0;

  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        songProgress += 0.20;
      });
      if (songProgress > 1) {
        songProgress = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          child: Text(appBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white)),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SongListView(),
          SongCard(),
          Positioned(
            top: mediaQuery.size.height * 0.15,
            left: mediaQuery.size.width * 0.20,
            child: Container(
              width: mediaQuery.size.width * 0.6,
              height: mediaQuery.size.width * 0.6,
              child: CircularProgressIndicator(
                value: songProgress,
                valueColor: AlwaysStoppedAnimation(
                  Color(0xFFFFB6C1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
