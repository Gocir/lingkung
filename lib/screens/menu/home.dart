import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/screens/info/informations.dart';
import 'package:provider/provider.dart';
//providers
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productProvider.dart';
//screens
import 'package:lingkung/screens/products/detailMyProduct.dart';
import 'package:lingkung/screens/products/detailProduct.dart';
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

    return SafeArea(
      child: Scaffold(
          backgroundColor: blue,
          body: SingleChildScrollView(
              child: Stack(children: <Widget>[
            //BG1
            Row(children: <Widget>[
              Transform.translate(
                  offset: Offset(-14.23, 12.85),
                  child:
                      // Adobe XD layer: 'grass11' (shape)
                      Container(
                          width: 118.0,
                          height: 115.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/grass11.png"),
                            fit: BoxFit.fill,
                          )))),
              Transform.translate(
                  offset: Offset(150, -44.93),
                  child:
                      // Adobe XD layer: 'grass22' (shape)
                      Container(
                          width: 133.0,
                          height: 149.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/grass22.png"),
                            fit: BoxFit.fill,
                          ))))
            ]),
            //BG2
            Column(children: <Widget>[
              //User
              Container(
                  margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
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
                                          text: (userProvider.userModel?.name !=
                                                  null)
                                              ? 'Hai, ${userProvider.userModel.name}'
                                              : 'Hai, Sobat Lingkung',
                                          size: 20,
                                          weight: FontWeight.w700)),
                                  Container(
                                      child: CustomText(
                                    text: 'Pilih solusi Lingkung-mu, yuk!',
                                    color: white,
                                    weight: FontWeight.w600,
                                  ))
                                ])),
                        CachedNetworkImage(
                                            imageUrl: userProvider.userModel?.image.toString(),
                                            imageBuilder: (context, imageProvider) => Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover),
                                                    color: white,
                                                    borderRadius: BorderRadius.circular(
                                                        20.0))),
                                            placeholder: (context, url) =>
                                                Container(width: 50.0, height: 50.0, decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(20.0)), child: SpinKitThreeBounce(color: black, size: 10.0)),
                                            errorWidget: (context, url, error) => Container(width: 50.0, height: 50.0, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/user.png"), fit: BoxFit.cover), color: white, borderRadius: BorderRadius.circular(20.0)))),
                        ])),
              //Container White
              Container(
                  margin: EdgeInsets.only(top: 86.0),
                  padding: EdgeInsets.fromLTRB(16.0, 86.0, 16.0, 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Fitur
                        CustomText(
                            text: 'Fitur utama', weight: FontWeight.w700),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 0),
                                                    blurRadius: 6)
                                              ]),
                                          child: CustomText(
                                              text: 'Jual Sampah',
                                              weight: FontWeight.w600)))),
                              SizedBox(width: 10.0),
                              Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InformationsPage()));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 0),
                                                    blurRadius: 6)
                                              ]),
                                          child: CustomText(
                                              text: 'Daur Ulang',
                                              weight: FontWeight.w600)
                                          // SvgPicture.asset("assets/icons/recycles.svg"),
                                          ))),
                              SizedBox(width: 10.0),
                              Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TrashBankList()));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 0),
                                                    blurRadius: 6)
                                              ]),
                                          child: CustomText(
                                              text: 'Bank Sampah',
                                              weight: FontWeight.w600))))
                            ]),
                        SizedBox(height: 16.0),
                        //Product
                        Row(children: <Widget>[
                          CustomText(
                              text: 'Beli produk ramah Lingkung',
                              weight: FontWeight.w700),
                          SizedBox(height: 5.0),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ExploreProductPage()));
                              },
                              child: CustomText(
                                  text: 'Lihat lainnya',
                                  size: 12,
                                  color: green)),
                          Icon(Icons.chevron_right, size: 16.0, color: green)
                        ]),
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
                                                (productProvider.products[index]
                                                            .userId ==
                                                        userProvider.user.uid)
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailMyProduct(
                                                                    productModel:
                                                                        productProvider.products[
                                                                            index])))
                                                    : Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailProduct(
                                                                    productModel:
                                                                        productProvider
                                                                            .products[index])));
                                              },
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CachedNetworkImage(
                                                      imageUrl: productProvider
                                                          .products[index].image
                                                          .toString(),
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                              width: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              imageProvider,
                                                                          fit: BoxFit
                                                                              .cover),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(10.0),
                                                                        topRight:
                                                                            Radius.circular(10.0),
                                                                      ))),
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                      color:
                                                                          black,
                                                                      size:
                                                                          10.0)),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                              "assets/images/noimage.png"),
                                                    ),
                                                    Container(
                                                        height: 38.0,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0,
                                                                right: 8.0),
                                                        child: CustomText(
                                                          text: productProvider
                                                              .products[index]
                                                              .name,
                                                          size: 12.0,
                                                          line: 2,
                                                          over: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0,
                                                                right: 8.0),
                                                        child: CustomText(
                                                          text: NumberFormat
                                                                  .currency(
                                                                      locale:
                                                                          'id',
                                                                      symbol:
                                                                          'Rp ',
                                                                      decimalDigits:
                                                                          0)
                                                              .format(
                                                                  productProvider
                                                                      .products[
                                                                          index]
                                                                      .price),
                                                          weight:
                                                              FontWeight.w500,
                                                        ))
                                                  ]))));
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
                                ))),
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
                                  image: AssetImage(
                                      "assets/images/fightcorona.png"),
                                  fit: BoxFit.contain,
                                )))
                      ]))
            ]),
            //BG3
            Container(
                height: 140.0,
                margin: EdgeInsets.only(left: 16.0, top: 86.0, right: 16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 0),
                          blurRadius: 6)
                    ]))
          ]))),
    );
  }
}
