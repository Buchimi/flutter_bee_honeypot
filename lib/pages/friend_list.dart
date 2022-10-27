import 'package:flutter/material.dart';
import 'package:flutter_bee_honeypot/widgets/search_box.dart';
import '../widgets/user_tile.dart';

class FriendList extends StatelessWidget {
  const FriendList({super.key, this.friends});
  final List<Widget>? friends;

  @override
  Widget build(BuildContext context) {
    return ListView(children: () {
      if (friends == null) {
        return const [
          SearchBox(),
          UserTile(),
          UserTile(),
          UserTile(),
          UserTile(),
          UserTile(),

        ];
      } else {
        return List.generate(friends!.length + 1, (index) {
          if (index == 0) {
            return const SearchBox();
          }
          return friends![index];
        });
      }
    }());
  }
}
