import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/qr_create_page.dart';
import 'page/qr_scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark(),
      home: MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> children = [
    QRScanPage(),
    QRCreatePage(),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan QR Code',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Create QR Code',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
