import 'dart:async';
import 'package:flutter/material.dart';

import './widgets/song_card.dart';
import './widgets/song_listview.dart';
import './widgets/audio_controller.dart';

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
      debugShowCheckedModeBanner: false,
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
            top: mediaQuery.size.height * 0.13,
            left: mediaQuery.size.width * 0.20,
            child: Stack(
              children: [
                Container(
                  width: mediaQuery.size.width * 0.55,
                  height: mediaQuery.size.width * 0.55,
                  child: CircularProgressIndicator(
                    value: songProgress,
                    valueColor: AlwaysStoppedAnimation(
                      Color(0xFFFFB6C1),
                    ),
                  ),
                ),
                Container(
                  width: mediaQuery.size.width * 0.55,
                  height: mediaQuery.size.width * 0.55,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/ses.jpg'),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: mediaQuery.size.height * 0.02,
            left: mediaQuery.size.width * 0.05,
            child: AudioController(),
          )
        ],
      ),
    );
  }
}
