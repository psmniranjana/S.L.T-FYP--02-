import 'package:flutter/material.dart';
import 'package:ht_2/editprofile.dart';
import 'package:ht_2/favourite.dart';
import 'package:ht_2/home.dart';
// Import the SettingsPage

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 3; // Set the initial selected index to 3 (Settings)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/bg4.jpg'), // Replace 'background_image.jpg' with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Rest of the content
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                // Centered "Settings" text
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 232, 195, 28),
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 21, 8, 8),
                            offset: Offset(1, 1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 179, 20, 20), // Set button color
                  ),
                  child: Text(
                    'Edit Your Profile',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 254, 249),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  'Permissions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ListTile with a Switch wrapped in a Container to add a border to the Switch
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red, // Border color set to maroon
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: const Text('Camera'),
                    subtitle: const Text(
                        'App with this permission can take pictures and record video'),
                    trailing: Switch(
                      value: true, // Replace with actual value
                      onChanged: (value) {
                        // Update permission 1
                      },
                      activeTrackColor: Color.fromARGB(255, 179, 20,
                          20), // Change active track color to orange
                    ),
                  ),
                ),
                // ListTile with a Switch wrapped in a Container to add a border to the Switch
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red, // Border color set to maroon
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text('Microphone'),
                    subtitle: Text('App with this permission can record audio'),
                    trailing: Switch(
                      value: false, // Replace with actual value
                      onChanged: (value) {
                        // Update permission 2
                      },
                      activeTrackColor: Color.fromARGB(255, 179, 20,
                          20), // Change active track color to orange
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ListTile with a Switch wrapped in a Container to add a border to the Switch
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red, // Border color set to maroon
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text('Allow Notifications'),
                    trailing: Switch(
                      value: true, // Replace with actual value
                      onChanged: (value) {
                        // Update notification settings
                      },
                      activeTrackColor: Color.fromARGB(255, 179, 20,
                          20), // Change active track color to orange
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ListTile with a Switch wrapped in a Container to add a border to the Switch
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red, // Border color set to maroon
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text('Allow Location Access'),
                    trailing: Switch(
                      value: true, // Replace with actual value
                      onChanged: (value) {
                        // Update location settings
                      },
                      activeTrackColor: Color.fromARGB(255, 179, 20,
                          20), // Change active track color to orange
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ListTile with a Switch wrapped in a Container to add a border to the Switch
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(
                          255, 179, 20, 20), // Border color set to maroon
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text('Dark Mode'),
                    trailing: Switch(
                      value: false, // Replace with actual value
                      onChanged: (value) {
                        // Toggle dark mode
                      },
                      activeTrackColor: Color.fromARGB(255, 179, 20,
                          20), // Change active track color to orange
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
            label: 'Favorites',
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoritePage(
                          selectedSites: [],
                        )),
              );
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
              Navigator.pop(
                  context); // Pop the SettingsPage to go back to the previous page
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
