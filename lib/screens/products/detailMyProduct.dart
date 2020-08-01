import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/main.dart';
//  Models
import 'package:lingkung/models/productModel.dart';
//  Screens
import 'package:lingkung/screens/products/updateProduct.dart';
//  Services
import 'package:lingkung/services/productService.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class DetailMyProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailMyProduct({this.productModel});

  @override
  _DetailMyProductState createState() => _DetailMyProductState();
}

class _DetailMyProductState extends State<DetailMyProduct> {
  ProductServices _productService = ProductServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: blue,
          elevation: 0.0,
          iconTheme: IconThemeData(color: white),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.edit, color: white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateProduct(productModel: widget.productModel),
                      ));
                }),
            IconButton(
                icon: Icon(Icons.delete, color: white),
                onPressed: () async {
                  await _productService.deleteProduct(widget.productModel.id);
                  Navigator.pop(context);
                }),
            PopupMenuButton(
                offset: Offset(0, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                      },
                      child: Row(children: <Widget>[
                        Icon(Icons.home, color: yellow),
                        SizedBox(width: 5.0),
                        CustomText(text: 'Kembali ke Halaman Utama')
                      ]),
                    )),
                    PopupMenuItem(
                        child: Row(children: <Widget>[
                      Icon(Icons.help_outline, color: yellow),
                      SizedBox(width: 5.0),
                      CustomText(text: 'Butuh Bantuan?')
                    ]))
                  ];
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) =>
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: black.withOpacity(0.9),
                                  child: Center(
                                    child: Hero(
                                      tag: 'ProductImage',
                                      child: Image.network(
                                        '${widget.productModel.image}',
                                      ),
                                    ),
                                  ),
                                ))));
              },
              child: Hero(
                tag: 'ProductImage',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/noimage.png"))),
                  child: Image.network(
                    '${widget.productModel.image}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                      text: '${widget.productModel.name}',
                      size: 16,
                      weight: FontWeight.w500),
                  SizedBox(height: 20.0),
                  CustomText(
                      text: NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(widget.productModel.price),
                      size: 18,
                      color: Colors.red,
                      weight: FontWeight.w500),
                  SizedBox(height: 10.0),
                  Divider(),
                  CustomText(
                      text: 'Informasi Produk',
                      size: 16.0,
                      weight: FontWeight.w500),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomText(
                        text: 'Stok',
                      ),
                      CustomText(
                        text: '${widget.productModel.stock}',
                        color: grey,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Divider(),
                  CustomText(
                      text: 'Deskripsi Produk',
                      size: 16.0,
                      weight: FontWeight.w500),
                  SizedBox(height: 5.0),
                  CustomText(
                    text: '${widget.productModel.description}',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
