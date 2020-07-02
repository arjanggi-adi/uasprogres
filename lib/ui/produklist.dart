import 'package:flutter/material.dart';
//import terlebih dahulu halaman yang diperlukan
import './detailproduk.dart';

class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        appBar: AppBar(title: Text("All Bicycle List")),
        //body untuk content
        //menampilkan list
        body: ListView(
          shrinkWrap: true,
          //padding
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          //anggota dari list berupa widget children
          children: <Widget>[
            //GestureDetector untuk menangani gesture pengguna
            new GestureDetector(
              //listener  berupa klik 1x
              onTap: () {
                //navigator.push  untuk berpindah halaman
                Navigator.of(context).push(new MaterialPageRoute(
                  //pemanggilan class DetailProduk beserta pengiriman detail produk
                  builder: (BuildContext context) => DetailProduk(
                    name: "Poligon Monarch 5",
                    description: "Terinspirasi dari sepeda gunung XC Race,"
                        "sepeda Monarch 5 didesain khusus untuk medan crosscountry"
                        "dengan rangka kuat yang tahan karat.",
                    price: 2325000,
                    image: "poligon_monarch_5.jpg",
                    star: 4,
                  ),
                ));
              },
              //memanggil class Productbox
              child: ProductBox(
                  //berisi parameter yang diperlukan di class ProductBox
                  name: "Poligon Monarch 5",
                  description: "Bermaterial Allutech Alloy yang ringan,"
                      "Monarch 4 mudah dikendalikan terutama pada jalanan tidak rata dan berbatu.",
                  price: 2550000,
                  image: "poligon_monarch_5.jpg",
                  star: 4),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Poligon Monarch 4",
                      description: "Bermaterial Allutech Alloy yang ringan,"
                          "Monarch 4 mudah dikendalikan terutama pada jalanan tidak rata dan berbatu.",
                      price: 2550000,
                      image: "poligon_monarch_4",
                      star: 5,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Poligon Monarch 4",
                    description: "Bermaterial Allutech Alloy yang ringan,"
                        "Monarch 4 mudah dikendalikan terutama pada jalanan tidak rata dan berbatu.",
                    price: 2550000,
                    image: "poligon_monarch_4.jpg",
                    star: 5)),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Poligon Monarch 3",
                      description:
                          "Handlebar STEEL HANDLEBAR WIDTH 680MM RISE 40MM, BAR BORE 31.8MM.",
                      price: 2561000,
                      image: "poligon_monarch_3",
                      star: 5,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Poligon Monarch 3",
                    description:
                        "Handlebar STEEL HANDLEBAR WIDTH 680MM, RISE 40MM BAR BORE 31.8MM.",
                    price: 2561000,
                    image: "poligon_monarch_3.jpg",
                    star: 5)),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Poligon Monarch 2",
                      description:
                          "Handlebar 	WIDTH 680MM, RISE 40MM BAR BORE 31.8MM (FOV)",
                      price: 2480000,
                      image: "poligon_monarch_2.jpg",
                      star: 3,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Poligon Monarch 2",
                    description:
                        "Handlebar 	WIDTH 680MM, RISE 40MM BAR BORE 31.8MM (FOV)",
                    price: 2480000,
                    image: "poligon_monarch_2.jpg",
                    star: 5)),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Poligon Monarch MJR",
                      description: "Fork sudah dilengkapi suspensi"
                          "dengan travel 75mm memungkinkan Monarch MJR untuk dikendarai di medan off-road ringan.",
                      price: 2100000,
                      image: "poligon_monarch_mjr.jpg",
                      star: 2,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Poligon Monarch MJR",
                    description: "Fork sudah dilengkapi suspensi"
                        "dengan travel 75mm memungkinkan Monarch MJR untuk dikendarai di medan off-road ringan.",
                    price: 2100000,
                    image: "poligon_monarch_mjr.jpg",
                    star: 5)),
          ],
        ));
  }
}

//menggunakan widget StatelessWidget
class ProductBox extends StatelessWidget {
  //deklarasi variabel yang diterima dari MyHomePage
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  //menampung variabel yang diterima untuk dapat digunakan pada class ini
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];

  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.deepOrange,
      ));
    }
    //menggunakan widget container
    return Container(
        //padding
        padding: EdgeInsets.all(10),
        // height: 120,
        //menggunakan widget card
        child: Card(
            //membuat tampilan secara horisontal antar image dan deskripsi
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children digunakan untuk menampung banyak widget
                children: <Widget>[
              Image.asset(
                "assets/" + image,
                width: 150,
              ),
              Expanded(
                  //child digunakan untuk menampung satu widget
                  child: Container(
                      padding: EdgeInsets.all(5),
                      //membuat tampilan secara vertikal
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //ini isi tampilan vertikal tersebut
                        children: <Widget>[
                          //menampilkan variabel menggunakan widget text
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(this.description),
                          Text(
                            "Price: " + this.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          //menampilkan widget icon  dibungkus dengan row
                          Row(
                            children: <Widget>[
                              Row(
                                children: children,
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
