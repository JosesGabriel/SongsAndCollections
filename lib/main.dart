import 'package:flutter/material.dart';

void main() => runApp(App());

final appBarTitle = "Thoughts & Collections";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collections',
      home: _HomePageState(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.white,
              bodyColor: Colors.white,
            ),
      ),
    );
  }
}

class _HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            child: AppBar(
              title: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(appBarTitle, style: TextStyle(color: Colors.black)),
              ),
              backgroundColor: Color.fromRGBO(254, 219, 208, 1),
              centerTitle: true,
            ),
          ),
          Container(
              child: Card(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
            margin: EdgeInsets.only(top: 100),
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 38, bottom: 750),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text('huh'),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
