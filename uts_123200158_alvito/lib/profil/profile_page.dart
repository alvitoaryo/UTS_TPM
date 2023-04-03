import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:uts_123200158_alvito/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Widget _judul() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
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

    Widget _detailButton() {
      return Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(),
              ),
            );
          },
          child: Text('Lihat Detail Data Diri'),
        ),
      );
    }

    Widget _profil() {
      return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _judul(),
          CircleAvatar(
            radius: 80,
            child: Image.asset(
              'images/lala.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 50),
          Text(
            'ALVIO ARYO PRABOWO',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            '123200158',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          _detailButton(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DATA DIRI'),
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
      body: _profil(),
    );
  }
}
