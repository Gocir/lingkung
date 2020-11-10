import 'package:flutter/material.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/addressProvider.dart';
import 'package:lingkung/screens/address/address.dart';
import 'package:lingkung/screens/address/updateAddress.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:lingkung/services/addressService.dart';

class AddressList extends StatefulWidget {
  final UserModel userModel;
  AddressList({this.userModel});
  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  AddressServices _addressService = AddressServices();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    addressProvider.loadUserAddress(widget.userModel.id);
    return loading ? Loading() : SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          iconTheme: IconThemeData(color: white),
          title: CustomText(
            text: 'Daftar Alamat',
            color: white,
            size: 18.0,
            weight: FontWeight.w600,
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.help_outline), onPressed: () {})
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: green,
          icon: Icon(CupertinoIcons.add, size: 25.0),
          label: CustomText(
            text: 'Tambah',
            color: white,
            size: 14.0,
            weight: FontWeight.w600,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ManipulateAddress(userModel: widget.userModel),
              ),
            );
          },
        ),
        body: (addressProvider.userAddress.isNotEmpty)
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8.0),
                itemCount: addressProvider.userAddress.length,
                itemBuilder: (_, index) {
                  AddressModel address = addressProvider.userAddress[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          isThreeLine: true,
                          title: CustomText(
                            text: address.addressLabel,
                            weight: FontWeight.w600,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                  text: address.recipientsName,
                                  weight: FontWeight.w700),
                              SizedBox(height: 5.0),
                              CustomText(text: address.phoneNumber, size: 12.0),
                              SizedBox(height: 5.0),
                              CustomText(
                                text:
                                    '${address.addressDetail}, ${address.subDistrict}, ${address.city}, ${address.province}, ${address.postalCode}',
                                size: 12.0,
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            offset: Offset(0, 44.0),
                            elevation: 2,
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
                                      Navigator.pop(context);
                                      _deleteModalBottomSheet(context, address);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.delete),
                                        SizedBox(width: 5.0),
                                        CustomText(
                                          text: 'Hapus',
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 45.0,
                              child: FlatButton(
                                color: yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: 'Perbarui Alamat',
                                    color: white,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateAddress(
                                        addressModel: address,
                                        userModel: widget.userModel,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            : Center(
                child: CustomText(
                  text: 'Belum ada alamat yang ditambahkan',
                ),
              ),
      ),
    );
  }

  void _deleteModalBottomSheet(context, AddressModel address) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 311,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            isThreeLine: true,
                            title: CustomText(
                              text: address.addressLabel,
                              weight: FontWeight.w600,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(
                                    text: address.recipientsName,
                                    weight: FontWeight.w700),
                                SizedBox(height: 5.0),
                                CustomText(text: address.phoneNumber, size: 12.0),
                                SizedBox(height: 5.0),
                                CustomText(
                                  text:
                                      '${address.addressDetail}, ${address.subDistrict}, ${address.city}, ${address.province}, ${address.postalCode}',
                                  size: 12.0,
                                  line: 3,
                                  over: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    CustomText(
                      text: 'Yakin ingin menghapus alamat?',
                      size: 18.0,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            child: OutlineButton(
                              color: green,
                              highlightedBorderColor: green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              borderSide: BorderSide(color: green, width: 2.5),
                              child: CustomText(
                                text: 'TIDAK',
                                color: green,
                                size: 16.0,
                                weight: FontWeight.w700,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Container(
                            height: 48,
                            child: FlatButton(
                              color: green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: CustomText(
                                text: 'YA',
                                color: white,
                                size: 16.0,
                                weight: FontWeight.w700,
                              ),
                              onPressed: () async {
                                setState(() {  
                                  loading = true;
                                });
                                await _addressService.deleteAddress(
                                userId: widget.userModel.id,
                                docId: address.id);
                                print("Address deleted!");
                                setState(() {
                                  loading = false;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
