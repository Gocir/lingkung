import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//  Models
import 'package:lingkung/models/userModel.dart';
//  Providers
import 'package:lingkung/providers/productProvider.dart';
//  Screens
import 'package:lingkung/screens/shipping/shipping.dart';
import 'package:lingkung/screens/products/addProduct.dart';
import 'package:lingkung/screens/products/myProduct.dart';
import 'package:lingkung/screens/products/salesProduct.dart';
import 'package:lingkung/screens/products/detailMyProduct.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class MyStore extends StatefulWidget {
  final UserModel userModel;
  MyStore({this.userModel});
  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    productProvider.loadProductByUser(widget.userModel.id);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(text: 'Toko', weight: FontWeight.w700),
          SizedBox(height: 5.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 0), blurRadius: 3)
              ],
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: Image.asset("assets/icons/add.png"),
                    title: CustomText(
                      text: 'Tambah Produk Baru',
                      weight: FontWeight.w500,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: grey,
                    ),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddProduct(userModel: widget.userModel),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/shipping.png"),
                    title: CustomText(
                      text: 'Jasa Pengiriman',
                      weight: FontWeight.w500,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: grey,
                    ),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ManipulateShipping(userModel: widget.userModel),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/sales.png"),
                    title: CustomText(
                      text: 'Penjualan Saya',
                      weight: FontWeight.w500,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: grey,
                    ),
                    dense: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SalesProductPage(userModel: widget.userModel),
                        ),
                      );
                    },
                  ),
                ],
              ).toList(),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(text: 'Produk', weight: FontWeight.w700),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyProductPage(),
                    ),
                  );
                },
                child: CustomText(
                  text: 'Lihat lainnya',
                  size: 12,
                  color: blue,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
              height: 195.0,
              child: (productProvider.productByUser.isEmpty)
                  ? Center(
                      child: CustomText(text: 'Belum Ada Produk'),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.productByUser.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: 140.0,
                          height: 190.0,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailMyProduct(
                                          productModel: productProvider
                                              .productByUser[index]),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        child: Image.network(
                                          '${productProvider.productByUser[index].image.toString()}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
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
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: CustomText(
                                        text: NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp ',
                                                decimalDigits: 0)
                                            .format(productProvider
                                                .productByUser[index].price),
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      })),
        ],
      ),
    );
  }
}
