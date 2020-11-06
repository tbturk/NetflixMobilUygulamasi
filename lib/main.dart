import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mtflix/Login.dart';
import 'package:mtflix/Signin.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(
    title: "Mtflix",
    theme: ThemeData(primarySwatch: Colors.red),
    debugShowCheckedModeBanner: false,
    home: anaEkran(),
  ));


}
class anaEkran extends StatefulWidget {
  @override
  int sayac=0;
  String veriTabani;
  static List<film> filmler=new List();
  static List<String> turler=new List();
  static List<String> linkler=new List();
  State<StatefulWidget> createState() {
    dosyaOku();
    linkEkle();
    return Login();
  }

  Future<void> dosyaOku() async {
    return await rootBundle.loadString('database/a.txt').then((value) {
      veriTabani=value;
      LineSplitter ls = new LineSplitter();
      List<String> filmler1 = ls.convert(veriTabani);

      for (var i = 0; i < filmler1.length; i++) {
        List<String> ikili= filmler1[i].split("-");
        filmler.add(new film(ikili[0],ikili[1]));
        if(!turler.contains(ikili[1])){
          turler.add(ikili[1]);
        }
      }
    });

  }

  void linkEkle(){
    linkler.add("https://i2.cnnturk.com/i/cnnturk/75/1200x0/5c6bd3e661361f1cdcc5a5f6.jpg");
    linkler.add("https://i.ytimg.com/vi/LhiFw_2EasE/maxresdefault.jpg");
    linkler.add("https://tr.web.img4.acsta.net/pictures/16/11/17/08/40/394677.jpg");
    linkler.add("https://tr.web.img4.acsta.net/pictures/14/07/09/09/59/583881.jpg");
    linkler.add("https://cocuklasinema.com/assets/admin/images/movie/ivguDancing%20with%20the%20Birds.jpg");
    linkler.add("https://cocuklasinema.com/assets/admin/images/movie/jklvmission_blue.jpg");
    linkler.add("https://is3-ssl.mzstatic.com/image/thumb/Video2/v4/98/ac/ec/98acecef-5ecf-0674-dd12-091818529458/mza_7444265486042039535.jpg/268x0w.jpg");
    linkler.add("https://tr.web.img2.acsta.net/pictures/17/12/11/11/23/4582191.jpg");
    linkler.add("https://tr.web.img4.acsta.net/pictures/14/01/13/15/25/546033.jpg");
    linkler.add("https://i.idefix.com/cache/500x400-0/originals/0001874349001-1.jpg");
    linkler.add("https://tr.web.img4.acsta.net/pictures/19/02/20/15/14/4298296.jpg");
    linkler.add("https://tr.web.img4.acsta.net/pictures/19/11/15/09/07/4021757.jpg");
    linkler.add("https://www.keyfisanat.com/wp-content/uploads/2019/12/dunyanin-en-siradisi-evleri-netflix.jpg");
    linkler.add("https://turkcealtyazi.org/images/poster/8893550.jpg");
    linkler.add("https://img-s1.onedio.com/id-5c9e2b7c7355e79e18c6f48a/rev-0/raw/s-b691dd8bd3131f6ebd2cbcbfa2e1373226d033ef.jpg");
    linkler.add("https://tr.web.img4.acsta.net/medias/nmedia/18/86/26/15/20263925.jpg");
    linkler.add("https://upload.wikimedia.org/wikipedia/tr/thumb/e/e4/Delibal.jpg/220px-Delibal.jpg");
    linkler.add("https://tr.web.img3.acsta.net/pictures/15/12/03/12/25/177321.jpg");
    linkler.add("https://musicart.xboxlive.com/7/dbd31000-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080");
    linkler.add("https://www.altinkitaplar.com.tr/static/img/2016/11/da-vinci-sifresi-gencler-icin-m.jpg");
  }
}
class film{

  String isim;
  String tur;

  film(this.isim, this.tur);
}

