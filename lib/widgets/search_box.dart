import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.search),
      shape: BeveledRectangleBorder(side: BorderSide()),
      title: TextField(
        decoration: InputDecoration(label: Text("Search")),
      ),
    );
  }
}
