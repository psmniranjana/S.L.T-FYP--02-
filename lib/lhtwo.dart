import 'package:flutter/material.dart';
import 'package:ht_2/favourite.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LHTwoPage extends StatefulWidget {
  @override
  _LearningHubPageState createState() => _LearningHubPageState();
}

class _LearningHubPageState extends State<LHTwoPage> {
  List<String> selectedSites = [];

  void _toggleSite(String site) {
    setState(() {
      if (selectedSites.contains(site)) {
        selectedSites.remove(site);
      } else {
        selectedSites.add(site);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/LH.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 500,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          'https://commtechlab.msu.edu/sites/aslweb/browser.htm'); // Launch the website
                    },
                    child: CheckboxListTile(
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                  'https://commtechlab.msu.edu/sites/aslweb/browser.htm');
                            },
                            child: Text(
                              'Sign Language Browser',
                              style: TextStyle(
                                color: Color.fromARGB(255, 232, 225, 99),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    offset: Offset(1, 1),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Link(
                            uri: Uri.parse(
                                'https://commtechlab.msu.edu/sites/aslweb/browser.htm'),
                            builder: (context, followLink) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: followLink,
                                child: Text(
                                  'Click Here',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color:
                                        const Color.fromARGB(255, 12, 69, 115),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      value: selectedSites.contains('Sign Language Browser'),
                      onChanged: (value) =>
                          _toggleSite('Sign Language Browser'),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          'https://www.spreadthesign.com/en.gb/search/'); // Launch the website
                    },
                    child: CheckboxListTile(
                      activeColor: Colors.orange,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                  'https://www.spreadthesign.com/en.gb/search/');
                            },
                            child: Text(
                              'Spread the Sign',
                              style: TextStyle(
                                color: Color.fromARGB(255, 232, 225, 99),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    offset: Offset(1, 1),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Link(
                            uri: Uri.parse(
                                'https://www.spreadthesign.com/en.gb/search/'),
                            builder: (context, followLink) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: followLink,
                                child: Text(
                                  'Click Here',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color:
                                        const Color.fromARGB(255, 12, 69, 115),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      value: selectedSites.contains('Spread the Sign'),
                      onChanged: (value) => _toggleSite('Spread the Sign'),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.asl.gs/'); // Launch the website
                    },
                    child: CheckboxListTile(
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://www.asl.gs/');
                            },
                            child: Text(
                              'Gallaudet Dictionary of ASL',
                              style: TextStyle(
                                color: Color.fromARGB(255, 232, 225, 99),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    offset: Offset(1, 1),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Link(
                            uri: Uri.parse('https://www.asl.gs/'),
                            builder: (context, followLink) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: followLink,
                                child: Text(
                                  'Click Here',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color:
                                        const Color.fromARGB(255, 12, 69, 115),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      value:
                          selectedSites.contains('Gallaudet Dictionary of ASL'),
                      onChanged: (value) =>
                          _toggleSite('Gallaudet Dictionary of ASL'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(selectedSites: selectedSites),
            ),
          );
        },
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }

  // Function to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
