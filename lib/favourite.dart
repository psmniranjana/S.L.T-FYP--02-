import 'package:flutter/material.dart';
import 'package:ht_2/home.dart';
import 'package:ht_2/settings.dart';

class FavoritePage extends StatefulWidget {
  final List<String> selectedSites;

  FavoritePage({required this.selectedSites});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Set scaffold background color to transparent
      body: Stack(
        children: [
          // Background image container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/bg4.jpg'), // Your image path here
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content container
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45),
                Text(
                  'Your Favorite Sites',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 232, 195, 28),
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 21, 8, 8),
                        offset: Offset(1, 1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(106, 16, 15, 15).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      itemCount: widget.selectedSites.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            widget.selectedSites[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Translation History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              // Handle Favorites navigation
              // You can add your logic here
              break;
            case 1:
              // Handle Home navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 2:
              // Handle Translation History navigation
              // You can add your logic here
              break;
            case 3:
              // Handle Settings navigation
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
