import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Collections',
      home: _HomePageState(),
      theme: ThemeData(
        fontFamily: "Nunito",
        textTheme: ThemeData.light().textTheme.copyWith(
            headline5: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
            headline6: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              color: Colors.black,
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
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          child: Text(
            appBarTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: mediaQuery.size.height * 0.55),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
            ),
            height: mediaQuery.size.height * 0.45,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  _songList[0].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
          SongCard(_songList[0].title),
        ],
      ),
    );
  }
}
