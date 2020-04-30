import 'package:flutter/material.dart';
// import 'package:lingkung/screens/onboarding.dart';
import 'package:lingkung/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lingkung',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      //home: MyHomePage(title: 'Lingkung'),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 40.0, bottom: 30.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logos.png',
                  height: 30.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/otentikasi.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 5.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Selamat Datang di Lingkung!',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Solusi untuk lingkunganmu dari sampah dengan Lingkung, pasti bersih dan untung!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 5.0, top: 20.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Text("MASUK",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                        )
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 15.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.lightGreen,
                          width: 3.0),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text("DAFTAR",
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                        )
                      )
                    ),
                  ),
                )
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(16.0, 10.0, 5.0, 10.0),
            //         child: Divider(),
            //       )
            //     ),
            //     Text(
            //       "ATAU",
            //       style: TextStyle(
            //         fontFamily: 'Poppins',
            //         fontSize: 12.0,
            //       ),
            //     ),
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(5.0, 10.0, 16.0, 10.0),
            //         child: Divider(),
            //       )
            //     ),
            //   ]
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(
                        //    builder: (context) => LoginPage(),
                        //  ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Text(
                          "Masuk dengan Facebook",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                          )
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan Layanan dan Kebijakan Privasi.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // child: GestureDetector(
                //   onTap: () {
                //     //  Navigator.push(context, MaterialPageRoute(
                //     //    builder: (context) => LoginPage(),
                //     //  ));
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
