import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = [];

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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(top: 80),
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
            SizedBox(height: 0),
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
                                color: Colors.black.withOpacity(0.3),
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
                              image: AssetImage('assets/images/cam3.png'),
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
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String apiResponse = '';
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFrontCamera = false;
  late Timer _timer;
  int _imageCount = 0;
  List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_imageCount < 60) {
        _takePicture();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      _imageCount++;
      final image = await _controller.takePicture();
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/image$_imageCount.jpg';
      final File newImage = await File(image.path).copy(imagePath);

      _imagePaths.add(imagePath);
      print('Captured image $_imageCount: $imagePath');

      await _uploadImage(imagePath, _imageCount);
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> _uploadImage(String imagePath, int imageIndex) async {
    try {
      var uri =
          Uri.parse('https://6e7e-112-134-221-104.ngrok-free.app/predict');
      var request = http.MultipartRequest('POST', uri);

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

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print(
          'Response status code for image $imageIndex: ${response.statusCode}');
      print('Response body for image $imageIndex: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        String concatenatedWords =
            jsonResponse.map((item) => item['word']).join(' ');

        setState(() {
          apiResponse = concatenatedWords;
        });
      } else {
        print('Error for image $imageIndex: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while calling API for image $imageIndex: $e');
    }
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
                    color: Colors.white.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
