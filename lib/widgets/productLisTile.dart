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

    return GridView.builder(
        itemCount: productProvider.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3.2),
        itemBuilder: (_, index) {
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => TrashBankDetail(product: productProvider.products[index]),
                    //           ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width/2.4,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),),
                              child: Image.asset(
                                "assets/images/bohlilin.png",
                                fit: BoxFit.fill,
                              ))),
                      // Image.network('${productProvider.products[index].image[0].toString()}'),

                      Container(
                        height: 60.0,
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: CustomText(
                            text:
                                '${productProvider.products[index].name} bifzouzp'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: CustomText(
                            text:
                                'Rp ${productProvider.products[index].price.toString()}'),
                      ),
                      Divider(),
                      ButtonBar(children: <Widget>[
                        Icon(Icons.edit, color: blue),
                        Icon(Icons.delete_outline, color: yellow)
                      ])
                    ],
                  )));
        });
  }
}
