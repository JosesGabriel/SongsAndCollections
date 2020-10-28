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

class _HomePageState extends StatelessWidget {
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
        ],
      ),
    );
  }
}
