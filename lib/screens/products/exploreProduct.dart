import 'package:flutter/material.dart';
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/products/cartProduct.dart';
import 'package:lingkung/screens/products/detailMyProduct.dart';
import 'package:lingkung/screens/products/detailProduct.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class ExploreProductPage extends StatefulWidget {
  @override
  _ExploreProductPageState createState() => _ExploreProductPageState();
}

class _ExploreProductPageState extends State<ExploreProductPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        titleSpacing: 0,
        title: CustomText(
          text: 'Produk Ramah Lingkung',
          size: 18.0,
          color: white,
          weight: FontWeight.w600,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: white,
              ),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartProduct(),
                        ));
              })
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
