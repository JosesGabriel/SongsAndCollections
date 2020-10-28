import 'package:flutter/material.dart';

import '../models/song.dart';

final List<Song> _songList = [
  Song(
    id: 't1',
    title: 'Nothing',
    duration: '3:08',
  ),
  Song(
    id: 't2',
    title: 'Somewhere in Neverland',
    duration: '3:08',
  ),
  Song(
    id: 't3',
    title: 'Hung Up',
    duration: '3:08',
  ),
  Song(
    id: 't4',
    title: 'Tenerife Sea',
    duration: '3:08',
  ),
  Song(
    id: 't5',
    title: 'Honesty',
    duration: '3:08',
  ),
  Song(
    id: 't6',
    title: 'Mr. Blue',
    duration: '3:08',
  ),
];

Widget songListItem(
    {BuildContext context, String title, String duration, int index}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: index == 0
                    ? Theme.of(context).textTheme.headline6
                    : Theme.of(context).textTheme.bodyText1),
            Text(duration, style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Greatest of all Beans',
              style: Theme.of(context).textTheme.caption),
          Text(index == 0 ? 'Now Playing' : '',
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    ],
  );
}

class SongListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(
          top: mediaQuery.size.height * 0.45,
          bottom: mediaQuery.size.height * 0.13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      height: mediaQuery.size.height,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return songListItem(
                context: context,
                title: _songList[index].title,
                duration: _songList[index].duration,
                index: index);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _songList.length),
    );
  }
}
