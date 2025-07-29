import 'package:flutter/material.dart';

void main() {
  runApp(GestureDemoApp());
}

class GestureDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detector Demo',
      home: GestureHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GestureHomePage extends StatefulWidget {
  @override
  _GestureHomePageState createState() => _GestureHomePageState();
}

class _GestureHomePageState extends State<GestureHomePage> {
  String _gestureText = 'Try dragging or double tapping';

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      _gestureText = 'Horizontal Drag End detected!';
    });
  }

  void _onDoubleTap() {
    setState(() {
      _gestureText = 'Double Tap detected!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detection'),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: _onHorizontalDragEnd,
        onDoubleTap: _onDoubleTap,
        child: Center(
          child: Text(
            _gestureText,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(CounterHistoryApp());
}

class CounterHistoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter with History',
      home: CounterHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterHomePage extends StatefulWidget {
  @override
  _CounterHomePageState createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  int _counter = 0;
  List<String> _history = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _history.add('Incremented to $_counter');
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _history.add('Decremented to $_counter');
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _history.add('Reset to 0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Current Counter: $_counter',
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('Decrement'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                ),
              ],
            ),
            Divider(height: 40),
            Text('History:', style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
