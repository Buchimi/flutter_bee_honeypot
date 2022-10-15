import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {super.key, this.imagesrc = "", this.onTap, this.listTileStyle});

  final String imagesrc;
  final VoidCallback? onTap;
  final ListTileStyle? listTileStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        foregroundImage: Image.network(imagesrc).image,
      ),
      onTap: onTap,
      style: listTileStyle,
    );
  }
}
