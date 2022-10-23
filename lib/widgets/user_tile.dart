import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {super.key,
      this.imagesrc =
          "https://cdn.discordapp.com/attachments/811722728310046724/1033509264502833235/unknown.png",
      this.onTap,
      this.listTileStyle,
      this.name = "Michael EvenBeeleon",
      this.lastSeen = "5 minutes ago"});

  final String imagesrc;
  final String name;
  final VoidCallback? onTap;
  final ListTileStyle? listTileStyle;
  final String lastSeen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        foregroundImage: Image.network(imagesrc).image,
      ),
      title: Text(name),
      subtitle: Text(lastSeen),
      onTap: onTap,
      style: listTileStyle,
      enableFeedback: true,
    );
  }
}
