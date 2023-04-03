import 'package:flutter/material.dart';
import 'package:uts_123200158_alvito/login_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget _judul() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10,40,10,20),
        child: Center(
          child: Text(
            'Profil',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
      );
    }

    Widget _detail() {
      return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/fotobendera.jpeg'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('NIM'),
              subtitle: Text('123200158'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nama'),
              subtitle: Text('ALVIO ARYO PRABOWO'),
            ),
            ListTile(
              leading: Icon(Icons.class__outlined),
              title: Text('Kelas'),
              subtitle: Text('IF-D'),
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Tempat dan Tanggal Lahir'),
              subtitle: Text('Kediri, 18 November 2001'),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: Text('Harapan/Cita-cita Kedepan'),
              subtitle: Text('Menjadi seorang yang berguna bagi orang banyak dan sukses dunia akhirat'),
            ),
            SizedBox(height: 30),
          ],
        ),
      );
    }

    Widget _Profil() {
      return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _judul(),
          _detail(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DETAIL DATA DIRI'),
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
      body: _Profil(),
    );
  }
}
