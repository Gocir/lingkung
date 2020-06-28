import 'package:flutter/material.dart';
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class ProductLisTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    productProvider.loadProductByUser(userProvider.user.uid);

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            width: 130.0,
            height: 180.0,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image.network(
                                '${productProvider.productByUser[index].image.toString()}',
                                fit: BoxFit.cover))),
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: CustomText(
                          text:
                              '${productProvider.productByUser[index].name} bifzouzp'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: CustomText(
                        text:
                            'Rp ${productProvider.productByUser[index].price.toString()}',
                        color: yellow,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
