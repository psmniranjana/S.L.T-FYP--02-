import 'package:flutter/material.dart';
import 'package:ht_2/favourite.dart';
import 'package:ht_2/home.dart';
import 'package:ht_2/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 70), // Add space above the content
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // User profile photo
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profie.png'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // User Name, Gender, and Age
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'User Name: John Doe',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Gender: Male',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Age: 30',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20), // Add space below the content
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Handle navigation here
          switch (index) {
            case 0:
              // Navigate to FavoritePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(
                    selectedSites: [],
                  ),
                ),
              );
              break;
            case 1:
              // Navigate to Favourites
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 2:
              // Navigate to Translation History
              break;
            case 3:
              // Navigate to Settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              break;
            default:
            // Navigate to Home by default
              break;
          }
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  BottomNavBar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: Colors.orange),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.orange),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, color: Colors.orange),
          label: 'Translation History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.orange),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.orange,
      backgroundColor: Colors.orange,
      elevation: 10,
      selectedIconTheme: IconThemeData(
        color: Color.fromARGB(255, 247, 255, 24),
        size: 30,
      ),
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }
}
