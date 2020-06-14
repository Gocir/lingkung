import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingkung/providers/partnerProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/menu/home.dart';
import 'package:lingkung/screens/menu/message.dart';
import 'package:lingkung/screens/menu/order.dart';
import 'package:lingkung/screens/menu/profile.dart';
import 'package:lingkung/screens/introduction/splash.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider.value(value: PartnerProvider.initialize()),
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

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

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
        // type: BottomNavigationBarType.fixed,
        //   currentIndex: _currentIndex,
        //   onTap: (index) {
        //     _incrementTab(index);
        //   },
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          _incrementTab(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Beranda'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Riwayat'),
            icon: Icon(Icons.history)
          ),
          BottomNavyBarItem(
            title: Text('Pesan'),
            icon: Icon(Icons.chat_bubble_outline)
          ),
          BottomNavyBarItem(
            title: Text('Saya'),
            icon: Icon(Icons.person_outline)
          ),
        ],
      ),
      
    );
  }
}