import 'package:flutter/material.dart';
import 'package:mtflix/main.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class anaSayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return yonetim();
  }
}

class yonetim extends State<anaSayfa> {
  GlobalKey<FormFieldState> listeFilm = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.red) ,
            title: Text("NETFLİX",style: TextStyle(color: Colors.red),),
            backgroundColor: Colors.black,
            expandedHeight: 300,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://tr.web.img3.acsta.net/pictures/19/10/14/12/50/4506295.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            key: listeFilm,
            //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                  return Container(
                    child:  Image.network("${anaEkran.linkler[index]}"),
                  );
                },childCount: 20
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child:ListView.builder(
              itemCount: anaEkran.turler.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(anaEkran.turler[index],style: TextStyle(color: Colors.red,fontSize: 26),),

                );
              }),
        ),
      ),
    );
  }
}
