import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts_123200158_alvito/login_page.dart';
import 'package:uts_123200158_alvito/profil/profile_page.dart';

 import 'profil/profile_page.dart';
 import 'bangundatar/trapesium.dart';
 import 'kalender/kalender.dart';

class HomePage extends StatefulWidget {

  final String username;

  HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24),
          child: Center(
              child: Column(
                children: [
                  _image(),
                  SizedBox(height: 10),
                  Text(
                    "Halo ${widget.username}\nSelamat datang",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 24),
                  Text("Pilihan Menu"),
                ],
              )
        ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87, // set the color of the selected icon
        unselectedItemColor: Colors.black87,// set the color of the unselected icons
        onTap: (value) {
          if (value == 0) Navigator.push(context, MaterialPageRoute(builder: (context)=> trapesium())) ;
          if (value == 1) Navigator.push(context, MaterialPageRoute(builder: (context)=> kalender())) ;
          if (value == 2) Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage())) ;
        },

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.details_sharp),
            label: 'PERHITUNGAN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api_sharp),
            label: 'CALENDAR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }

  Widget _image(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        width: 260.0,
        child: Image.asset('images/home.jpg')
    );
  }
  }
