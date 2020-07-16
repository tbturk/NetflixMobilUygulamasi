import 'package:flutter/material.dart';
import 'package:mtflix/Login.dart';
import 'package:mtflix/Signin.dart';

void main() {
  runApp(MaterialApp(
    title: "Mtflix",
    theme: ThemeData(primarySwatch: Colors.red),
    debugShowCheckedModeBanner: false,
    home: durum(),
  ));


}
class durum extends StatefulWidget {
  @override
  int sayac=0;
  State<StatefulWidget> createState() {
    return signin();
  }
}

