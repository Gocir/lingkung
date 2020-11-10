import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/main.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productCartProvider.dart';
import 'package:lingkung/screens/products/productCart.dart';
import 'package:lingkung/screens/products/checkoutProduct.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailProduct extends StatefulWidget {
  final UserModel userModel;
  final ProductModel productModel;
  DetailProduct({this.userModel, this.productModel});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  bool loading = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productCartProvider = Provider.of<ProductCartProvider>(context);
    productCartProvider.loadProductCartByUser(widget.userModel.id);

    int totalCount = 0;
    if (productCartProvider.productCartByUser.length > 0) {
      totalCount = productCartProvider.productCartByUser.length;
    }

    return loading
        ? Loading()
        : SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: white,
              body: CustomScrollView(
                // physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    iconTheme: IconThemeData(color: black),
                    leading: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.shopping_cart, color: black),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductCart(userModel: widget.userModel),
                                    ),
                                  );
                                },
                              ),
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
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: PopupMenuButton(
                          icon: Icon(Icons.more_vert, color: black),
                          offset: Offset(100, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.home, color: yellow),
                                      SizedBox(width: 5.0),
                                      CustomText(
                                          text: 'Kembali ke Halaman Utama')
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.help_outline, color: yellow),
                                    SizedBox(width: 5.0),
                                    CustomText(text: 'Butuh Bantuan?')
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                      SizedBox(width: 8.0),
                    ],
                    backgroundColor: white,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        imageUrl: widget.productModel.image.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: SpinKitThreeBounce(
                            color: black,
                            size: 20.0,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/noimage.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverToBoxAdapter(
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
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(widget.productModel.price),
                            size: 18,
                            color: Colors.red,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 10.0),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: blue,
                                    backgroundImage:
                                        AssetImage("assets/images/user.png"),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CustomText(
                                          text:
                                              '${widget.productModel.userName}',
                                          over: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5.0),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.location_on,
                                                size: 12.0, color: grey),
                                            SizedBox(width: 5.0),
                                            CustomText(
                                              text: "Kota User",
                                              size: 12.0,
                                              color: grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlineButton(
                                    color: white,
                                    highlightColor: white,
                                    highlightedBorderColor: green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    borderSide:
                                        BorderSide(color: green, width: 2.0),
                                    child: CustomText(
                                      text: 'Kunjungi',
                                      color: green,
                                      weight: FontWeight.w700,
                                    ),
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => OrderTrash(),
                                      //     ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          CustomText(
                            text: 'Informasi Produk',
                            size: 16.0,
                            weight: FontWeight.w500,
                          ),
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
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 5.0),
                          CustomText(
                            text: '${widget.productModel.description}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                height: 80.0,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3, 0),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 48.0,
                        child: OutlineButton(
                          color: white,
                          highlightColor: white,
                          highlightedBorderColor: yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          borderSide: BorderSide(color: yellow, width: 2.0),
                          child: Icon(Icons.sms, color: yellow),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => OrderTrash(),
                            //     ));
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 48.0,
                        child: OutlineButton(
                          color: white,
                          highlightColor: white,
                          highlightedBorderColor: green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),),
                          borderSide: BorderSide(color: green, width: 2.0),
                          child: Icon(Icons.add_shopping_cart, color: green),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            // if (widget.productModel.id == productCartProvider.productCartModel) {
                            await productCartProvider.addProductCart(userId: widget.userModel.id, productModel: widget.productModel, quantity: _quantity);
                            print("Item added to cart");
                            userProvider.reloadUserModel();
                            // productCartProvider.loadProductCart();
                            setState(() {
                                loading = false;
                            });
                            // } else {

                            // }
                          }
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 48.0,
                        child: FlatButton(
                          color: green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            text: 'Beli',
                            size: 16.0,
                            color: white,
                            weight: FontWeight.w700,
                          ),
                          onPressed: () {
                            _settingModalBottomSheet(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void _settingModalBottomSheet(context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 285.0,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close)),
                SizedBox(height: 16.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              color: white,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(widget.productModel.image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 2.0),
                              ]),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomText(
                              text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(widget.productModel.price),
                              size: 16.0,
                              weight: FontWeight.w600,
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: <Widget>[
                                CustomText(
                                  text: 'Stok : ',
                                  color: Colors.red,
                                ),
                                CustomText(
                                  text: widget.productModel.stock.toString(),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: CustomText(text: 'Jumlah')),
                      InkWell(
                          onTap: () {
                            if (_quantity != 1) {
                              setState(() {
                                _quantity -= 1;
                              });
                              Navigator.pop(context);
                              _settingModalBottomSheet(context);
                            }
                          },
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (_quantity != 1) ? yellow : grey,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Icon(Icons.remove,
                                  color: (_quantity != 1) ? yellow : grey,
                                  size: 14.0))),
                      SizedBox(width: 10.0),
                      CustomText(text: '$_quantity'),
                      SizedBox(width: 10.0),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _quantity += 1;
                            });
                            Navigator.pop(context);
                            _settingModalBottomSheet(context);
                          },
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child:
                                  Icon(Icons.add, color: white, size: 14.0))),
                    ]),
                SizedBox(height: 16.0),
                Container(
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    color: green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),),
                    child: CustomText(
                        text: 'Beli Sekarang',
                        size: 16.0,
                        color: white,
                        weight: FontWeight.w700,),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutProduct(
                                productModel: widget.productModel,
                                userModel: widget.userModel,
                                quantity: _quantity),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
