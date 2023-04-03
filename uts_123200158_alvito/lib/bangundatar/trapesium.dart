import 'package:flutter/material.dart';
import 'package:uts_123200158_alvito/bangundatar/tabung.dart';
import 'package:uts_123200158_alvito/login_page.dart';
import 'dart:math';
import 'trapesium.dart';


class trapesium extends StatefulWidget {
  @override
  State<trapesium> createState() => _trapesiumState();
}


class _trapesiumState extends State<trapesium> {
  double sisiAtas = 0, sisiBawah = 0, tinggi = 0, luas = 0, keliling = 0;

  final TextEditingController sisiAtasController =
  TextEditingController(text: "");
  final TextEditingController sisiBawahController =
  TextEditingController(text: "");
  final TextEditingController tinggiController =
  TextEditingController(text: "");

  void hitung() {
    setState(() {
      sisiAtas = double.parse(sisiAtasController.text);
      sisiBawah = double.parse(sisiBawahController.text);
      tinggi = double.parse(tinggiController.text);
      luas = ((sisiAtas + sisiBawah) * tinggi) / 2;
      keliling = sisiAtas + sisiBawah + 2 * sqrt(pow(tinggi, 2) + pow(((sisiBawah - sisiAtas) / 2), 2));
    });
  }

  void hapus() {
    setState(() {
      sisiAtasController.text = "";
      sisiBawahController.text = "";
      tinggiController.text = "";
      luas = 0;
      keliling = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Kalkulator Trapesium"),
    centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                );
              },
              icon: Icon(Icons.logout),
              tooltip: 'Logout',
            ),
          ],
    ),
    body: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            width: 250,
            child: TextField(
              controller: sisiAtasController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sisi Atas',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            alignment: Alignment.center,
            width: 250,
            child: TextField(
              controller: sisiBawahController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sisi Bawah',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            alignment: Alignment.center,
            width: 250,
            child: TextField(
              controller: tinggiController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tinggi',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text("Keliling : $keliling",
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          const SizedBox(height: 10),
          Text("Luas : $luas",
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: hitung,
                child: const Text("Hitung"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: hapus,
                child: const Text("Hapus"),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      // LandingPage adalah halaman yang dituju
                      MaterialPageRoute(
                          builder: (context) => HitungTabung()
                      ),
                    );
                    },
                  child: const Text('Kalkulator Tabung',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}