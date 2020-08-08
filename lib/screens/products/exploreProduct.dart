import 'package:flutter/material.dart';
import 'package:lingkung/providers/cartBloc.dart';
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/products/cartProduct.dart';
import 'package:lingkung/screens/products/detailMyProduct.dart';
import 'package:lingkung/screens/products/detailProduct.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class ExploreProductPage extends StatefulWidget {
  ExploreProductPage({Key key}) : super(key: key);
  @override
  _ExploreProductPageState createState() => _ExploreProductPageState();
}

class _ExploreProductPageState extends State<ExploreProductPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    // var cartBloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    // if (cartBloc.cart.length > 0) {
    //   totalCount = cartBloc.cart.values.reduce((a, b) => a + b);
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        iconTheme: IconThemeData(color: white),
        titleSpacing: 0,
        title: CustomText(
          text: 'Produk Ramah Lingkung',
          size: 18.0,
          color: white,
          weight: FontWeight.w600,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 10.0),
            child: Stack(alignment: Alignment.topRight, children: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartProduct(),
                        ));
                  }),
              Positioned(
                right: 5.0,
                top: 5.0,
                child: Container(
                  height: 16.0,
                  width: 16.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red),
                  child: CustomText(
                      text: '$totalCount',
                      size: 10.0,
                      color: white,
                      weight: FontWeight.w500),
                ),
              )
            ]),
          ),
        ],
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: productProvider.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3 / 4),
            itemBuilder: (_, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    onTap: () {
                      (productProvider.products[index].userId ==
                              userProvider.user.uid)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailMyProduct(
                                      productModel:
                                          productProvider.products[index])))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProduct(
                                      productModel:
                                          productProvider.products[index])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width * 0.44,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                child: Image.network(
                                    '${productProvider.products[index].image.toString()}',
                                    fit: BoxFit.cover))),
                        Container(
                          height: 40.0,
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            '${productProvider.products[index].name}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: CustomText(
                            text: 'Rp${productProvider.products[index].price}',
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
