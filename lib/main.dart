import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'core/theme_sena.dart';

// materialpalette.com
// https://www.youtube.com/watch?v=BEVOiv_j35w&t=9s

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sena',
      theme: ThemeSena.theme(),
      home: DashPage(),
    );
  }
}

class DashPage extends StatefulWidget {
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dash'),
      ),
      body: Container(),
    );
  }
}
