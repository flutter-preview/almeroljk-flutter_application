import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool alignmentEnd = false;
  bool showAdditionalContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        alignmentEnd = !alignmentEnd;
                      },
                    );
                  },
                  child: Text('A'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showAdditionalContainer = !showAdditionalContainer;
                    });
                  },
                  child: Text('B'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: alignmentEnd
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  color: Colors.red,
                ),
                Container(
                  height: 90,
                  color: Colors.green,
                ),
                Container(
                  height: 90,
                  color: Colors.blue,
                ),
                if (showAdditionalContainer)
                  Container(
                    height: 90,
                    color: Colors.yellow,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
