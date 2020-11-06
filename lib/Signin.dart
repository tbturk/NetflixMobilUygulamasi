import 'package:flutter/material.dart';
import 'package:mtflix/main.dart';

class Signin extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return kayit();
  }
}
class kayit extends State<Signin>{
  @override
  int _aktifAdim = 0;
  List<GlobalKey<FormFieldState>> fieldKeyler = new List();
  String isim, mail, parola, dogum;
  bool hata = false;
  static DateTime suan = DateTime.now();
  DateTime yuzYilOncesi = DateTime(suan.year - 100);
  final dogumKontrol = TextEditingController();
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      fieldKeyler.add(new GlobalKey<FormFieldState>());
    }
  }
  bool sifreKontrol(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder:
              (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  onPressed: onStepContinue,
                  child: const Text('DEVAM ET',style: TextStyle(color: Colors.white),),
                ),

                FlatButton(
                  color:Colors.white,
                  onPressed: onStepCancel,
                  child: const Text('GERİ GİT',style: TextStyle(color: Colors.red),),
                ),
              ],
            );
          },
          steps: _kayitAdimlari(),
          currentStep: _aktifAdim,
          onStepTapped: (secilenAdim) {
            setState(() {
              sonrakiAdimKontrol();
            });
          },
          onStepContinue: () {
            setState(() {
              sonrakiAdimKontrol();
            });
          },
          onStepCancel: () {
            if (_aktifAdim > 0) {
              setState(() {
                _aktifAdim--;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> _kayitAdimlari() {
    List<Step> adimlar = [
      Step(
        isActive: aktiflikKontrol(0),
        state: durumAyarla(0),
        title: Text(
          "Ad Soyad",
          style: TextStyle(color: Colors.grey),
        ),
        subtitle: Text(
          "Ad Soyad arasına boşluk bırakınız.",
          style: TextStyle(color: Colors.grey),
        ),
        content: Container(
          padding: EdgeInsets.only(top: 4),
          child: TextFormField(
            key: fieldKeyler[0],
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Ad Soyad",

              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
            validator: (kontrol) {

              if(kontrol.length < 1){
                return "Bu Alan Boş Bırakılamaz!";
              }

              if (kontrol.length < 4) {
                return "Ad-Soyad 4 karakterden fazla olmalı!";
              }

              if(!kontrol.contains(" ")){
                return "Ad Soyad arasına boşluk bırakılmalıdır!";
              }
            },
            onSaved: (kontrol) {
              isim = kontrol;
            },
          ),
        ),
      ),
      Step(
        isActive: aktiflikKontrol(1),
        state: durumAyarla(1), // sol üstteki durumu görsellememize yarar.
        title: Text("Doğum Tarihi", style: TextStyle(color: Colors.grey)),
        subtitle: Text("Gün-Ay-Yıl şeklinde giriniz.", style: TextStyle(color: Colors.grey)),
        content: Container(
          padding: EdgeInsets.only(top: 4),
          child: TextFormField(
            key: fieldKeyler[1],
            controller: dogumKontrol,
            onTap: () {
              if (_aktifAdim == 1) {
                showDatePicker(
                    cancelText: "İPTAL",
                    confirmText: "TAMAM",
                    helpText: "Doğum Tarihinizi Seçin",
                    context: context,
                    initialDate: suan,
                    firstDate: yuzYilOncesi,
                    lastDate: suan)
                    .then((secilenTarih) {
                  dogum = "${secilenTarih.day}-${secilenTarih.month}-${secilenTarih.year}";
                  dogumKontrol.text = "$dogum";
                });
              }
            },
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Doğum Tarihi",
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
            validator: (kontrol) {
              if (kontrol.length < 1) {
                return "Bu Alan Boş Bırakılamaz!";
              }
              int kacTane=0;
              for(int i=0;i<kontrol.length-1;i++){
                if(kontrol.substring(i,i+1).contains("-")){
                  kacTane++;
                }
              }
              if(kacTane!=2){
                return "Geçerli bir doğum tarihi giriniz!";
              }

            },
            onSaved: (kontrol) {
              dogum = kontrol;
            },
          ),
        ),
      ),
      Step(
        isActive: aktiflikKontrol(2),
        state: durumAyarla(2),
        title: Text("E-posta", style: TextStyle(color: Colors.grey)),
        subtitle: Text("...@example.com şeklinde giriniz.",style: TextStyle(color: Colors.grey),),
        content: Container(
          padding: EdgeInsets.only(top: 4),
          child: TextFormField(
            key: fieldKeyler[2],
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "E-posta",
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
            validator: (kontrol) {
              if(kontrol.length < 1){
                return "Bu Alan Boş Bırakılamaz";
              }

              if (kontrol.length < 5) {
                return "E-posta en az 6 karakter olmalı!";
              }
              if (!kontrol.contains("@") || (!(kontrol.contains(".")))) {
                return "Geçerli bir E-posta adresi giriniz!";
              }
            },
            onSaved: (kontrol) {
              mail = kontrol;
            },
          ),
        ),
      ),
      Step(
        isActive: aktiflikKontrol(3),
        state: durumAyarla(3), // sol üstteki durumu görsellememize yarar.
        title: Text("Parola", style: TextStyle(color: Colors.grey)),
        subtitle: Text(
            "En az 1 büyük harf\n"+
                "En az 1 küçük harf\n"+
                "En az 1 rakam\n"+
                "En az 1 özel karakter (! @ # \$ & * ~ .)\n"+
                "kullanılmalıdır.", style: TextStyle(color: Colors.grey) ),
        content: Container(
          padding: EdgeInsets.only(top: 4),
          child: TextFormField(
            key: fieldKeyler[3],
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Parola",
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
            validator: (kontrol) {
              if(kontrol.length < 1){
                return "Bu Alan Boş Bırakılamaz!";
              }

              if (kontrol.length < 5) {
                return "Parola en az 6 karakter olmalı!";
              }

              if(!sifreKontrol(kontrol)){
                return "Geçerli bir parola giriniz!";
              }


            },
            onSaved: (kontrol) {
              parola = kontrol;
            },
          ),
        ),
      ),
      Step(
        isActive: aktiflikKontrol(4),
        state: durumAyarla(4), // sol üstteki durumu görsellememize yarar.

        title: Text("Parola Onay", style: TextStyle(color: Colors.grey)),
        content: Container(
          padding: EdgeInsets.only(top: 4),
          child: TextFormField(
            key: fieldKeyler[4],
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Parola Onay",
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
            validator: (kontrol) {
              if(kontrol.length < 1){
                return "Bu Alan Boş Bırakılamaz";
              }

              if (kontrol.compareTo(parola) != 0) {
                return "Parolalar uyuşmuyor!";
              }


            },
            onSaved: (kontrol){
              Navigator.pop(context);
            },
          ),
        ),
      ),
    ];
    return adimlar;
  }

  bool aktiflikKontrol(int index) {
    if (_aktifAdim == index) {
      return true;
    } else {
      return false;
    }
  }

  StepState durumAyarla(int index) {
    if (_aktifAdim == index) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else if (index > _aktifAdim) {
      return StepState.indexed;
    } else if (index < _aktifAdim) {
      return StepState.complete;
    }
  }

  void sonrakiAdimKontrol() {
    switch (_aktifAdim) {
      case 0:
        if (fieldKeyler[0].currentState.validate()) {
          hata = false;
          _aktifAdim++;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (fieldKeyler[1].currentState.validate()) {
          fieldKeyler[1].currentState.save();
          hata = false;
          _aktifAdim++;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (fieldKeyler[2].currentState.validate()) {
          fieldKeyler[2].currentState.save();
          hata = false;
          _aktifAdim++;
        } else {
          hata = true;
        }
        break;
      case 3:
        if (fieldKeyler[3].currentState.validate()) {
          fieldKeyler[3].currentState.save();
          hata = false;
          _aktifAdim++;
        } else {
          hata = true;
        }
        break;
      case 4:
        if (fieldKeyler[4].currentState.validate()) {
          fieldKeyler[4].currentState.save();
          _aktifAdim = 4;
          hata = false;
        } else {
          hata = true;
        }
        break;
    }
  }
}
