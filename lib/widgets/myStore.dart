import 'package:flutter/material.dart';
import 'package:lingkung/screens/products/addProduct.dart';
import 'package:lingkung/screens/products/myProduct.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/productLisTile.dart';

class MyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProductPage()));
                },
                child: CustomText(text: 'Lihat lainnya', size: 12, color: green),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 185.0,
            child: ProductLisTile()
          ),
        ],
      ),
    );
  }
}
