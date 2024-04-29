import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int _rating = 0;
  String _comment = '';
  String _recognitionIssueComment = '';
  bool _anonymousVote = false;

  void _submitFeedback() {
    // Implement your submit feedback logic here
    print('Rating: $_rating');
    print('Comment: $_comment');
    print('Recognition Issue Comment: $_recognitionIssueComment');
    print('Anonymous Vote: $_anonymousVote');
  }

  Widget _buildFeedbackText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 0),
        // Feedback text
        Text(
          'Feedbacks',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        SizedBox(height: 180),
      ],
    );
  }

  Widget _buildRemainingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Please rate your experience:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    offset: Offset(1, 1),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.star,
                  color: _rating >= 1 ? Colors.yellow : Colors.grey),
              onPressed: () => setState(() => _rating = 1),
            ),
            IconButton(
              icon: Icon(Icons.star,
                  color: _rating >= 2 ? Colors.yellow : Colors.grey),
              onPressed: () => setState(() => _rating = 2),
            ),
            IconButton(
              icon: Icon(Icons.star,
                  color: _rating >= 3 ? Colors.yellow : Colors.grey),
              onPressed: () => setState(() => _rating = 3),
            ),
            IconButton(
              icon: Icon(Icons.star,
                  color: _rating >= 4 ? Colors.yellow : Colors.grey),
              onPressed: () => setState(() => _rating = 4),
            ),
            IconButton(
              icon: Icon(Icons.star,
                  color: _rating >= 5 ? Colors.yellow : Colors.grey),
              onPressed: () => setState(() => _rating = 5),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Additional comments:',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => _comment = value,
        ),
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'If any recognition issues? please report us!',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => _recognitionIssueComment = value,
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              activeColor: Colors.orange,
              value: _anonymousVote,
              onChanged: (value) =>
                  setState(() => _anonymousVote = value ?? false),
            ),
            Text('Anonymous Vote'),
          ],
        ),
        SizedBox(height: 20),
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
                  'Submit',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg4.jpg'), // Your image path here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildFeedbackText(), // Feedback text
                _buildRemainingContent(), // Remaining content
              ],
            ),
          ),
        ),
      ),
    );
  }
}
