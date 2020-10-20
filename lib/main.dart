import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/song_card.dart';
import './models/song.dart';

void main() => runApp(App());

final appBarTitle = "Songs & Collections";
final List<Song> _songList = [
  Song(id: 't1', title: 'Nothing'),
  Song(id: 't2', title: 'Somewhere in Neverland'),
  Song(id: 't3', title: 'Hung Up'),
  Song(id: 't4', title: 'Tenerife Sea'),
  Song(id: 't5', title: 'Honesty'),
  Song(id: 't6', title: 'Mr. Blue'),
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       systemNavigationBarIconBrightness: Brightness.light,
    //       systemNavigationBarColor: Colors.red,
    //       systemNavigationBarDividerColor: Colors.red,
    //       statusBarColor: Colors.red,
    //       statusBarBrightness: Brightness.light,
    //       statusBarIconBrightness: Brightness.light),
    // );
    return MaterialApp(
      title: 'Collections',
      home: _HomePageState(),
      theme: ThemeData(
        fontFamily: "Nunito",
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              color: Colors.white,
            )),
        primarySwatch: Colors.grey,
        primaryColor: Color.fromRGBO(254, 219, 208, 1),
      ),
    );
  }
}

class _HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          child:
              Text(appBarTitle, style: Theme.of(context).textTheme.headline6),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF764BA2),
                  Color(0xFF667EEA),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: _songList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongCard(_songList[index].title);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(color: Colors.transparent),
              ),
              // Text("data", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
