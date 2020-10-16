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
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Collections',
      home: _HomePageState(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}

class _HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            appBarTitle,
          ),
        ),
        backgroundColor: Color.fromRGBO(254, 219, 208, 1),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: _songList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongCard(_songList[index].title);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
              // Text("data", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
