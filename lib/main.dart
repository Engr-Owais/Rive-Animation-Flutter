import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:riveflutter/smiley_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SmileyController _smileyController = SmileyController();
  double _rating = 5.0;
  String _currentDirection = '5+';

  void _onChanged(double value) {
    if (_rating == value) return;
    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      _currentDirection = '${value.round()}$direction';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/happpiness_emoji.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: _currentDirection,
                controller: _smileyController,
              ),
            ),
            Slider(
              onChanged: _onChanged,
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
            ),
            Text(
              '$_rating',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
