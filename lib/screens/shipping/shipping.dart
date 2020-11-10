import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class ManipulateShipping extends StatefulWidget {
  @override
  _ManipulateShippingState createState() => _ManipulateShippingState();
}

class _ManipulateShippingState extends State<ManipulateShipping> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  // List<ShippingModel> shippingModel;
  // List<String> expeditionBrand = [
  //   "anterAjaReg",
  //   "siCepatReg",
  //   "siCepatBest",
  //   "siCepatHalu",
  //   "jneReg",
  //   "jneOke",
  //   "jneYes",
  //   "jneTrucking",
  //   "jntExpressReg",
  //   "goSendSameDay",
  //   "goSendInstant",
  //   "grabExpressInstant",
  //   "grabExpressSameDay",
  //   "lionParcelReg",
  //   "ninjaExpressReg",
  //   "posKilatKhusus",
  //   "tikiReg",
  //   "tikiOverNightService",
  //   "wahanaNormalService",
  //   "cod"
  // ];

  bool _anterAjaReg = false;
  bool _siCepatReg = false;
  bool _siCepatBest = false;
  bool _siCepatHalu = false;
  bool _jneReg = false;
  bool _jneOke = false;
  bool _jneYes = false;
  bool _jneTrucking = false;
  bool _jntExpressReg = false;
  bool _goSendSameDay = false;
  bool _goSendInstant = false;
  bool _grabExpressInstant = false;
  bool _grabExpressSameDay = false;
  bool _lionParcelReg = false;
  bool _ninjaExpressReg = false;
  bool _posKilatKhusus = false;
  bool _tikiReg = false;
  bool _tikiOverNightService = false;
  bool _wahanaNormalService = false;
  bool _cod = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return loading
        ? Loading()
        : SafeArea(
            top: false,
            child: Scaffold(
              key: _scaffoldStateKey,
              backgroundColor: white,
              appBar: AppBar(
                backgroundColor: white,
                elevation: 0,
                iconTheme: IconThemeData(color: black),
                title: CustomText(
                  text: 'Jasa Pengiriman',
                  color: black,
                  size: 18.0,
                  weight: FontWeight.w600,
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.help_outline_outlined, color: black),
                      onPressed: () {})
                ],
              ),
              body: Column(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'AnterAja Reguler',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _anterAjaReg,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'SiCepat Reguler',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _siCepatReg,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'SiCepat Halu',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _siCepatHalu,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'SiCepat Best',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _siCepatBest,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'JNE Reguler',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _jneReg,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'JNE Oke',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _jneOke,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'JNE Yes',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _jneYes,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'JNE Trucking',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _jneTrucking,
                        onChanged: (value) {},
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: CustomText(
                        text: 'JNT Express Reguler',
                        weight: FontWeight.w600,
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: blue,
                        value: _jntExpressReg,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ).toList(),
              ),
              // ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     padding: const EdgeInsets.all(8.0),
              //     itemCount: userProvider.userModel.shippingModel.length,
              //     itemBuilder: (_, index) {
              //       return Card(
              //           child: ListTile(
              //               // dense: true,
              //               title: CustomText(
              //                 text: userProvider
              //                     .userModel.shippingModel[index].name,
              //                 weight: FontWeight.w600,
              //               ),
              //               trailing: CupertinoSwitch(
              //                   activeColor: yellow,
              //                   value: userProvider.userModel
              //                       .shippingModel[index].isCheck,
              //                   onChanged: (bool value) {
              //                     setState(() {
              //                       userProvider
              //                           .userModel
              //                           .shippingModel[index]
              //                           .isCheck = value;
              //                     });
              //                   })));
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     CustomText(text: userProvider.userModel.shippingModel[index].name),
              //     CupertinoSwitch(
              //         activeColor: yellow,
              //         value: userProvider.userModel.shippingModel[index].isCheck,
              //         onChanged: (bool value) {
              //           setState(() {
              //             userProvider.userModel.shippingModel[index].isCheck = value;
              //           });
              //         })
              //   ],
              // );
              // })

              //       SizedBox(height: 30.0),
              //       Container(
              //           height: 45.0,
              //           child: RaisedButton(
              //               color: green,
              //               elevation: 2.0,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(20)),
              //               child: Center(
              //                 child: CustomText(
              //                     text: 'SIMPAN',
              //                     color: white,
              //                     weight: FontWeight.w700),
              //               ),
              //               onPressed: () async {
              //                 bool value = await userProvider.addShipping(
              //                   name: name,
              //                   isCheck: isCheck
              //                     // anterAjaReg: anterAjaReg,
              //                     // siCepatReg: siCepatReg,
              //                     // siCepatBest: siCepatBest,
              //                     // siCepatHalu: siCepatHalu,
              //                     // jneReg: jneReg,
              //                     // jneOke: jneOke,
              //                     // jneYes: jneYes,
              //                     // jneTrucking: jneTrucking,
              //                     // jntExpressReg: jntExpressReg,
              //                     // goSendSameDay: goSendSameDay,
              //                     // goSendInstant: goSendInstant,
              //                     // grabExpressInstant: grabExpressInstant,
              //                     // grabExpressSameDay: grabExpressSameDay,
              //                     // lionParcelReg: lionParcelReg,
              //                     // ninjaExpressReg: ninjaExpressReg,
              //                     // posKilatKhusus: posKilatKhusus,
              //                     // tikiReg: tikiReg,
              //                     // tikiOverNightService: tikiOverNightService,
              //                     // wahanaNormalService: wahanaNormalService,
              //                     // cod: cod
              //                     );
              //                 if (value) {
              //                   print("Shipping Saved!");
              //                   _scaffoldStateKey.currentState
              //                       .showSnackBar(SnackBar(
              //                           content: CustomText(
              //                     text: "Saved!",
              //                     color: white,
              //                     weight: FontWeight.w600,
              //                   )));
              //                   userProvider.reloadUserModel();
              //                   setState(() {
              //                     loading = false;
              //                   });
              //                   Navigator.pop(context);
              //                 } else {
              //                   print("Shipping failed to Save!");
              //                   setState(() {
              //                     loading = false;
              //                   });
              //                 }
              //               })),
            ),
          );
  }
}
