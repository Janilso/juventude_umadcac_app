import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';

class HomeScream extends StatefulWidget {
  @override
  _HomeScreamState createState() => _HomeScreamState();
}

class _HomeScreamState extends State<HomeScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Text(""),
        ),
      ),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
