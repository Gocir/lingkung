import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class MyProductPage extends StatefulWidget {
  @override
  _MyProductPageState createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    productProvider.loadProductByUser(userProvider.user.uid);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: CustomText(
            text: 'Produk Toko Saya',
            size: 20.0,
            color: white,
            weight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
              itemCount: productProvider.productByUser.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3.4),
              itemBuilder: (_, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 2.4,
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
                        Divider(
                          height: 5.0,
                        ),
                        ButtonBar(
                          children: <Widget>[
                            Icon(Icons.edit, color: blue),
                            Icon(Icons.delete_outline, color: yellow)
                          ],
                        )
                      ],
                    ));
              }),
        ));
  }
}
