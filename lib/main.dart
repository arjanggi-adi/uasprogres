import 'package:uas100/ui/berandaadmin.dart';
import 'package:uas100/ui/berandauser.dart';
import 'package:uas100/ui/home.dart';
import 'package:uas100/ui/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Penjualan sepeda',
      home: Berandauser(),
      routes: <String, WidgetBuilder>{
        '/Berandauser': (BuildContext context) => new Berandauser(),
        '/Berandaadmin': (BuildContext context) => new Berandaadmin(),
        '/login': (BuildContext context) => Login(),
        '/Penjualan': (BuildContext context) => new Home(),
      },
    ));
