import 'package:animated_opacity_button/animated_opacity_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedOpacityButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AnimatedOpacityButton Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedOpacityButton(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.add),
                  onTap: _incrementCounter,
                ),
                const SizedBox(width: 40),
                AnimatedOpacityButton(
                  padding: EdgeInsets.all(16),
                  child: Text('ADD'),
                  onTap: _incrementCounter,
                ),
                const SizedBox(width: 40),
                AnimatedOpacityButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add),
                        SizedBox(height: 8),
                        Text('ADD'),
                      ],
                    ),
                  ),
                  onTap: _incrementCounter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
