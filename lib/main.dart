import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/providers/trashReceiveProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/introduction/splash.dart';
import 'package:lingkung/screens/menu/home.dart';
import 'package:lingkung/screens/menu/message.dart';
import 'package:lingkung/screens/menu/order.dart';
import 'package:lingkung/screens/menu/profile.dart';
import 'package:lingkung/utilities/colorStyle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
        ChangeNotifierProvider.value(value: PartnerProvider.initialize()),
        ChangeNotifierProvider.value(value: TrashReceiveProvider.initialize())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lingkung',
        home: Splash(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    OrderPage(),
    MessagePage(),
    ProfilePage()
  ];

  void _incrementTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 10.0,
        curve: Curves.easeInBack,
        onItemSelected: (index) {
          _incrementTab(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Beranda',
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w700)),
              icon: Icon(Icons.home),
              activeColor: green,
              inactiveColor: grey,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              title: Text('Riwayat',
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w700)),
              icon: Icon(Icons.history),
              activeColor: green,
              inactiveColor: grey,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              title: Text('Pesan',
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w700)),
              icon: Icon(Icons.chat_bubble_outline),
              activeColor: green,
              inactiveColor: grey,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              title: Text('Saya',
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w700)),
              icon: Icon(Icons.person_outline),
              activeColor: green,
              inactiveColor: grey,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
