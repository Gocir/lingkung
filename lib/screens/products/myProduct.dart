import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productProvider.dart';
// Screens
import 'package:lingkung/screens/products/detailMyProduct.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class MyProductPage extends StatefulWidget {
  @override
  _MyProductPageState createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    productProvider.loadProductByUser(userProvider.user?.uid);
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: blue,
                title: CustomText(
                    text: 'Produk Toko Saya',
                    size: 18.0,
                    color: white,
                    weight: FontWeight.w600)),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (productProvider.productByUser.isEmpty)
                    ? Center(child: CustomText(text: 'Belum Ada Produk'))
                    : GridView.builder(
                        itemCount: productProvider.productByUser.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3 / 4),
                        itemBuilder: (_, index) {
                          return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailMyProduct(
                                                    productModel:
                                                        productProvider
                                                                .productByUser[
                                                            index])));
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
                                                0.44,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0)),
                                                child: Image.network(
                                                    '${productProvider.productByUser[index].image.toString()}',
                                                    fit: BoxFit.cover))),
                                        Container(
                                            height: 38.0,
                                            padding: EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Text(
                                                '${productProvider.productByUser[index].name}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                        FontWeight.normal))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: CustomText(
                                                text: NumberFormat.currency(
                                                        locale: 'id',
                                                        symbol: 'Rp ',
                                                        decimalDigits: 0)
                                                    .format(productProvider
                                                        .productByUser[index]
                                                        .price),
                                                weight: FontWeight.w500))
                                      ])));
                        }))));
  }
}
