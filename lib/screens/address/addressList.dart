import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/address/address.dart';
import 'package:lingkung/screens/address/updateAddress.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class AddressList extends StatefulWidget {
  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          iconTheme: IconThemeData(color: black),
          title: CustomText(
            text: 'Daftar Alamat',
            color: black,
            size: 18.0,
            weight: FontWeight.w600,
          ),
          titleSpacing: 0,
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Address(),
                      ));
                },
                child: CustomText(
                  text: 'Tambah',
                  color: blue,
                ))
          ],
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            itemCount: userProvider.userModel.addressModel.length,
            itemBuilder: (_, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                          isThreeLine: true,
                          title: CustomText(
                            text: userProvider
                                .userModel.addressModel[index].addressLabel,
                            weight: FontWeight.w600,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                text: userProvider.userModel.addressModel[index]
                                    .recipientsName,
                                weight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              CustomText(
                                text: '62' +
                                    userProvider
                                        .userModel.addressModel[index].phoNumber
                                        .toString(),
                                size: 12.0,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              CustomText(
                                text:
                                    '${userProvider.userModel.addressModel[index].addressDetail}, ${userProvider.userModel.addressModel[index].subDistrict}, ${userProvider.userModel.addressModel[index].city}, ${userProvider.userModel.addressModel[index].province}, ${userProvider.userModel.addressModel[index].posCode}',
                                size: 12.0,
                              ),
                            ],
                          )),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45.0,
                            child: RaisedButton(
                              color: green,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: CustomText(
                                      text: 'Perbarui Alamat',
                                      color: white,
                                      weight: FontWeight.w700)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateAddress(
                                          addressModel: userProvider
                                              .userModel.addressModel[index]),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            }));
  }
}
