import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = []; // Declare cameras globally

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Translation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RealTimeTranslationPage(),
    );
  }
}

class RealTimeTranslationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Real-Time Translation',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(244, 255, 255, 255),
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(167, 255, 252, 252)
                                    .withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/cam.webp'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _openCamera(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.transparent,
                              shadowColor: Color.fromARGB(74, 0, 0, 0),
                              padding: EdgeInsets.all(20),
                            ),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    // New section for microphone button
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(6, 238, 230, 214)
                                    .withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 9,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/mic.webp'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your onPressed logic here for Live Translation
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.transparent,
                              shadowColor: Color.fromARGB(73, 0, 0, 0),
                              padding: EdgeInsets.all(30),
                            ),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Camera open part

void _openCamera(BuildContext context) async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CameraScreen(camera: firstCamera),
    ),
  );
}

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState(); //global variable
}

class _CameraScreenState extends State<CameraScreen> {
  String apiResponse = '';
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();

    _takePictures(60);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white.withOpacity(
                        0.5), // Change the color and opacity as needed
                    padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8), // Adjust padding as needed
                    child: Text(
                      apiResponse,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () => _takePictures(1),
                        child: Icon(Icons.camera),
                      ),
                      IconButton(
                        onPressed: _switchCamera,
                        icon: Icon(Icons.flip_camera_ios),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _takePictures(int totalImages) async {
    try {
      await _initializeControllerFuture;
      int count = 0;
      List<String> imagePaths = [];

      Timer.periodic(Duration(seconds: 1), (Timer timer) async {
        if (count < totalImages) {
          count++;
          final image = await _controller.takePicture();
          final directory = await getTemporaryDirectory();
          final imagePath = '${directory.path}/image$count.jpg';
          final File newImage = await File(image.path).copy(imagePath);

          imagePaths.add(imagePath);
          print('Captured image $count: $imagePath');
          if (count == totalImages) {
            timer.cancel();
            _uploadImages(imagePaths);
          }
        } else {
          timer.cancel();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _uploadImages(List<String> imagePaths) async {
    try {
      var uri =
          Uri.parse('https://7a66-112-134-220-152.ngrok-free.app/predict');
      var request = http.MultipartRequest('POST', uri);

      for (var imagePath in imagePaths) {
        var imageFile = File(imagePath);
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();

        var multipartFile = http.MultipartFile(
          'file',
          stream,
          length,
          filename: imagePath.split('/').last,
        );

        request.files.add(multipartFile);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        // Extract words from response
        String concatenatedWords =
            jsonResponse.map((item) => item['word']).join(' ');

        // Set words in state
        setState(() {
          apiResponse = concatenatedWords;
        });
      } else {
        // Handle errors here
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while calling API: $e');
    }
  }

  void _switchCamera() async {
    if (_isFrontCamera) {
      _controller = CameraController(
        widget.camera,
        ResolutionPreset.medium,
      );
    } else {
      final cameras = await availableCameras();
      final newCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
      _controller = CameraController(
        newCamera,
        ResolutionPreset.medium,
      );
    }
    setState(() {
      _isFrontCamera = !_isFrontCamera;
      _initializeControllerFuture = _controller.initialize();
    });
  }
}