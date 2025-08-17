import 'package:flutter/material.dart';
import 'package:flutter_netflix/screen/home_screen.dart';
import 'package:flutter_netflix/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController tabController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'netflix demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(secondary: Colors.white),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Center(child: Text('search')),
              Center(child: Text('save')),
              Center(child: Text('more')),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
 