import 'package:flutter/material.dart';

class WhiteList extends StatefulWidget {
  WhiteList({Key? key}) : super(key: key);

  @override
  State<WhiteList> createState() => _WhiteListState();
}

class _WhiteListState extends State<WhiteList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Whitelist'),
      ],
    );
  }
}
