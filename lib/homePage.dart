import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final ImageProvider grass2;
  final ImageProvider fightcorona;
  final ImageProvider news;
  final ImageProvider reduce;
  final ImageProvider grass1;
  final ImageProvider user;
  final ImageProvider bohlilin;
  final ImageProvider bamboostraw;
  final ImageProvider tumblr;
  HomePage({
    Key key,
    this.grass2 = const AssetImage('assets/images/grass2.png'),
    this.fightcorona = const AssetImage('assets/images/fightcorona.png'),
    this.news = const AssetImage('assets/images/news.png'),
    this.reduce = const AssetImage('assets/images/reduce.png'),
    this.grass1 = const AssetImage('assets/images/grass1.png'),
    this.user = const AssetImage('assets/images/user.png'),
    this.bohlilin = const AssetImage('assets/images/bohlilin.jpg'),
    this.bamboostraw = const AssetImage('assets/images/bamboostraw.png'),
    this.tumblr = const AssetImage('assets/images/tumblr.png'),
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9bc53d),
      body: Stack(
        children: <Widget>[
          //grass
          Transform.translate(
            offset: Offset(-14.23, 36.85),
            child:
                // Adobe XD layer: 'grass1' (shape)
                Container(
              width: 118.0,
              height: 115.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: grass1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(280.63, -20.93),
            child:
                // Adobe XD layer: 'grass2' (shape)
                Container(
              width: 133.0,
              height: 149.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: grass2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //
          Transform.translate(
            offset: Offset(16.0, 71.67),
            child: Text(
              'Hai, Gocir Ngapusi!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
                height: 0.5555555555555556,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 88.67),
            child: Text(
              'Sudah kumpul dan pilah sampahmu?',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(284.0, 54.0),
            child:
                // Adobe XD layer: 'user' (shape)
                Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: user,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //container Background
          Transform.translate(
            offset: Offset(0.0, 230.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(136.51, 126.56),
            child: SvgPicture.string(
              _shapeSVG_9a6d3092cda843a08ac983c4144218b3,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 466.0),
            child: Text(
              'Beli produk ramah lingkungan',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 688.0),
            child: Text(
              'Konten untukmu',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(293.0, 464.0),
            child: Text(
              'Lihat lainnya',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0x80707070),
                height: 1.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(354.8, 472.46),
            child:
                // Adobe XD layer: 'next (1)' (group)
                SvgPicture.string(
              _shapeSVG_a106a81eeb524bb195ff0b0b9d6b6a7c,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          //
          Transform.translate(
            offset: Offset(16.5, 498.0),
            child: Container(
              width: 117.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 498.0),
            child: Container(
              width: 118.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 623.85),
            child: Text(
              'Sedotan Bambu 2 Set',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 636.85),
            child: Text(
              'Rp 35.000',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xfffde74c),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(88.0, 638.85),
            child: Text(
              '20 Terjual',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 8,
                color: const Color(0x80707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(149.5, 498.0),
            child: Container(
              width: 117.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          //
          Transform.translate(
            offset: Offset(149.5, 498.0),
            child: Container(
              width: 117.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(159.0, 636.85),
            child: Text(
              'Rp 15.000',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xfffde74c),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(159.0, 623.85),
            child: Text(
              'Lilin Bohlam Mini Uk..',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 717.0),
            child: Container(
              width: 343.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(176.42, 12.43),
            child: SvgPicture.string(
              _shapeSVG_e73921fb27734ce1ba689a519108ed3e,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(284.0, 54.0),
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(304.96, 278.3),
            child: SvgPicture.string(
              _shapeSVG_ac1149b773114a639b3ea8053a2a59d2,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 144.3),
            child: Container(
              width: 343.0,
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 20)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 144.0),
            child:
                // Adobe XD layer: 'reduce' (shape)
                Container(
              width: 147.0,
              height: 140.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: reduce,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(136.0, 177.3),
            child: SizedBox(
              width: 208.0,
              height: 52.0,
              child: SingleChildScrollView(
                  child: Text(
                'Kumpulkan sampahmu & dapatkan poinnya',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
          Transform.translate(
            offset: Offset(174.0, 743.0),
            child: SizedBox(
              width: 170.0,
              height: 51.0,
              child: SingleChildScrollView(
                  child: Text(
                'Berita hangat dan terbaru seputar lingkungan untuk kamu',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 852.0),
            child: Container(
              width: 343.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(164.0, 870.0),
            child: SizedBox(
              width: 180.0,
              height: 35.0,
              child: SingleChildScrollView(
                  child: Text(
                'Langkah-langkah untuk memerangi Corona',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
          //
          Transform.translate(
            offset: Offset(137.5, 329.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffcccccc)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(152.5, 383.52),
            child: Text(
              'Daur \nUlang',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
                height: 1.1428571428571428,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(188.0, 345.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
                color: const Color(0xff9bc53d),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(211.0, 335.0),
            child: Container(
              width: 13.0,
              height: 13.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(6.5, 6.5)),
                color: const Color(0xfffde74c),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(215.0, 357.0),
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                color: const Color(0xff5bc0eb),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(192.0, 339.0),
            child: SvgPicture.string(
              _shapeSVG_7b7dd6d6fa96478989879f24e4ca29a6,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          //
          Transform.translate(
            offset: Offset(259.0, 329.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffcccccc)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(274.5, 383.52),
            child: Text(
              'Bank \nSampah',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
                height: 1.1428571428571428,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(327.0, 356.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
                color: const Color(0xff5bc0eb),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(331.0, 335.0),
            child: Container(
              width: 13.0,
              height: 13.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(6.5, 6.5)),
                color: const Color(0xff9bc53d),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(310.0, 344.0),
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                color: const Color(0xfffde74c),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(314.0, 339.0),
            child:
                // Adobe XD layer: 'bank' (group)
                SvgPicture.string(
              _shapeSVG_50ceff6aaa9e4db5b82176aa9975e1b9,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(314.0, 339.0),
            child:
                // Adobe XD layer: 'bank' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: Stack(
                    children: <Widget>[],
                  ),
                ),
              ],
            ),
          ),
          //
          Transform.translate(
            offset: Offset(16.0, 329.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffcccccc)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(31.0, 383.52),
            child: Text(
              'Jual \nSampah',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
                height: 1.1428571428571428,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(56.0, 334.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
                color: const Color(0xfffde74c),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(89.0, 346.0),
            child: Container(
              width: 13.0,
              height: 13.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(6.5, 6.5)),
                color: const Color(0xff5bc0eb),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(72.0, 361.0),
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(4.0, 4.0)),
                color: const Color(0xff9bc53d),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(57.84, 339.0),
            child: SvgPicture.string(
              _shapeSVG_3f18c9912a5b4853abc1fb0b29ace02f,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          //
          Transform.translate(
            offset: Offset(16.0, 852.0),
            child:
                // Adobe XD layer: 'fightcorona' (shape)
                Container(
              width: 152.0,
              height: 110.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: fightcorona,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 719.0),
            child:
                // Adobe XD layer: 'news' (shape)
                Container(
              width: 124.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: news,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 940.0),
            child: Container(
              width: 375.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, -8),
                      blurRadius: 20)
                ],
              ),
            ),
          ),
          //
          Transform.translate(
            offset: Offset(34.0, 955.0),
            child: SvgPicture.string('assets/icons/homeactive.svg'
            ),
          ),
          Transform.translate(
            offset: Offset(29.5, 975.0),
            child: Text(
              'Beranda',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
                height: 2.25,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(321.0, 955.0),
            child:
                // Adobe XD layer: 'user' (group)
                SvgPicture.string('assets/icons/profile.svg'
            ),
          ),
          Transform.translate(
            offset: Offset(321.5, 974.85),
            child: Text(
              'Saya',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: const Color(0xffaaaaaa),
                height: 2.25,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(225.5, 974.85),
            child: Text(
              'Pesan',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: const Color(0xffaaaaaa),
                height: 2.25,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(226.0, 955.0),
            child:
                // Adobe XD layer: 'messenger' (shape)
                SvgPicture.string('assets/icons/message.svg'
            ),
          ),
          Transform.translate(
            offset: Offset(123.5, 974.85),
            child: Text(
              'Pesanan',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: const Color(0xffaaaaaa),
                height: 2.25,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(130.0, 955.0),
            child: SvgPicture.string('assets/icons/order.svg'
            ),
          ),
          Transform.translate(
            offset: Offset(282.0, 498.0),
            child: Container(
              width: 117.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          //Product Bohlam
          Transform.translate(
            offset: Offset(149.5, 498.0),
            child:
                // Adobe XD layer: 'daur-ulang-barang-b…' (shape)
                Container(
              width: 117.0,
              height: 117.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: bohlilin,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //Product Sedotan
          Transform.translate(
            offset: Offset(16.0, 498.0),
            child:
                // Adobe XD layer: 'Bamboo-Straw-Set-2-…' (shape)
                Container(
              width: 118.0,
              height: 118.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: bamboostraw,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //Product Tumblr
          Transform.translate(
            offset: Offset(282.0, 498.0),
            child: Container(
              width: 117.0,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(282.0, 498.0),
            child:
                // Adobe XD layer: 'tumblr' (shape)
                Container(
              width: 117.0,
              height: 117.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: tumblr,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(354.0, 638.85),
            child: Text(
              '20 Terjual',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 8,
                color: const Color(0x80707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(292.0, 636.85),
            child: Text(
              'Rp 75.000',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xfffde74c),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(292.0, 623.85),
            child: Text(
              'Tumbler Hitam Dop ..',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_9a6d3092cda843a08ac983c4144218b3 =
    '<svg viewBox="136.5 126.6 48.1 21.9" ><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 582.24, 574.68)" d="M 555.5736083984375 228.9559478759766 C 555.0429077148438 229.6883087158203 554.6325073242188 230.4981079101563 555.0491333007813 231.3740844726563 C 555.2680053710938 231.8344879150391 555.9219970703125 231.9557037353516 556.3345947265625 231.7112426757813 C 556.951904296875 231.3455810546875 557.117919921875 230.6508941650391 557.5213012695313 230.0947265625 C 558.3768310546875 228.9151916503906 556.4191284179688 227.7916717529297 555.5736083984375 228.9559478759766 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 556.62, 576.63)" d="M 555.7704467773438 233.5794677734375 C 555.7948608398438 233.8086395263672 555.7490234375 234.0887451171875 555.7113647460938 234.2894134521484 C 555.5513916015625 235.1409759521484 556.2532348632813 236.0770416259766 557.197509765625 235.7755737304688 C 558.2191162109375 235.4496002197266 558.7040405273438 234.6398162841797 558.6693725585938 233.5794677734375 C 558.6082763671875 231.6869049072266 555.5728149414063 231.7510833740234 555.7704467773438 233.5794677734375 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 588.0, 582.24)" d="M 551.8204956054688 235.1409912109375 C 550.7876586914063 235.1409912109375 550.2386474609375 236.0780944824219 550.396484375 237.0101165771484 C 550.4942016601563 237.5835876464844 550.6673583984375 237.9859466552734 551.0228881835938 238.4453125 C 551.3671875 238.8904724121094 552.2737426757813 238.8904724121094 552.6180419921875 238.4453125 C 552.9735717773438 237.9859466552734 553.1466674804688 237.5835876464844 553.2445068359375 237.0101165771484 C 553.40234375 236.0780944824219 552.8533325195313 235.1409912109375 551.8204956054688 235.1409912109375 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 591.51, 576.78)" d="M 553.7664794921875 241.0331115722656 C 553.59326171875 241.4792633056641 553.5108032226563 241.7858581542969 553.6300048828125 242.2625732421875 C 553.7858276367188 242.8890228271484 554.449951171875 243.0326232910156 554.970458984375 242.8085327148438 C 555.4053955078125 242.6211090087891 555.5867309570313 242.2880401611328 555.8271484375 241.9019775390625 C 556.6705322265625 240.5523376464844 554.3745727539063 239.4624481201172 553.7664794921875 241.0331115722656 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 578.57, 586.29)" d="M 564.3889770507813 230.3609313964844 L 564.364501953125 230.2468414306641 C 564.257568359375 229.737548828125 563.7726440429688 229.4849243164063 563.3031005859375 229.4380645751953 C 563.126953125 229.4207458496094 562.9405517578125 229.4727020263672 562.7755126953125 229.5328063964844 C 561.8546752929688 228.9338531494141 560.76171875 230.2203521728516 561.2985229492188 231.1085662841797 C 561.9403076171875 232.1689300537109 563.0983276367188 232.4235687255859 564.0609741210938 231.6025848388672 C 564.4144287109375 231.3021087646484 564.4786376953125 230.7866973876953 564.3889770507813 230.3609313964844 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 577.33, 576.21)" d="M 566.82666015625 227.0349273681641 C 566.241943359375 225.9837188720703 565.0797729492188 225.8818664550781 563.9970092773438 226.0784606933594 C 563.3919067382813 226.1884613037109 563.057861328125 226.9137115478516 563.2095947265625 227.4657897949219 C 563.3828125 228.0973205566406 563.9918823242188 228.3631744384766 564.595947265625 228.253173828125 C 565.0430297851563 228.1716766357422 565.5635986328125 228.3886413574219 566.0148315429688 228.4487457275391 C 566.7593994140625 228.5485534667969 567.13427734375 227.5900726318359 566.82666015625 227.0349273681641 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 586.16, 571.13)" d="M 571.2089233398438 230.071044921875 C 570.8513793945313 229.7389678955078 570.4754638671875 229.5770111083984 570.0660400390625 229.3386688232422 C 568.5075073242188 228.4290466308594 567.1029052734375 230.8421325683594 568.6572875976563 231.7486877441406 C 569.4354248046875 232.2029724121094 570.164794921875 232.3527069091797 570.974609375 231.8841400146484 C 571.60302734375 231.5215148925781 571.7559204101563 230.5792999267578 571.2089233398438 230.071044921875 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.913545, -0.406737, 0.406737, -0.913545, 570.44, 587.75)" d="M 574.4243774414063 227.6930847167969 C 573.6074829101563 227.610595703125 572.9210205078125 228.438720703125 572.9210205078125 229.1965484619141 C 572.9210205078125 230.0776214599609 573.6095581054688 230.6174774169922 574.4243774414063 230.6999969482422 C 574.5640258789063 230.7132415771484 574.8706665039063 230.8324127197266 575.112060546875 230.8018493652344 C 575.6497802734375 230.7325897216797 576.2039184570313 230.4698028564453 576.3281860351563 229.8749237060547 C 576.6062622070313 228.5456390380859 575.6355590820313 227.8142852783203 574.4243774414063 227.6930847167969 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _shapeSVG_a106a81eeb524bb195ff0b0b9d6b6a7c =
    '<svg viewBox="354.8 472.5 4.2 7.0" ><g transform="translate(343.63, 472.46)"><path transform="translate(0.0, 0.0)" d="M 15.16989898681641 3.004274368286133 C 15.13473033905029 2.968855142593384 15.09579372406006 2.938962459564209 15.05534934997559 2.912964105606079 L 12.34127140045166 0.1990099996328354 C 12.07638263702393 -0.06562808156013489 11.6470832824707 -0.06575367599725723 11.38206768035889 0.1991355866193771 C 11.11718082427979 0.4638992547988892 11.11718082427979 0.8933238983154297 11.38206768035889 1.158338665962219 L 13.71960067749023 3.495619297027588 L 11.37026214599609 5.845208644866943 C 11.10524845123291 6.109846115112305 11.10524845123291 6.539397239685059 11.37026214599609 6.8044114112854 C 11.50276851654053 6.936668872833252 11.67622184753418 7.00285816192627 11.84967422485352 7.00285816192627 C 12.02312755584717 7.00285816192627 12.19695663452148 6.936668872833252 12.32908725738525 6.804161548614502 L 15.05534934997559 4.078275680541992 C 15.09579181671143 4.052276134490967 15.13460063934326 4.022509098052979 15.16989898681641 3.986965417861938 C 15.30554389953613 3.851317644119263 15.37060260772705 3.6732177734375 15.36758995056152 3.495619535446167 C 15.37073135375977 3.317896366119385 15.30554389953613 3.13954496383667 15.16989898681641 3.004274368286133 Z" fill="#9bc53d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
const String _shapeSVG_e73921fb27734ce1ba689a519108ed3e =
    '<svg viewBox="176.4 12.4 194.9 189.4" ><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 467.66, 569.57)" d="M 555.5736083984375 228.9559478759766 C 555.0429077148438 229.6883087158203 554.6325073242188 230.4981079101563 555.0491333007813 231.3740844726563 C 555.2680053710938 231.8344879150391 555.9219970703125 231.9557037353516 556.3345947265625 231.7112426757813 C 556.951904296875 231.3455810546875 557.117919921875 230.6508941650391 557.5213012695313 230.0947265625 C 558.3768310546875 228.9151916503906 556.4191284179688 227.7916717529297 555.5736083984375 228.9559478759766 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 442.69, 563.51)" d="M 555.7704467773438 233.5794677734375 C 555.7948608398438 233.8086395263672 555.7490234375 234.0887451171875 555.7113647460938 234.2894134521484 C 555.5513916015625 235.1409759521484 556.2532348632813 236.0770416259766 557.197509765625 235.7755737304688 C 558.2191162109375 235.4496002197266 558.7040405273438 234.6398162841797 558.6693725585938 233.5794677734375 C 558.6082763671875 231.6869049072266 555.5728149414063 231.7510833740234 555.7704467773438 233.5794677734375 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 470.8, 578.54)" d="M 551.8204956054688 235.1409912109375 C 550.7876586914063 235.1409912109375 550.2386474609375 236.0780944824219 550.396484375 237.0101165771484 C 550.4942016601563 237.5835876464844 550.6673583984375 237.9859466552734 551.0228881835938 238.4453125 C 551.3671875 238.8904724121094 552.2737426757813 238.8904724121094 552.6180419921875 238.4453125 C 552.9735717773438 237.9859466552734 553.1466674804688 237.5835876464844 553.2445068359375 237.0101165771484 C 553.40234375 236.0780944824219 552.8533325195313 235.1409912109375 551.8204956054688 235.1409912109375 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 475.82, 574.43)" d="M 553.7664794921875 241.0331115722656 C 553.59326171875 241.4792633056641 553.5108032226563 241.7858581542969 553.6300048828125 242.2625732421875 C 553.7858276367188 242.8890228271484 554.449951171875 243.0326232910156 554.970458984375 242.8085327148438 C 555.4053955078125 242.6211090087891 555.5867309570313 242.2880401611328 555.8271484375 241.9019775390625 C 556.6705322265625 240.5523376464844 554.3745727539063 239.4624481201172 553.7664794921875 241.0331115722656 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 460.58, 579.48)" d="M 564.3889770507813 230.3609313964844 L 564.364501953125 230.2468414306641 C 564.257568359375 229.737548828125 563.7726440429688 229.4849243164063 563.3031005859375 229.4380645751953 C 563.126953125 229.4207458496094 562.9405517578125 229.4727020263672 562.7755126953125 229.5328063964844 C 561.8546752929688 228.9338531494141 560.76171875 230.2203521728516 561.2985229492188 231.1085662841797 C 561.9403076171875 232.1689300537109 563.0983276367188 232.4235687255859 564.0609741210938 231.6025848388672 C 564.4144287109375 231.3021087646484 564.4786376953125 230.7866973876953 564.3889770507813 230.3609313964844 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 462.51, 569.5)" d="M 566.82666015625 227.0349273681641 C 566.241943359375 225.9837188720703 565.0797729492188 225.8818664550781 563.9970092773438 226.0784606933594 C 563.3919067382813 226.1884613037109 563.057861328125 226.9137115478516 563.2095947265625 227.4657897949219 C 563.3828125 228.0973205566406 563.9918823242188 228.3631744384766 564.595947265625 228.253173828125 C 565.0430297851563 228.1716766357422 565.5635986328125 228.3886413574219 566.0148315429688 228.4487457275391 C 566.7593994140625 228.5485534667969 567.13427734375 227.5900726318359 566.82666015625 227.0349273681641 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 472.49, 567.4)" d="M 571.2089233398438 230.071044921875 C 570.8513793945313 229.7389678955078 570.4754638671875 229.5770111083984 570.0660400390625 229.3386688232422 C 568.5075073242188 228.4290466308594 567.1029052734375 230.8421325683594 568.6572875976563 231.7486877441406 C 569.4354248046875 232.2029724121094 570.164794921875 232.3527069091797 570.974609375 231.8841400146484 C 571.60302734375 231.5215148925781 571.7559204101563 230.5792999267578 571.2089233398438 230.071044921875 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(-0.743145, -0.669131, 0.669131, -0.743145, 452.4, 578.36)" d="M 574.4243774414063 227.6930847167969 C 573.6074829101563 227.610595703125 572.9210205078125 228.438720703125 572.9210205078125 229.1965484619141 C 572.9210205078125 230.0776214599609 573.6095581054688 230.6174774169922 574.4243774414063 230.6999969482422 C 574.5640258789063 230.7132415771484 574.8706665039063 230.8324127197266 575.112060546875 230.8018493652344 C 575.6497802734375 230.7325897216797 576.2039184570313 230.4698028564453 576.3281860351563 229.8749237060547 C 576.6062622070313 228.5456390380859 575.6355590820313 227.8142852783203 574.4243774414063 227.6930847167969 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(0.017452, -0.999848, 0.999848, 0.017452, 124.42, 739.64)" d="M 555.5736083984375 228.9559478759766 C 555.0429077148438 229.6883087158203 554.6325073242188 230.4981079101563 555.0491333007813 231.3740844726563 C 555.2680053710938 231.8344879150391 555.9219970703125 231.9557037353516 556.3345947265625 231.7112426757813 C 556.951904296875 231.3455810546875 557.117919921875 230.6508941650391 557.5213012695313 230.0947265625 C 558.3768310546875 228.9151916503906 556.4191284179688 227.7916717529297 555.5736083984375 228.9559478759766 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(0.017452, -0.999848, 0.999848, 0.017452, 112.61, 716.82)" d="M 555.7704467773438 233.5794677734375 C 555.7948608398438 233.8086395263672 555.7490234375 234.0887451171875 555.7113647460938 234.2894134521484 C 555.5513916015625 235.1409759521484 556.2532348632813 236.0770416259766 557.197509765625 235.7755737304688 C 558.2191162109375 235.4496002197266 558.7040405273438 234.6398162841797 558.6693725585938 233.5794677734375 C 558.6082763671875 231.6869049072266 555.5728149414063 231.7510833740234 555.7704467773438 233.5794677734375 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(0.017452, -0.999848, 0.999848, 0.017452, 121.09, 735.71)" d="M 566.82666015625 227.0349273681641 C 566.241943359375 225.9837188720703 565.0797729492188 225.8818664550781 563.9970092773438 226.0784606933594 C 563.3919067382813 226.1884613037109 563.057861328125 226.9137115478516 563.2095947265625 227.4657897949219 C 563.3828125 228.0973205566406 563.9918823242188 228.3631744384766 564.595947265625 228.253173828125 C 565.0430297851563 228.1716766357422 565.5635986328125 228.3886413574219 566.0148315429688 228.4487457275391 C 566.7593994140625 228.5485534667969 567.13427734375 227.5900726318359 566.82666015625 227.0349273681641 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(0.017452, -0.999848, 0.999848, 0.017452, 129.22, 741.86)" d="M 571.2089233398438 230.071044921875 C 570.8513793945313 229.7389678955078 570.4754638671875 229.5770111083984 570.0660400390625 229.3386688232422 C 568.5075073242188 228.4290466308594 567.1029052734375 230.8421325683594 568.6572875976563 231.7486877441406 C 569.4354248046875 232.2029724121094 570.164794921875 232.3527069091797 570.974609375 231.8841400146484 C 571.60302734375 231.5215148925781 571.7559204101563 230.5792999267578 571.2089233398438 230.071044921875 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="matrix(0.017452, -0.999848, 0.999848, 0.017452, 119.71, 747.9)" d="M 551.8204956054688 235.1409912109375 C 550.7876586914063 235.1409912109375 550.2386474609375 236.0780944824219 550.396484375 237.0101165771484 C 550.4942016601563 237.5835876464844 550.6673583984375 237.9859466552734 551.0228881835938 238.4453125 C 551.3671875 238.8904724121094 552.2737426757813 238.8904724121094 552.6180419921875 238.4453125 C 552.9735717773438 237.9859466552734 553.1466674804688 237.5835876464844 553.2445068359375 237.0101165771484 C 553.40234375 236.0780944824219 552.8533325195313 235.1409912109375 551.8204956054688 235.1409912109375 Z" fill="#fde74c" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _shapeSVG_ac1149b773114a639b3ea8053a2a59d2 =
    '<svg viewBox="305.0 278.3 39.0 6.0" ><path transform="translate(-277.54, -114.14)" d="M 588.4993896484375 395.4402160644531 C 588.4993896484375 397.0948791503906 587.156005859375 398.4384765625 585.501220703125 398.4384765625 C 583.8436889648438 398.4384765625 582.5031127929688 397.0948791503906 582.5031127929688 395.4402160644531 C 582.5031127929688 393.7826843261719 583.8436889648438 392.4420166015625 585.501220703125 392.4420166015625 C 587.156005859375 392.4420166015625 588.4993896484375 393.7826843261719 588.4993896484375 395.4402160644531 Z" fill="#9bc53d" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(-270.23, -114.14)" d="M 597.7061767578125 395.4402160644531 C 597.7061767578125 397.0948791503906 596.3629150390625 398.4384765625 594.7080688476563 398.4384765625 C 593.050537109375 398.4384765625 591.7099609375 397.0948791503906 591.7099609375 395.4402160644531 C 591.7099609375 393.7826843261719 593.050537109375 392.4420166015625 594.7080688476563 392.4420166015625 C 596.3629150390625 392.4420166015625 597.7061767578125 393.7826843261719 597.7061767578125 395.4402160644531 Z" fill="#9bc53d" stroke="#99c33c" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-262.91, -114.14)" d="M 606.9133911132813 395.4402160644531 C 606.9133911132813 397.0948791503906 605.5726928710938 398.4384765625 603.9151611328125 398.4384765625 C 602.2605590820313 398.4384765625 600.9169921875 397.0948791503906 600.9169921875 395.4402160644531 C 600.9169921875 393.7826843261719 602.2605590820313 392.4420166015625 603.9151611328125 392.4420166015625 C 605.5726928710938 392.4420166015625 606.9133911132813 393.7826843261719 606.9133911132813 395.4402160644531 Z" fill="#9bc53d" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _shapeSVG_7b7dd6d6fa96478989879f24e4ca29a6 =
    '<svg viewBox="192.0 339.0 30.9 30.0" ><g transform="translate(20.0, -1.0)"><path transform="translate(172.0, 332.59)" d="M 10.72372055053711 29.85098648071289 L 5.931884288787842 29.85098648071289 L 7.569387912750244 27.01481628417969 C 8.787785530090332 27.64830017089844 10.20246410369873 26.5523853302002 9.874286651611328 25.20269393920898 L 8.905022621154785 21.21654510498047 C 8.68804931640625 20.3240909576416 7.771097183227539 19.79185485839844 6.886486053466797 20.05112648010254 L 2.611441612243652 21.30397415161133 C 1.377174496650696 21.66563987731934 1.180171728134155 23.32794570922852 2.291953802108765 23.96981430053711 L 2.532037734985352 24.10841369628906 L 0.7696948647499084 27.16095542907715 C -1.412055134773254 30.93984222412109 1.311104774475098 35.66664123535156 5.680458068847656 35.66669845581055 L 10.72378253936768 35.66669845581055 C 12.33075523376465 35.6666374206543 13.6316967010498 34.36618041992188 13.63163661956787 32.75884628295898 C 13.6315746307373 31.15174865722656 12.33105850219727 29.85092926025391 10.72372150421143 29.85099029541016 Z M 1.553420066833496 27.61342430114746 L 3.54202938079834 24.16898727416992 C 3.666928291320801 23.95267677307129 3.592833518981934 23.67578506469727 3.376402616500854 23.55082702636719 L 2.744364976882935 23.18597030639648 C 2.321458339691162 22.94178199768066 2.397121667861938 22.3098030090332 2.865824460983276 22.1724739074707 C 7.319408893585205 20.87756538391113 7.153178691864014 20.89072036743164 7.340888500213623 20.89072036743164 C 7.646378993988037 20.89072036743164 7.944205284118652 21.09635162353516 8.025480270385742 21.43037986755371 L 8.994744300842285 25.41653060913086 C 9.141966819763184 26.02202033996582 8.495207786560059 26.50622940063477 7.955729007720947 26.19476699829102 L 7.629060745239258 26.00615119934082 C 7.412569522857666 25.88113212585449 7.135800361633301 25.95534515380859 7.01090145111084 26.17178153991699 C 4.417648315429688 30.66337394714355 4.239711761474609 30.97164154052734 4.216362476348877 31.01212882995605 C 3.531348705291748 32.19861221313477 3.701440572738647 33.63645553588867 4.596066951751709 34.63999176025391 C 1.565486907958984 33.9472541809082 -0.08499001711606979 30.45122718811035 1.553419232368469 27.61342430114746 Z M 10.72372055053711 34.76156616210938 C 10.71581649780273 34.76156616210938 6.834415435791016 34.76156616210938 6.903681755065918 34.76156616210938 C 5.212296485900879 34.76156616210938 4.153430938720703 32.93134689331055 5.000209331512451 31.46465682983398 L 5.431442737579346 30.71767425537109 C 5.653003215789795 30.79074478149414 5.375087738037109 30.74114608764648 10.72372055053711 30.75605010986328 C 11.83067512512207 30.75605010986328 12.7265100479126 31.65176200866699 12.7265100479126 32.75883865356445 C 12.72657108306885 33.86555862426758 11.83073711395264 34.76156616210938 10.72372150421143 34.76156616210938 Z M 17.50241470336914 19.10683822631836 C 21.58413696289063 20.2807674407959 21.49067497253418 20.32656288146973 21.89560127258301 20.32656288146973 C 22.59255981445313 20.32656288146973 23.27232551574707 19.85725975036621 23.45774078369141 19.09507179260254 L 24.51033592224121 14.76632881164551 C 24.8141975402832 13.51661396026611 23.47294807434082 12.5147066116333 22.36134910583496 13.15676021575928 L 22.12126350402832 13.29535579681396 L 20.35892105102539 10.24281215667725 C 18.17843818664551 6.46615743637085 12.72204208374023 6.458856105804443 10.53733539581299 10.24281215667725 C 9.793191909790039 11.5316858291626 8.927766799926758 13.03053569793701 8.431249618530273 13.89058780670166 C 8.306290626525879 14.10701942443848 8.832978248596191 13.59999942779541 9.049407958984375 13.72495937347412 C 9.265778541564941 13.8499174118042 9.090015411376953 14.55955123901367 9.215034484863281 14.34311962127686 L 10.70966053009033 11.75439262390137 C 11.55547428131104 10.2900562286377 13.66970539093018 10.28800487518311 14.5164852142334 11.75469303131104 L 14.94777774810791 12.50173568725586 C 14.77436828613281 12.6564998626709 14.88931179046631 12.55525398254395 12.26836204528809 17.06573486328125 C 11.71621227264404 18.02208518981934 10.48876285552979 18.35086631774902 9.532530784606934 17.79877853393555 C 8.573948860168457 17.24541854858398 8.246011734008789 16.02165031433105 8.799489974975586 15.06288528442383 L 9.215034484863281 14.34311962127686 C 9.339994430541992 14.12668704986572 9.265839576721191 13.84991931915283 9.049407958984375 13.72495937347412 C 8.832977294921875 13.59993934631348 8.556208610534668 13.67409324645996 8.431248664855957 13.89058399200439 L 8.015703201293945 14.61035346984863 C 7.2122483253479 16.00204086303711 7.688009738922119 17.77898597717285 9.080060958862305 18.58256340026855 C 10.46854972839355 19.38426780700684 12.25056457519531 18.90681838989258 13.05226898193359 17.51820373535156 L 15.44821929931641 13.36836338043213 L 17.08572578430176 16.20453453063965 C 15.92723941802979 16.9433708190918 16.17004203796387 18.71633148193359 17.50241470336914 19.10683441162109 Z M 15.30015277862549 11.30222225189209 C 14.35068035125732 9.657657623291016 12.6068000793457 9.749069213867188 12.61283302307129 9.750758171081543 C 12.7083044052124 9.741475105285645 12.17713642120361 9.773868560791016 11.96842670440674 9.817190170288086 C 14.08332443237305 7.53926420211792 17.93618583679199 7.857061386108398 19.57501411437988 10.69540691375732 L 21.56362342834473 14.1398458480835 C 21.68858337402344 14.35633373260498 21.96547317504883 14.43049049377441 22.18178367614746 14.30546951293945 L 22.81381988525391 13.94060802459717 C 23.23697090148926 13.6964225769043 23.74615669250488 14.07811832427979 23.63079452514648 14.5525541305542 L 22.57820320129395 18.88129615783691 C 22.4831714630127 19.27228355407715 22.08132362365723 19.50561141967773 21.69371223449707 19.39199447631836 L 17.75698280334473 18.23833847045898 C 17.15916061401367 18.06318092346191 17.06291770935059 17.2608699798584 17.60251808166504 16.94940567016602 L 17.92918586730957 16.76084899902344 C 18.14543724060059 16.63601112365723 18.2198314666748 16.35906410217285 18.09481239318848 16.14263153076172 C 17.02116584777832 14.28308486938477 16.27701759338379 12.99421405792236 15.30015277862549 11.30222225189209 Z M 30.12644386291504 27.16089248657227 C 30.1105785369873 27.13343811035156 27.61561584472656 22.81193351745605 27.60481452941895 22.79322624206543 C 26.80298805236816 21.40467643737793 25.02121543884277 20.92722511291504 23.63260078430176 21.7288703918457 C 22.24399185180664 22.53057861328125 21.76653671264648 24.31253433227539 22.5682430267334 25.70102119445801 L 24.96413421630859 29.85092544555664 L 21.68924713134766 29.85092544555664 C 21.62872886657715 28.47927093505859 19.9722785949707 27.80173873901367 18.9674129486084 28.76086616516113 L 15.9999475479126 31.59335899353027 C 15.33551025390625 32.22756958007813 15.33309745788574 33.28763961791992 15.9999475479126 33.92414855957031 L 19.22245979309082 37.00009536743164 C 20.14924812316895 37.88458633422852 21.69087409973145 37.23511505126953 21.69087409973145 35.94382476806641 L 21.69087409973145 35.66657257080078 L 25.37314796447754 35.66657257080078 C 25.62312698364258 35.66657257080078 25.8256778717041 35.46395492553711 25.8256778717041 35.21403884887695 C 25.8256778717041 34.9641227722168 25.62312698364258 34.76150512695313 25.37314796447754 34.76150512695313 L 21.23834228515625 34.76150512695313 C 20.98836326599121 34.76150512695313 20.78581047058105 34.9641227722168 20.78581047058105 35.21403884887695 L 20.78581047058105 35.94382476806641 C 20.78581047058105 36.43213272094727 20.20065498352051 36.68265914916992 19.84737777709961 36.34543609619141 L 16.6248664855957 33.26948165893555 C 16.33367729187012 32.99156188964844 16.33258819580078 32.52702713012695 16.6248664855957 32.24808120727539 L 19.59233283996582 29.41558647155762 C 20.04311370849609 28.98520088195801 20.78581047058105 29.30335807800293 20.78581047058105 29.92628288269043 L 20.78581047058105 30.3034553527832 C 20.78581047058105 30.55337524414063 20.98836326599121 30.7559928894043 21.23834228515625 30.7559928894043 L 26.82748603820801 30.7559928894043 C 28.19781303405762 30.7559928894043 29.35768508911133 29.88960075378418 29.77944755554199 28.6131591796875 C 30.5786190032959 31.20671463012695 29.00115203857422 33.96184539794922 26.40324974060059 34.61573028564453 C 26.16087341308594 34.67673110961914 25.8256778717041 34.74444198608398 25.37314796447754 34.76150512695313 C 24.92061614990234 34.77856826782227 23.21084594726563 36.14910507202148 26.62420845031738 35.49340057373047 C 30.1579418182373 34.60396575927734 32.05441665649414 30.50015640258789 30.1264476776123 27.16088485717773 Z M 26.82754516601563 29.85092544555664 L 25.96495628356934 29.85092544555664 C 25.9178352355957 29.62429809570313 25.94764137268066 29.77321243286133 23.35209465026855 25.24848937988281 C 22.79994201660156 24.29213714599609 23.12878227233887 23.06486511230469 24.08513832092285 22.51265716552734 C 25.04136848449707 21.96044731140137 26.26869773864746 22.28940582275391 26.82102584838867 23.24575996398926 L 28.7313175201416 26.55449676513672 C 29.57634735107422 28.01907539367676 28.52110290527344 29.85092544555664 26.82754516601563 29.85092544555664 Z" fill="#000000" stroke="#000000" stroke-width="0.20000000298023224" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';
const String _shapeSVG_50ceff6aaa9e4db5b82176aa9975e1b9 =
    '<svg viewBox="314.0 339.0 30.0 30.0" ><g transform="translate(314.0, 339.0)"><g transform="translate(0.0, 0.0)"><g transform="translate(0.0, 0.0)"><path transform="translate(-179.69, -59.89)" d="M 194.6866149902344 63.97900390625 C 193.1818237304688 63.97900390625 191.9580078125 65.20281982421875 191.9580078125 66.70761871337891 C 191.9580078125 68.21241760253906 193.1818237304688 69.43616485595703 194.6866149902344 69.43616485595703 C 196.1914367675781 69.43616485595703 197.4151611328125 68.21235656738281 197.4151611328125 66.70761871337891 C 197.4151611328125 65.202880859375 196.1913757324219 63.97900390625 194.6866149902344 63.97900390625 Z M 194.6866149902344 68.07256317138672 C 193.9342041015625 68.07256317138672 193.3216552734375 67.46002197265625 193.3216552734375 66.70761871337891 C 193.3216552734375 65.95521545410156 193.9342041015625 65.34267425537109 194.6866149902344 65.34267425537109 C 195.4390258789063 65.34267425537109 196.0515441894531 65.95521545410156 196.0515441894531 66.70761871337891 C 196.0515441894531 67.46002197265625 195.4390258789063 68.07256317138672 194.6866149902344 68.07256317138672 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, 0.0)" d="M 29.31796264648438 12.27282905578613 C 29.69483375549316 12.27282905578613 29.99979591369629 11.9697208404541 29.99979591369629 11.5929126739502 L 29.99979591369629 8.865962028503418 C 29.99979591369629 8.625622749328613 29.8732967376709 8.402606964111328 29.66619682312012 8.280072212219238 L 16.32885551452637 0.3594974279403687 C 16.32284736633301 0.3554704487323761 16.31683921813965 0.3521466553211212 16.31089401245117 0.3488228321075439 C 15.48191738128662 -0.1105696707963943 14.54708862304688 -0.1245042458176613 13.67017078399658 0.3581551313400269 L 0.3335980772972107 8.280072212219238 C 0.1264975368976593 8.402543067932129 0 8.625622749328613 0 8.865962028503418 L 0 11.5929126739502 C 0 11.9697208404541 0.3049619793891907 12.27282905578613 0.6818338632583618 12.27282905578613 L 2.727271556854248 12.27282905578613 L 2.727271556854248 24.5460319519043 C 1.223107814788818 24.5460319519043 0 25.76901245117188 0 27.27298545837402 L 0 29.31822967529297 C 0 29.69503974914551 0.3049619793891907 30 0.6818338632583618 30 L 29.31796264648438 30 C 29.69483375549316 30 29.99979591369629 29.69510078430176 29.99979591369629 29.31822967529297 L 29.99979591369629 27.27298355102539 C 29.99979591369629 25.76901054382324 28.77668762207031 24.5460319519043 27.27252197265625 24.5460319519043 L 27.27252197265625 12.27282905578613 L 29.31796264648438 12.27282905578613 Z M 28.63612937927246 27.27272796630859 L 28.63612937927246 28.63633346557617 L 1.363603830337524 28.63633346557617 L 1.363603830337524 27.27272796630859 C 1.363603830337524 26.52102851867676 1.975509405136108 25.90912437438965 2.727207660675049 25.90912437438965 L 3.4090416431427 25.90912437438965 L 26.59068870544434 25.90912437438965 L 27.27252197265625 25.90912437438965 C 28.02422142028809 25.90906143188477 28.63612937927246 26.52096748352051 28.63612937927246 27.27272796630859 Z M 4.090875148773193 24.54545783996582 L 4.090875148773193 12.27282905578613 L 6.818146705627441 12.27282905578613 L 6.818146705627441 24.54545783996582 L 4.090875148773193 24.54545783996582 Z M 8.181750297546387 24.54545783996582 L 8.181750297546387 12.27282905578613 L 12.27262592315674 12.27282905578613 L 12.27262592315674 24.54545783996582 L 8.181750297546387 24.54545783996582 Z M 13.63623046875 24.54545783996582 L 13.63623046875 12.27282905578613 L 16.36350059509277 12.27282905578613 L 16.36350059509277 24.54545783996582 L 13.63623046875 24.54545783996582 Z M 17.72710609436035 24.54545783996582 L 17.72710609436035 12.27282905578613 L 21.8179817199707 12.27282905578613 L 21.8179817199707 24.54545783996582 L 17.72710609436035 24.54545783996582 Z M 23.18164825439453 24.54545783996582 L 23.18164825439453 12.27282905578613 L 25.9089183807373 12.27282905578613 L 25.9089183807373 24.54545783996582 L 23.18164825439453 24.54545783996582 Z M 1.363603830337524 10.90922546386719 L 1.363603830337524 9.251974105834961 L 14.34670066833496 1.538947939872742 C 14.77151203155518 1.305256724357605 15.22291469573975 1.305895924568176 15.64242076873779 1.534281969070435 L 28.63612937927246 9.251974105834961 L 28.63612937927246 10.90922546386719 L 1.363603830337524 10.90922546386719 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></g></g></svg>';
const String _shapeSVG_3f18c9912a5b4853abc1fb0b29ace02f =
    '<svg viewBox="57.8 339.0 42.7 30.0" ><g transform="translate(-752.16, 229.0)"><path transform="translate(810.0, 110.0)" d="M 40.16669845581055 26.66663932800293 C 41.54528427124023 26.66663932800293 42.66670608520508 25.54522514343262 42.66670608520508 24.16664123535156 L 42.66670608520508 17.49996948242188 C 42.66670608520508 17.38733863830566 42.63740921020508 17.26233863830566 42.60095596313477 17.17477226257324 L 39.69274520874023 9.904260635375977 C 39.31058120727539 8.949834823608398 38.39945220947266 8.333292961120605 37.37177658081055 8.333292961120605 L 29.33336639404297 8.333292961120605 L 29.33336639404297 4.166623592376709 C 29.33336639404297 2.788039445877075 28.21194648742676 1.666621923446655 26.8333625793457 1.666621923446655 L 25.50002670288086 1.666621923446655 L 25.50002670288086 0.8332880735397339 C 25.50002670288086 0.3730011284351349 25.12698173522949 -4.57763671875e-05 24.66669654846191 -4.57763671875e-05 C 24.20640563964844 -4.57763671875e-05 23.83335876464844 0.3730011284351349 23.83335876464844 0.8332880735397339 L 23.83335876464844 1.666621923446655 L 20.50002670288086 1.666621923446655 L 20.50002670288086 0.8332880735397339 C 20.50002670288086 0.3730011284351349 20.12697792053223 -4.57763671875e-05 19.66669464111328 -4.57763671875e-05 C 19.20640754699707 -4.57763671875e-05 18.83336067199707 0.3730011284351349 18.83336067199707 0.8332880735397339 L 18.83336067199707 1.666621923446655 L 15.50002384185791 1.666621923446655 L 15.50002384185791 0.8332880735397339 C 15.50002384185791 0.3730011284351349 15.12697601318359 -4.57763671875e-05 14.66668891906738 -4.57763671875e-05 C 14.20640277862549 -4.57763671875e-05 13.83335399627686 0.3730011284351349 13.83335399627686 0.8332880735397339 L 13.83335399627686 1.666621923446655 L 10.50001907348633 1.666621923446655 L 10.50001907348633 0.8332880735397339 C 10.50001907348633 0.3730011284351349 10.12697219848633 -4.57763671875e-05 9.666686058044434 -4.57763671875e-05 C 9.206398963928223 -4.57763671875e-05 8.833351135253906 0.3730011284351349 8.833351135253906 0.8332880735397339 L 8.833351135253906 1.666621923446655 L 7.035175323486328 1.666621923446655 C 5.956724643707275 1.666621923446655 5.003273963928223 2.353796482086182 4.662774085998535 3.37658166885376 L 0.04265448823571205 17.23659133911133 C 0.01433413289487362 17.32122421264648 1.120640717999777e-05 17.4104175567627 1.120640717999777e-05 17.49993705749512 L 1.120640717999777e-05 24.1666088104248 C 1.120640717999777e-05 25.54519462585449 1.121428608894348 26.66661262512207 2.500012874603271 26.66661262512207 L 3.917330026626587 26.66661262512207 C 4.257253646850586 28.56896209716797 5.942699909210205 29.99994850158691 8.000015258789063 29.99994850158691 C 10.05733108520508 29.99994850158691 11.33333396911621 28.33330917358398 11.33333396911621 28.33330917358398 C 11.33333396911621 28.33330917358398 12.64117050170898 29.99994850158691 14.66667079925537 29.99994850158691 C 16.69217109680176 29.99994850158691 18.39048385620117 28.5905704498291 18.74937438964844 26.6666145324707 L 31.08404731750488 26.6666145324707 C 31.61607551574707 28.84989738464355 33.48749923706055 29.99995231628418 35.16665649414063 29.99995231628418 C 36.84580993652344 29.99995231628418 38.92040634155273 28.74184417724609 39.24942779541016 26.6666145324707 L 40.16669845581055 26.66663932800293 Z M 8.000015258789063 28.33330917358398 C 6.621431350708008 28.33330917358398 5.50001335144043 27.21189308166504 5.50001335144043 25.83330917358398 C 5.50001335144043 24.45472526550293 6.621431350708008 23.33330535888672 8.000015258789063 23.33330535888672 C 9.378599166870117 23.33330535888672 10.50001621246338 24.45472526550293 10.50001621246338 25.83330917358398 C 10.50001621246338 27.21189308166504 9.378599166870117 28.33330917358398 8.000015258789063 28.33330917358398 Z M 14.66668701171875 28.33330917358398 C 13.28810119628906 28.33330917358398 12.1666841506958 27.21189308166504 12.1666841506958 25.83330917358398 C 12.1666841506958 24.45472526550293 13.28810119628906 23.33330535888672 14.66668701171875 23.33330535888672 C 16.0452709197998 23.33330535888672 17.16668891906738 24.45472526550293 17.16668891906738 25.83330917358398 C 17.16668891906738 27.21189308166504 16.0452709197998 28.33330917358398 14.66668701171875 28.33330917358398 Z M 27.66669464111328 24.99997138977051 L 18.74935722351074 24.99997138977051 C 18.36231231689453 23.10022735595703 16.67903900146484 21.66663932800293 14.66667079925537 21.66663932800293 C 13.30501937866211 21.66663932800293 12.09407711029053 22.32321166992188 11.33333396911621 23.33623695373535 C 10.57259082794189 22.32321166992188 9.361649513244629 21.66663932800293 7.999999046325684 21.66663932800293 C 5.987955570220947 21.66663932800293 4.304354667663574 23.10022735595703 3.917313098907471 24.99997138977051 L 2.499995470046997 24.99997138977051 C 2.040359020233154 24.99997138977051 1.666661739349365 24.62627601623535 1.666661739349365 24.16664123535156 L 1.666661739349365 17.63506126403809 L 6.244139671325684 3.903301239013672 C 6.357420444488525 3.562155246734619 6.675454616546631 3.333314180374146 7.035155773162842 3.333314180374146 L 26.83333206176758 3.333314180374146 C 27.29297065734863 3.333314180374146 27.66666793823242 3.707012414932251 27.66666793823242 4.166647911071777 L 27.66669464111328 24.99997138977051 Z M 39.26919937133789 13.33330059051514 L 40.60253524780273 16.66663360595703 L 34.33332443237305 16.66663360595703 L 34.33332443237305 13.33330059051514 L 39.26919937133789 13.33330059051514 Z M 35.16665649414063 28.33330917358398 C 33.78807067871094 28.33330917358398 32.66665267944336 27.21189308166504 32.66665267944336 25.83330917358398 C 32.66665267944336 24.45472526550293 33.78807067871094 23.33330535888672 35.16665649414063 23.33330535888672 C 36.54523849487305 23.33330535888672 37.66665649414063 24.45472526550293 37.66665649414063 25.83330917358398 C 37.66665649414063 27.21189308166504 36.54523849487305 28.33330917358398 35.16665649414063 28.33330917358398 Z M 35.16665649414063 21.66663932800293 C 33.15461349487305 21.66663932800293 31.47101020812988 23.10022735595703 31.0839672088623 24.99997138977051 L 29.33331680297852 24.99997138977051 L 29.33331680297852 9.999963760375977 L 37.37173080444336 9.999963760375977 C 37.71417999267578 9.999963760375977 38.01821899414063 10.20569515228271 38.1454963684082 10.52372741699219 L 38.6025276184082 11.66662979125977 L 33.49998092651367 11.66662979125977 C 33.03969192504883 11.66662979125977 32.66664886474609 12.03967571258545 32.66664886474609 12.49996280670166 L 32.66664886474609 17.49996566772461 C 32.66664886474609 17.96025085449219 33.03969192504883 18.33329772949219 33.49998092651367 18.33329772949219 L 40.99998474121094 18.33329772949219 L 40.99998474121094 19.99996566772461 L 39.33332061767578 19.99996566772461 C 38.87302780151367 19.99996566772461 38.4999885559082 20.37301254272461 38.4999885559082 20.83330154418945 C 38.4999885559082 21.29358673095703 38.87302780151367 21.66663360595703 39.33332061767578 21.66663360595703 L 40.99998474121094 21.66663360595703 L 40.99998474121094 24.16663551330566 C 40.99998474121094 24.62627220153809 40.62628936767578 24.99996757507324 40.16665267944336 24.99996757507324 L 39.24933624267578 24.99996757507324 C 38.8622932434082 23.1002254486084 37.17869186401367 21.66663360595703 35.16664886474609 21.66663360595703 Z M 35.16665649414063 21.66663932800293" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(716.47, -7.58)" d="M 104.5339126586914 136.7470703125 L 105.1465377807617 136.7470703125 C 105.6068420410156 136.7470703125 105.9798736572266 136.3739776611328 105.9798736572266 135.9137115478516 C 105.9798736572266 135.4534301757813 105.6068420410156 135.0803833007813 105.1465377807617 135.0803833007813 L 104.5339126586914 135.0803833007813 C 103.8770141601563 135.0803833007813 103.4815139770508 134.3587036132813 103.8275451660156 133.8053283691406 L 105.4749908447266 131.1695709228516 L 105.5892486572266 131.5950317382813 C 105.7077484130859 132.0374145507813 106.1631469726563 132.3043518066406 106.6097717285156 132.1842193603516 C 107.0544204711914 132.0654144287109 107.3180923461914 131.6083831787109 107.1989440917969 131.1636962890625 L 106.5889282226563 128.8870239257813 C 106.5869598388672 128.8795471191406 106.5840377807617 128.8720397949219 106.5817642211914 128.8645172119141 C 106.4518814086914 128.4283447265625 105.9974517822266 128.1825714111328 105.5684204101563 128.2978057861328 L 103.2917327880859 128.9078521728516 C 102.847053527832 129.0269775390625 102.583381652832 129.4840240478516 102.7025146484375 129.9283447265625 C 102.8213500976563 130.3730316162109 103.2783660888672 130.6370239257813 103.7230377197266 130.5175323486328 L 103.9557952880859 130.4550476074219 L 102.4141159057617 132.9222106933594 C 101.3734283447266 134.587890625 102.5690612792969 136.7470703125 104.5339126586914 136.7470703125 Z M 104.5339126586914 136.7470703125" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(639.49, -50.09)" d="M 192.8729248046875 176.3107452392578 C 193.1075897216797 176.68603515625 192.9659881591797 177.0281677246094 192.8953247070313 177.1561126708984 C 192.8237609863281 177.2853393554688 192.6089172363281 177.5857849121094 192.1665344238281 177.5857849121094 L 188.8517303466797 177.5857849121094 L 189.0955352783203 177.3416748046875 C 189.4210815429688 177.0161285400391 189.4210815429688 176.4884643554688 189.0955352783203 176.1629638671875 C 188.7703399658203 175.8377532958984 188.24267578125 175.8377532958984 187.9171600341797 176.1629638671875 L 186.2505035400391 177.82958984375 C 186.2475891113281 177.8325347900391 186.2452697753906 177.8354644775391 186.2426910400391 177.8384094238281 C 185.9272766113281 178.1626129150391 185.9295501708984 178.6775970458984 186.2426910400391 178.9995269775391 C 186.2452697753906 179.0024566650391 186.2475891113281 179.0053863525391 186.2505035400391 179.0083312988281 L 187.9171600341797 180.6750183105469 C 188.24267578125 181.0001678466797 188.77001953125 181.0001678466797 189.0955352783203 180.6750183105469 C 189.4210815429688 180.3494720458984 189.4210815429688 179.8217926025391 189.0955352783203 179.4962768554688 L 188.8513946533203 179.2524719238281 L 192.1661682128906 179.2524719238281 C 193.0877532958984 179.2524719238281 193.9047698974609 178.7713317871094 194.3530120849609 177.9637145996094 C 194.7993316650391 177.1567535400391 194.7742767333984 176.2085266113281 194.2859954833984 175.4269409179688 L 194.0376129150391 175.0304565429688 C 193.7934722900391 174.6401824951172 193.2791290283203 174.5220184326172 192.8891754150391 174.7661590576172 C 192.4988708496094 175.0102996826172 192.3807373046875 175.5246124267578 192.6248168945313 175.9145660400391 L 192.8729248046875 176.3107452392578 Z M 192.8729248046875 176.3107452392578" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(657.77, 47.91)" d="M 166.4611511230469 70.45857238769531 C 166.8511505126953 70.70273590087891 167.3654632568359 70.58424377441406 167.6096343994141 70.19394683837891 L 167.8570098876953 69.798095703125 C 168.1841583251953 69.27466583251953 168.9445648193359 69.27693939208984 169.2704162597656 69.798095703125 L 170.8120727539063 72.26457977294922 L 170.5793304443359 72.20209503173828 C 170.1346740722656 72.08294677734375 169.677978515625 72.34693145751953 169.5588226318359 72.79126739501953 C 169.4396820068359 73.23593139648438 169.7036743164063 73.69297027587891 170.1480102539063 73.81211853027344 L 172.4246978759766 74.42181396484375 C 172.4266815185547 74.42245483398438 172.4282836914063 74.42245483398438 172.4302215576172 74.42311859130859 C 172.8729553222656 74.53802490234375 173.3267211914063 74.27499389648438 173.4452056884766 73.83261108398438 L 174.0552825927734 71.55592346191406 C 174.1743774414063 71.11159515380859 173.9107208251953 70.65455627441406 173.4660491943359 70.53542327880859 C 173.0213928222656 70.41627502441406 172.5646667480469 70.68025970458984 172.4452056884766 71.12461090087891 L 172.331298828125 71.55038452148438 L 170.6835327148438 68.91432952880859 C 169.7030639648438 67.34628295898438 167.4221343994141 67.34986877441406 166.4435882568359 68.91432952880859 L 166.1962127685547 69.31015014648438 C 165.9523773193359 69.70046234130859 166.0709075927734 70.21477508544922 166.4611511230469 70.45858001708984 Z M 166.4611511230469 70.45857238769531" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></g></svg>';