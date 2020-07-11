import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
// Screens
import 'package:lingkung/screens/products/addProduct.dart';
import 'package:lingkung/screens/products/myProduct.dart';
import 'package:lingkung/screens/products/updateProduct.dart';
// Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class MyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    productProvider.loadProductByUser(userProvider.user.uid);
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
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 3)
                ],
              ),
              child: Column(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      leading: Icon(Icons.add_circle_outline),
                      title: CustomText(
                          text: 'Tambah Produk Baru', weight: FontWeight.w500),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: grey,
                      ),
                      dense: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProduct(),
                            ));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.multiline_chart),
                      title: CustomText(
                        text: 'Performa Toko',
                        weight: FontWeight.w500,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: grey,
                      ),
                      dense: true,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ManipulateProduct(),
                        //     ));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.store),
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => OrderProductList(),
                        //     ));
                      },
                    ),
                  ],
                ).toList(),
              )),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(text: 'Produk', weight: FontWeight.w700),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProductPage()));
                },
                child:
                    CustomText(text: 'Lihat lainnya', size: 12, color: green),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
              height: 195.0,
              child: ListView.builder(
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
                                    builder: (context) => UpdateProduct(
                                        productModel: productProvider
                                            .productByUser[index]),
                                  ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        child: Image.network(
                                            '${productProvider.productByUser[index].image.toString()}',
                                            fit: BoxFit.cover))),
                                Container(
                                  height: 38.0,
                                  padding:
                                      EdgeInsets.only(left: 8.0, right: 8.0),
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
                                  padding:
                                      EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: CustomText(
                                    text:
                                        'Rp${productProvider.productByUser[index].price.toString()}',
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
