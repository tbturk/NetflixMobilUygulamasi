import 'package:flutter/material.dart';
import 'package:mtflix/Signin.dart';
import 'package:mtflix/main.dart';
import 'package:mtflix/Management.dart';

class Login extends State<anaEkran> {
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double ekranY = size.width;
    double ekranX = size.height;
    // var _mailkontrol = TextEditingController();
    // var _sifrekontrol = TextEditingController();
    final FocusNode _mailFocus = FocusNode();
    final FocusNode _sifreFocus = FocusNode();
    String girilenmail;
    String girilensifre;
    //Sisteme giriş için kullanılacak kullanıcı bilgileri//
    String ka="admin@turk.com";                          //
    String pwd="061219*";                                //
    ///////////////////////////////////////////////////////
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Center(

                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png",
                          height: MediaQuery.of(context).orientation ==
                              Orientation.landscape&& ekranY < 700
                              ? 100
                              :MediaQuery.of(context).orientation ==
                              Orientation.landscape&& ekranY > 700
                              ?200
                              :MediaQuery.of(context).orientation ==
                              Orientation.portrait &&
                              ekranY < 360
                              ?100
                              :MediaQuery.of(context).orientation ==
                              Orientation.portrait &&
                              ekranY >= 360? 200
                              :150,
                        ),
                        Container(
                          width: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                              ? ekranY - 300
                              : MediaQuery.of(context).orientation ==
                              Orientation.portrait &&
                              ekranY < 360
                              ? ekranY - 50
                              : ekranY - 20,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: TextFormField(
                              onChanged: (value){
                                girilenmail=value;
                              },
                              focusNode: _mailFocus,
                              //controller: _mailkontrol,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration:  InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
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
                                labelText: 'E-posta',
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (term) {
                                _fieldFocusChange(
                                    context, _mailFocus, _sifreFocus);
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                              ? ekranY - 300
                              : MediaQuery.of(context).orientation ==
                              Orientation.portrait &&
                              ekranY < 360
                              ? ekranY - 50
                              : ekranY - 20,
                          child: Padding(
                            padding:  EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: TextFormField(
                              onChanged: (value){
                                girilensifre=value;
                              },
                              focusNode: _sifreFocus,
                              keyboardType: TextInputType.visiblePassword,
                              // controller: _sifrekontrol,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                    onPressed: (){
                                      debugPrint(girilensifre+girilenmail);
                                      if(girilenmail.compareTo(ka)==0 && girilensifre.compareTo(pwd)==0){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>(anaSayfa())));
                                      }

                                    }),
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.white,
                                ),
                                helperStyle: TextStyle(color: Colors.white),
                                labelText: 'Şifre',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              maxLines: 1,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (term) {
                                _sifreFocus.unfocus();
                                FocusScope.of(context).requestFocus(new FocusNode());
                              },
                            ),
                          ),
                        ),
                        FlatButton(
                          child: Text("Şimdi Kaydol"),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                          },
                          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,

                child:MediaQuery.of(context).viewInsets.bottom!=0? Container(): Row(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.movie_filter, color: Colors.red),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.fast_forward, color: Colors.red),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.pause_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.video_library, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  girisKontrol() {
    debugPrint("");
  }

}
