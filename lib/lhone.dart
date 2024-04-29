// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ht_2/favourite.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class LHOnePage extends StatefulWidget {
  @override
  _LearningHubPageState createState() => _LearningHubPageState();
}

class _LearningHubPageState extends State<LHOnePage> {
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
                image: AssetImage(
                    'assets/images/LH1.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 500,
              margin: EdgeInsets.symmetric(
                  horizontal: 20), // Adjust margin as needed
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.3), // Adjust opacity and color as needed
                borderRadius:
                    BorderRadius.circular(20), // Adjust border radius as needed
              ),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  // List of websites with checkboxes or toggle buttons
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          'https://www.lifeprint.com/'); // Launch the website
                    },
                    child: CheckboxListTile(
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://www.lifeprint.com/');
                            },
                            child: Text(
                              'Life print ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 34, 230, 220),
                                    offset: Offset(1, 1),
                                    blurRadius: 6,
                                  ),
                                ],
                              ), // Replace with your website 1 text
                            ),
                          ),
                          SizedBox(height: 8), // Add line break
                          Link(
                            uri: Uri.parse('https://www.lifeprint.com/'),
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
                      value: selectedSites.contains('Life Print'),
                      onChanged: (value) => _toggleSite('Life Print'),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          'https://www.lifeprint.com/asl101/pages-layout/concepts.htm'); // Launch the website
                    },
                    child: CheckboxListTile(
                      activeColor: Colors.orange,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(
                                  'https://www.lifeprint.com/asl101/pages-layout/concepts.htm');
                            },
                            child: Text(
                              'ASL University (Dr. Bill Vicars) ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 34, 230, 220),
                                    offset: Offset(1, 1),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8), // Add line break
                          Link(
                            uri: Uri.parse(
                                'https://www.lifeprint.com/asl101/pages-layout/concepts.htm'),
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
                      value: selectedSites
                          .contains('ASL University (Dr. Bill Vicars)'),
                      onChanged: (value) =>
                          _toggleSite('ASL University (Dr. Bill Vicars)'),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          'https://gallaudet.edu/asl-connect/'); // Launch the website
                    },
                    child: CheckboxListTile(
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://gallaudet.edu/asl-connect/');
                            },
                            child: Text(
                              'Gallaudet University ASL Connect',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 34, 230, 220),
                                    offset: Offset(1, 1),
                                    blurRadius: 6,
                                  ),
                                ],
                              ), // Replace with your website 1 text
                            ),
                          ),
                          SizedBox(height: 8), // Add line break
                          Link(
                            uri:
                                Uri.parse('https://gallaudet.edu/asl-connect/'),
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
                      value: selectedSites
                          .contains('Gallaudet University ASL Connect'),
                      onChanged: (value) =>
                          _toggleSite('Gallaudet University ASL Connect'),
                    ),
                  ),
                  // Add more websites as needed
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
