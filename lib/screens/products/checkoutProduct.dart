import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lingkung/main.dart';
//  Models
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/productCartModel.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/models/shippingModel.dart';
import 'package:lingkung/models/userModel.dart';
//  Screens
import 'package:lingkung/screens/address/addressList.dart';
//  Services
import 'package:lingkung/services/userService.dart';
//  Providers
import 'package:lingkung/providers/addressProvider.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productOrderProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class CheckoutProduct extends StatefulWidget {
  final UserModel userModel;
  final ProductModel productModel;
  final List<ProductCartModel> productCartModel;
  final int quantity;
  CheckoutProduct(
      {this.productModel,
      this.productCartModel,
      this.userModel,
      this.quantity});

  @override
  _CheckoutProductState createState() => _CheckoutProductState();
}

class _CheckoutProductState extends State<CheckoutProduct> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  UserServices _userService = UserServices();

  AddressModel addressModel;
  ShippingModel shippingModel;
  int subTotalSingleProduct;
  int subTotalCart;
  int subTotaListProduct;
  int total = 0;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    if (widget.productCartModel == null) {
      setState(() {
        subTotalSingleProduct = widget.productModel.price * widget.quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final addressProvider = Provider.of<AddressProvider>(context);
    addressProvider.loadUserAddress(widget.userModel.id);
    userProvider.loadUserById(widget.productModel.userId);

    return loading
        ? Loading()
        : SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(
                key: _scaffoldStateKey,
                backgroundColor: blue,
                iconTheme: IconThemeData(color: white),
                title: CustomText(
                  text: 'Pengiriman',
                  color: white,
                  size: 18.0,
                  weight: FontWeight.w600,
                ),
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: 'Alamat Pengiriman',
                          weight: FontWeight.w700,
                        ),
                        InkWell(
                          onTap: () {
                            _addressModalBottomSheet(context);
                          },
                          child: CustomText(
                            text: 'Ganti alamat',
                            size: 12.0,
                            color: blue,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Card(
                      margin: const EdgeInsets.all(0),
                      child: (addressProvider.userAddress.isEmpty)
                          ? ListTile(
                              dense: true,
                              title: CustomText(
                                text: 'Tidak Ada Alamat',
                                size: 12.0,
                                weight: FontWeight.w600,
                              ),
                            )
                          : ListTile(
                              dense: true,
                              isThreeLine: true,
                              title: CustomText(
                                text: (addressModel == null)
                                    ? addressProvider
                                        .userAddress[0].addressLabel
                                    : addressModel.addressLabel,
                                weight: FontWeight.w600,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(
                                    text: (addressModel == null)
                                        ? addressProvider
                                                .userAddress[0].recipientsName +
                                            ' - 62${addressProvider.userAddress[0].phoneNumber}'
                                        : addressModel.recipientsName +
                                            ' - 62${addressModel.phoneNumber}',
                                    color: grey,
                                    size: 12.0,
                                  ),
                                  CustomText(
                                    text: (addressModel == null)
                                        ? '${addressProvider.userAddress[0].addressDetail}, ${addressProvider.userAddress[0].subDistrict}, ${addressProvider.userAddress[0].city}, ${addressProvider.userAddress[0].province} ${addressProvider.userAddress[0].postalCode}'
                                        : '${addressModel.addressDetail}, ${addressModel.subDistrict}, ${addressModel.city}, ${addressModel.province} ${addressModel.postalCode}',
                                    line: 3,
                                    over: TextOverflow.ellipsis,
                                    color: grey,
                                    size: 12.0,
                                  ),
                                ],
                              ),
                            ),
                    ),
                    Divider(),
                    SizedBox(height: 10.0),
                    CustomText(
                      text: 'Ringkasan Pesanan',
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 5.0),
                    (widget.productModel == null)
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.productCartModel.length,
                            itemBuilder: (_, index) {
                              subTotalCart =
                                  widget.productCartModel[index].price *
                                      widget.productCartModel[index].quantity;
                              subTotaListProduct =
                                  [subTotalCart].reduce((a, b) => a + b);
                              print(subTotaListProduct);

                              return Card(
                                margin: const EdgeInsets.only(bottom: 8.0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 10.0, 16.0, 16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Icon(Icons.store, color: grey),
                                        SizedBox(width: 5.0),
                                        CustomText(
                                            text: widget.productCartModel[index]
                                                .storeOwnerName,
                                            weight: FontWeight.w600)
                                      ]),
                                      Divider(),
                                      SizedBox(height: 10.0),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          CustomText(
                                            text: widget.productCartModel[index]
                                                    .quantity
                                                    .toString() +
                                                'x',
                                            color: grey,
                                            size: 18,
                                            weight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 16.0),
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                                color: white,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${widget.productCartModel[index].image}"),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(0.0, 0.0),
                                                      blurRadius: 2.0),
                                                ]),
                                          ),
                                          SizedBox(
                                            width: 16.0,
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
                                                  text: widget
                                                      .productCartModel[index]
                                                      .name,
                                                  line: 2,
                                                  over: TextOverflow.ellipsis,
                                                  weight: FontWeight.w500,
                                                ),
                                                SizedBox(height: 5.0),
                                                CustomText(
                                                  text: NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp',
                                                          decimalDigits: 0)
                                                      .format(widget
                                                          .productCartModel[
                                                              index]
                                                          .price),
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Divider(),
                                      SizedBox(height: 5.0),
                                      Card(
                                        margin: const EdgeInsets.all(0),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: green, width: 1.0),
                                        ),
                                        child: (shippingModel == null)
                                            ? ListTile(
                                                onTap: () {
                                                  _shippingModalBottomSheet(
                                                      context);
                                                },
                                                dense: true,
                                                title: CustomText(
                                                    text: 'Jasa Pengiriman',
                                                    weight: FontWeight.w600),
                                                trailing:
                                                    Icon(Icons.chevron_right))
                                            : ListTile(
                                                onTap: () {
                                                  _shippingModalBottomSheet(
                                                      context);
                                                },
                                                dense: true,
                                                leading:
                                                    Icon(Icons.local_shipping),
                                                title: CustomText(
                                                  text:
                                                      '${shippingModel.type} (${shippingModel.duration})',
                                                  weight: FontWeight.w600,
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CustomText(
                                                        text:
                                                            shippingModel.name),
                                                    CustomText(
                                                        text: NumberFormat
                                                                .currency(
                                                                    locale:
                                                                        'id',
                                                                    symbol:
                                                                        'Rp',
                                                                    decimalDigits:
                                                                        0)
                                                            .format(0),
                                                        color: Colors.red)
                                                  ],
                                                ),
                                                trailing:
                                                    Icon(Icons.chevron_right),
                                              ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Divider(),
                                      SizedBox(height: 5.0),
                                      ButtonBar(
                                          mainAxisSize: MainAxisSize.max,
                                          alignment:
                                              MainAxisAlignment.spaceBetween,
                                          buttonPadding: EdgeInsets.all(0),
                                          children: <Widget>[
                                            CustomText(
                                              text: 'Subtotal untuk Produk',
                                              weight: FontWeight.w500,
                                            ),
                                            CustomText(
                                              text: NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp',
                                                      decimalDigits: 0)
                                                  .format(subTotalCart),
                                              color: Colors.red,
                                            )
                                          ]),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : Card(
                            margin: const EdgeInsets.all(0),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Icon(Icons.store, color: grey),
                                    SizedBox(width: 5.0),
                                    CustomText(
                                        text: '${widget.productModel.userName}',
                                        weight: FontWeight.w600)
                                  ]),
                                  Divider(),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CustomText(
                                        text: widget.quantity.toString() + 'x',
                                        color: grey,
                                        size: 18,
                                        weight: FontWeight.w600,
                                      ),
                                      SizedBox(width: 16.0),
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            color: white,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${widget.productModel.image}"),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 2.0),
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 16.0,
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
                                              text: widget.productModel.name,
                                              line: 2,
                                              over: TextOverflow.ellipsis,
                                              weight: FontWeight.w500,
                                            ),
                                            SizedBox(height: 5.0),
                                            CustomText(
                                              text: NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp',
                                                decimalDigits: 0,
                                              ).format(
                                                  widget.productModel.price),
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Divider(),
                                  SizedBox(height: 5.0),
                                  Card(
                                    margin: const EdgeInsets.all(0),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side:
                                          BorderSide(color: green, width: 1.0),
                                    ),
                                    child: (shippingModel == null)
                                        ? ListTile(
                                            onTap: () {
                                              _shippingModalBottomSheet(
                                                  context);
                                              print(
                                                  "${userProvider.userById.shippingModel.length}");
                                            },
                                            dense: true,
                                            title: CustomText(
                                                text: 'Jasa Pengiriman',
                                                weight: FontWeight.w600),
                                            trailing: Icon(Icons.chevron_right))
                                        : ListTile(
                                            onTap: () {
                                              _shippingModalBottomSheet(
                                                  context);
                                              print(
                                                  "${userProvider.userById.shippingModel.length}");
                                            },
                                            dense: true,
                                            isThreeLine: true,
                                            leading: Icon(Icons.local_shipping),
                                            title: CustomText(
                                              text:
                                                  '${shippingModel.type} (${shippingModel.duration})',
                                              weight: FontWeight.w600,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                CustomText(
                                                    text: shippingModel.name),
                                                CustomText(
                                                    text: NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp',
                                                      decimalDigits: 0,
                                                    ).format(
                                                        shippingModel.price),
                                                    color: Colors.red)
                                              ],
                                            ),
                                            trailing: Icon(Icons.chevron_right),
                                          ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Divider(),
                                  SizedBox(height: 5.0),
                                  ButtonBar(
                                    mainAxisSize: MainAxisSize.max,
                                    alignment: MainAxisAlignment.spaceBetween,
                                    buttonPadding: EdgeInsets.all(0),
                                    children: <Widget>[
                                      CustomText(
                                        text: 'Subtotal untuk Produk',
                                        weight: FontWeight.w500,
                                      ),
                                      CustomText(
                                        text: NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp',
                                          decimalDigits: 0,
                                        ).format(subTotalSingleProduct),
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    Divider(),
                    SizedBox(height: 10.0),
                    CustomText(
                      text: 'Metode Pembayaran',
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 5.0),
                    Card(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(
                        onTap: () {
                          // _paymentModalBottomSheet(context);
                        },
                        dense: true,
                        title: CustomText(
                          text: 'Points',
                          size: 12.0,
                          weight: FontWeight.w600,
                        ),
                        trailing: Image.asset("assets/icons/pointColor.png"),
                      ),
                    ),
                  ],
                ),
              )),
              bottomNavigationBar: Container(
                height: 80.0,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -3),
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomText(text: "Total Pembayaran"),
                          CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format((widget.productModel == null)
                                    ? (shippingModel == null)
                                        ? total
                                        : total + shippingModel.price
                                    : (shippingModel == null)
                                        ? total = subTotalSingleProduct
                                        : total = subTotalSingleProduct +
                                            shippingModel.price),
                            size: 16.0,
                            color: Colors.red,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 48.0,
                        child: FlatButton(
                          color: green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                              text: 'Beli',
                              color: white,
                              size: 16.0,
                              weight: FontWeight.w700),
                          onPressed: () {
                            if (userProvider.userModel.point < total) {
                              _sorryModalBottomSheet(context);
                            } else {
                              save();
                            }
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

  void _addressModalBottomSheet(context) {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    addressProvider.loadUserAddress(widget.userModel.id);
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: black)),
              title: CustomText(
                text: 'Daftar Alamat',
                color: black,
                size: 18.0,
                weight: FontWeight.w600,
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddressList(userModel: widget.userModel),
                    ),
                  );
                },
                child: CustomText(
                  text: 'Tambah',
                  color: blue,
                  weight: FontWeight.w600,
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8.0),
                itemCount: addressProvider.userAddress.length,
                itemBuilder: (_, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          addressModel = addressProvider.userAddress[index];
                        });
                      },
                      title: CustomText(
                        text: addressProvider.userAddress[index].addressLabel,
                        size: 12.0,
                        weight: FontWeight.w600,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomText(
                            text: addressProvider
                                .userAddress[index].recipientsName,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          CustomText(
                            text: '62' +
                                addressProvider.userAddress[index].phoneNumber
                                    .toString(),
                            size: 12.0,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          CustomText(
                            text:
                                '${addressProvider.userAddress[index].addressDetail}, ${addressProvider.userAddress[index].subDistrict}, ${addressProvider.userAddress[index].city}, ${addressProvider.userAddress[index].province}, ${addressProvider.userAddress[index].postalCode}',
                            size: 12.0,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _shippingModalBottomSheet(context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // (widget.productModel == null)
    //     ? userProvider.loadUserById(widget.productCartModel[0].storeOwnerId)
    //     : userProvider.loadUserById(widget.productModel.userId);
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: black),
              ),
              title: CustomText(
                text: 'Jasa Pengiriman',
                color: black,
                size: 18.0,
                weight: FontWeight.w600,
              ),
            ),
            Divider(),
            Expanded(
              child: (userProvider.userById?.shippingModel != null)
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: userProvider.userById?.shippingModel?.length,
                      itemBuilder: (_, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            dense: true,
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                shippingModel =
                                    userProvider.userById.shippingModel[index];
                              });
                            },
                            title: CustomText(
                              text:
                                  '${userProvider.userById?.shippingModel[index].type} (${userProvider.userById?.shippingModel[index].duration})',
                              weight: FontWeight.w600,
                            ),
                            subtitle: CustomText(
                              text: userProvider
                                  .userById?.shippingModel[index].name,
                            ),
                            trailing: CustomText(
                              text: NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp',
                                decimalDigits: 0,
                              ).format(userProvider
                                  .userById?.shippingModel[index].price),
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CustomText(
                        text: "Tidak Ada Pilihan Pengiriman",
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  void _sorryModalBottomSheet(context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 2.2,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/verifailed.png"),
                  ),
                  SizedBox(height: 16.0),
                  CustomText(
                    text: 'Yahh! Poinmu kurang nih',
                    size: 18.0,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(
                    text:
                        'Kamu tidak dapat melanjutkan pembelian karena Poinmu tidak mencukupi.',
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: FlatButton(
                      color: green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CustomText(
                        text: 'OKE',
                        color: white,
                        size: 16.0,
                        weight: FontWeight.w700,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void save() async {
    final addressProvider = Provider.of<AddressProvider>(
      context,
      listen: false,
    );
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    final productOrdersProvider = Provider.of<ProductOrderProvider>(
      context,
      listen: false,
    );
    setState(() {
      loading = true;
    });
    if (addressProvider.userAddress.isEmpty) {
      _addressModalBottomSheet(context);
      setState(() {
        loading = false;
      });
    } else if (shippingModel == null) {
      _shippingModalBottomSheet(context);
      setState(() {
        loading = false;
      });
    } else if (userProvider.userModel.point < total) {
      _sorryModalBottomSheet(context);
      setState(() {
        loading = false;
      });
    } else {
      productOrdersProvider.addProductOrders(
        userId: widget.userModel.id,
        address: (addressModel == null)
            ? '${addressProvider.userAddress[0].addressDetail}, ${addressProvider.userAddress[0].subDistrict}, ${addressProvider.userAddress[0].city}, ${addressProvider.userAddress[0].province} ${addressProvider.userAddress[0].postalCode}'
            : '${addressModel.addressDetail}, ${addressModel.subDistrict}, ${addressModel.city}, ${addressModel.province} ${addressModel.postalCode}',
        shipping: shippingModel.name + " - " + shippingModel.type,
        shippingPrice: shippingModel.price,
        productModel: widget.productModel,
        quantity: widget.quantity,
        subTotalProduct: subTotalSingleProduct,
        total: total,
        note: "",
        status: "Dikemas",
      );
      _userService.updateUserData({
        "uid": widget.userModel.id,
        "point": userProvider.userModel.point - total});
      print('Saved!');
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }
  }
}
