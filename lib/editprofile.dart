import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _userName = '';
  String _userEmail = '';
  File? _image; // Store the selected image file

  // Function to open gallery and select image
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Rest of the content
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Stack to overlay the camera icon on the profile picture
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Show user's profile picture
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                      ),
                      // Container for the background box of the camera icon
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(202, 239, 115, 20),
                        ),
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: () {
                            // Open gallery to select image
                            _pickImage(ImageSource.gallery);
                          },
                          icon: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Container for text fields
                  Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // Text field for name
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 120, 34, 34),
                              shadows: [
                                Shadow(
                                  color:
                                      const Color.fromARGB(255, 171, 157, 157),
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // Implement logic to edit name
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 2,
                                  )
                                ],
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            _userName = value;
                          },
                        ),
                        SizedBox(height: 20),
                        // Text field for email
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 120, 34, 34),
                              shadows: [
                                Shadow(
                                  color:
                                      const Color.fromARGB(255, 171, 157, 157),
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                )
                              ],
                            ),
                          ),
                          onChanged: (value) {
                            _userEmail = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 130),
                  // Buttons row
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Save Changes button
                        ElevatedButton(
                          onPressed: () {
                            // Implement logic to save changes
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                          ),
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Color.fromARGB(255, 182, 17, 17),
                            ),
                          ),
                        ),
                        // Cancel button
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                                context); // Navigate back without saving changes
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 179, 20, 20),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
