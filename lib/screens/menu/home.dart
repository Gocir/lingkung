import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingkung/screens/products/detailProduct.dart';
import 'package:provider/provider.dart';
//providers
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productProvider.dart';
//screens
import 'package:lingkung/screens/products/exploreProduct.dart';
import 'package:lingkung/screens/sorTrash/traSectionList.dart';
import 'package:lingkung/screens/trashBank/trashBankList.dart';
//utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.loadProduct();

    return Scaffold(
      backgroundColor: blue,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            //BG1
            Row(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-14.23, 36.85),
                  child:
                      // Adobe XD layer: 'grass11' (shape)
                      Container(
                    width: 118.0,
                    height: 115.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/grass11.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(180, -20.93),
                  child:
                      // Adobe XD layer: 'grass22' (shape)
                      Container(
                    width: 133.0,
                    height: 149.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/grass22.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //BG2
            Column(
              children: <Widget>[
                //User
                Container(
                  margin: EdgeInsets.only(left: 16.0, top: 44.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: CustomText(
                                  text: (userProvider.userModel?.name != null)
                                      ? 'Hai, ${userProvider.userModel?.name}'
                                      : 'Hai, Guest Lingkung',
                                  size: 20,
                                  weight: FontWeight.w700),
                            ),
                            Container(
                              child: CustomText(
                                text: 'Pilih solusi Lingkung-mu, yuk!',
                                color: white,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: white,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: (userProvider.userModel?.image.toString() != null)
                                  ? Image.network("${userProvider.userModel?.image.toString()}", fit: BoxFit.cover)
                                  : Image.asset("assets/images/user.png",
                                      fit: BoxFit.cover)),
                        )),
                    ],
                  ),
                ),
                //Container White
                Container(
                  margin: EdgeInsets.only(top: 86.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 70.0),
                      //Fitur
                      CustomText(text: 'Fitur utama', weight: FontWeight.w700),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TraSectionList()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 0),
                                        blurRadius: 6)
                                  ],
                                ),
                                child: CustomText(text: 'Jual Sampah', weight: FontWeight.w600)
                                // SvgPicture.asset("assets/icons/garbagecar.svg"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) => TrashBankList()
                                // ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 0),
                                        blurRadius: 6)
                                  ],
                                ),
                                child: CustomText(text: 'Daur Ulang', weight: FontWeight.w600)
                                // SvgPicture.asset("assets/icons/recycles.svg"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TrashBankList()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 0),
                                        blurRadius: 6)
                                  ],
                                ),
                                child: CustomText(text: 'Bank Sampah', weight: FontWeight.w600)
                                    // SvgPicture.asset("assets/icons/bank.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      //Product
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                              text: 'Beli produk ramah Lingkung',
                              weight: FontWeight.w700),
                          SizedBox(height: 5.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ExploreProductPage()));
                            },
                            child: CustomText(
                                text: 'Lihat lainnya', size: 12, color: green),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Container(
                          height: 195.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productProvider.products.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  width: 140.0,
                                  height: 190.0,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailProduct(productModel: productProvider.products[index])));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                    child: Image.network(
                                                        '${productProvider.products[index].image.toString()}',
                                                        fit: BoxFit.cover))),
                                            Container(
                                              height: 38.0,
                                              padding: EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Text(
                                                '${productProvider.products[index].name}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: CustomText(
                                                text:
                                                    'Rp${productProvider.products[index].price.toString()}',
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              })),
                      SizedBox(height: 16.0),
                      //Konten
                      CustomText(
                          text: 'Konten untukmu', weight: FontWeight.w700),
                      SizedBox(height: 5.0),
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/images/news.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 0),
                                blurRadius: 3)
                          ],
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/images/fightcorona.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        // child: Text(
                        //   'Langkah-langkah untuk memerangi Corona',
                        //   style: TextStyle(
                        //     fontFamily: 'Poppins',
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w500
                        //   ),
                        //   textAlign: TextAlign.right,
                        // ),
                      ),
                    ],
                  ),
                ),
                //Container White
              ],
            ),
            //BG3
            Container(
              height: 140.0,
              margin: EdgeInsets.only(left: 16.0, top: 120.0, right: 16.0),
              // padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 6)
                ],
              ),
              // child: Container(child: CustomText(text: 'Iklan',))
            )
          ],
        ),
      ),
    );
  }
}
