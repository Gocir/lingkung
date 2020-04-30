import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final kTitleStyle = TextStyle(
    color: Colors.lightGreen,
    fontFamily: 'Roboto',
    fontSize: 34.0,
    fontWeight: FontWeight.bold,
  );

  final kSubtitleStyle = TextStyle(
    color: Colors.grey,
    fontFamily: 'Poppins',
    fontSize: 14.0,
  );

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.lightGreen : Colors.lightGreen[100],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 560.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/reduce.png',
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'REDUCE',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Mengurangi penggunaan barang dengan material sekali pakai dan dapat merusak lingkungan.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/reuse.png',
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'REUSE',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Menggunakan kembali barang atau material sisa yang masih bisa dan aman untuk dipakai, dengan fungsi yang lain.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/recycle.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'RECYCLE',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Mendaur ulang atau Mengolah barang tidak terpakai (sampah) menjadi barang yang bermanfaat dan bahkan memiliki nilai jual.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                  ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                        },
                        color: Colors.lightGreen[700],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'LANJUT',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        color: Colors.lightGreen[700],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'MULAI',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class Onboarding extends StatelessWidget {

//   final pageDecoration = PageDecoration(
//     titleTextStyle:PageDecoration().titleTextStyle.copyWith(
//       color: Colors.lightGreen,
//       fontFamily: 'Roboto',
//       fontSize: 34.0),
//     bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(
//       color: Colors.grey,
//       fontFamily: 'Poppins',
//       fontSize: 14.0),
//     contentPadding: const EdgeInsets.all(20),
//   );

//   List<PageViewModel> getPages() {
//     return [
//       PageViewModel(
//         image: Container(margin: EdgeInsets.only(top: 70), child: Image.asset("assets/images/reduce.png"),),
//         title: "REDUCE",
//         body: "Mengurangi penggunaan barang dengan material sekali pakai dan dapat merusak lingkungan.",
//         decoration: pageDecoration
//       ),
//       PageViewModel(
//         image: Container(padding: EdgeInsets.fromLTRB(0, 60, 0, 0), child: Image.asset("assets/images/reuse.png"),),
//         title: "REUSE",
//         body: "Menggunakan kembali barang atau material sisa yang masih bisa dan aman untuk dipakai, dengan fungsi yang lain.",
//         decoration: pageDecoration
//       ),
//       PageViewModel(
//         image: Container(padding: EdgeInsets.fromLTRB(0, 60, 0, 0), child: Image.asset("assets/images/recycle.png"),),
//         title: "RECYCLE",
//         body: "Mendaur ulang atau Mengolah barang tidak terpakai (sampah) menjadi barang yang bermanfaat dan bahkan memiliki nilai jual.",
//         decoration: pageDecoration
//       ),
//     ];
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroductionScreen(
//         pages: getPages(),
//         onDone: () {
//         },
//         next: const Text(
//           'LANJUT',
//           style: TextStyle(
//             color: Colors.lightGreen,
//             fontFamily: 'Roboto',
//             fontSize: 16,
//             fontWeight: FontWeight.bold),
//         ),
//         done: RaisedButton(
//           padding: EdgeInsets.all(15),
//           color: Colors.lightGreen[700],
//           textColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50)
//           ),
//           child: Text(
//             'MULAI',
//             style: TextStyle(
//               fontFamily: 'Roboto',
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//           ),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, '/home');
//           },
//         ),
//         dotsDecorator: DotsDecorator(
//           size: const Size.square(8.0),
//           activeSize: const Size(10.0, 10.0),
//           activeColor: Colors.lightGreen,
//           color: Colors.lightGreen[100],
//           spacing: const EdgeInsets.symmetric(horizontal: 3.0),
//         ),
//       ),
//     );
//   }
// }