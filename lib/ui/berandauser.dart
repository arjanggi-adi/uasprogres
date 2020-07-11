import 'package:uas100/ui/berandaadmin.dart';
import 'package:uas100/ui/inputpenjualan.dart';
import 'package:uas100/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas100/ui/home.dart';
import 'package:uas100/ui/produklist.dart';

class Berandauser extends StatefulWidget {
  @override
  _BerandauserState createState() => _BerandauserState();
}

class _BerandauserState extends State<Berandauser> {
//variabel untuk menampung shared preference
  String id;
  String nama;
  String email;
  String photo;
  List penjualanList;
  int level = 0;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
//fungsi untuk memanggil shared preferences
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
//mengisi nilai masing-masing variabel
      level = preferences.getInt("level");
      id = preferences.getString("id");
      email = preferences.getString("email");
      nama = preferences.getString("nama");
      photo = preferences.getString("photo");
    });
  }

//fungsi signt out
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
//set level 0
      preferences.setInt("level", 0);
    });
//redirect login
    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
//memanggil fungsi preference
    getPref();
  }

  @override
  Widget build(BuildContext context) {
//swicth untuk menampilkan halaman berdasarkan level user
    switch (level) {
      case 1:
//memanggil halaman admin
        return Berandaadmin();
        break;
      case 2:
//mereturn sebuah scafold halaman user
        return Scaffold(
          appBar: new AppBar(
            title: new Text("Beranda"),
          ),
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("$nama"),
                  accountEmail: new Text("$email"),
                  currentAccountPicture: new GestureDetector(
                    onTap: () {},
                    child: new CircleAvatar(
                      backgroundImage: new AssetImage('assets/profil.jpg'),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/appimages/bg_profile.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                new ListTile(
                  title: new Text('logout'),
                  trailing: new Icon(Icons.exit_to_app),
                  onTap: () {
                    signOut();
                  },
                ),
              ],
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/cover.jpg"),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xff3164bd),
                        const Color(0xff295cb5)
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp 42.000.000 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              'COLLOSUS DH8',
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.local_offer,
                        color: Colors.red[500],
                      ),
                      Text(' Discount Up 10%'),
                    ],
                  ),
                ),
                Container(
                    child: new Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/tambah.png', width: 40),
                              new Text(
                                "",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
//memanggil input penjualan voucher
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new InputPenjualan(
                                        list: null,
                                        index: null,
                                      )),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/keranjang.png',
                                  width: 40),
                              new Text(
                                "",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
//memanggil halaman penjualan voucher
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => new Home(),
                            ));
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/sepeda.png', width: 40),
                              new Text(
                                "",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ProdukList(),
                            ));
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          padding: EdgeInsets.all(10),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset('assets/laporan.png', width: 40),
                              new Text(
                                "",
                                style: new TextStyle(
                                    fontSize: 10, color: Colors.red),
                              )
                            ],
                          ),
                          onPressed: () {
//hitung('/');
                          },
                        ),
                      )
                    ]),
                  ],
                ))
              ],
            ),
          ),
        );
      case 0:
//jika level 0 kemabli ke login
        return Login();
        break;
    }
  }
}
