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
  int alignmentIndex = 0;
  bool showAdditionalContainer = false;

  void cycleAlignment() {
    setState(
      () {
        alignmentIndex = (alignmentIndex + 1) % 6;
      },
    );
  }

  MainAxisAlignment getMainAxisAlignment() {
    switch (alignmentIndex) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.center;
      case 2:
        return MainAxisAlignment.spaceAround;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceEvenly;
      case 5:
        return MainAxisAlignment.end;
      default:
        return MainAxisAlignment.start;
    }
  }

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
                    setState(() {
                      cycleAlignment();
                    });
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
              mainAxisAlignment: getMainAxisAlignment(),
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
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
