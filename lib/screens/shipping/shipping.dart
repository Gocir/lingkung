import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//  Models
import 'package:lingkung/models/userModel.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class ManipulateShipping extends StatefulWidget {
  final UserModel userModel;
  ManipulateShipping({this.userModel});
  @override
  _ManipulateShippingState createState() => _ManipulateShippingState();
}

class _ManipulateShippingState extends State<ManipulateShipping> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

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
  void initState() {
    super.initState();

  }

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
                      onPressed: () {
                        
                      })
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Column(
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
                          onChanged: (value) {
                            setState(() {
                              _anterAjaReg = value;
                              if (_anterAjaReg == true) {
                                userProvider.manipulateShipping(
                                    id: "AnterAjaReg",
                                    name: "AnterAja",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 6000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "AnterAjaReg",
                                    name: "AnterAja",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 6000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _siCepatReg = value;
                              if (_siCepatReg == true) {
                                userProvider.manipulateShipping(
                                    id: "SiCepatReg",
                                    name: "SiCepat",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 6500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "SiCepatReg",
                                    name: "SiCepat",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 6500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _siCepatBest = value;
                              if (_siCepatBest == true) {
                                userProvider.manipulateShipping(
                                    id: "SiCepatBest",
                                    name: "SiCepat",
                                    type: "Best",
                                    duration: "3-4 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "SiCepatBest",
                                    name: "SiCepat",
                                    type: "Best",
                                    duration: "3-4 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _siCepatHalu = value;
                              if (_siCepatHalu == true) {
                                userProvider.manipulateShipping(
                                    id: "SiCepatHalu",
                                    name: "SiCepat",
                                    type: "Halu",
                                    duration: "1-2 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "SiCepatHalu",
                                    name: "SiCepat",
                                    type: "Halu",
                                    duration: "1-2 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _jneReg = value;
                              if (_jneReg == true) {
                                userProvider.manipulateShipping(
                                    id: "JNEReg",
                                    name: "JNE",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 7000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "JNEReg",
                                    name: "JNE",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 7000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _jneOke = value;
                              if (_jneOke == true) {
                                userProvider.manipulateShipping(
                                    id: "JNEOke",
                                    name: "JNE",
                                    type: "Oke",
                                    duration: "3-4 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "JNEOke",
                                    name: "JNE",
                                    type: "Oke",
                                    duration: "3-4 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _jneYes = value;
                              if (_jneYes == true) {
                                userProvider.manipulateShipping(
                                    id: "JNEYes",
                                    name: "JNE",
                                    type: "Yes",
                                    duration: "3-4 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "JNEYes",
                                    name: "JNE",
                                    type: "Yes",
                                    duration: "3-4 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _jneTrucking = value;
                              if (_jneTrucking == true) {
                                userProvider.manipulateShipping(
                                    id: "JNETrucking",
                                    name: "JNE",
                                    type: "Trucking",
                                    duration: "5-7 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "JNETrucking",
                                    name: "JNE",
                                    type: "Trucking",
                                    duration: "5-7 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _jntExpressReg = value;
                              if (_jntExpressReg == true) {
                                userProvider.manipulateShipping(
                                    id: "JNTExpressReg",
                                    name: "JNT",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "JNTExpressReg",
                                    name: "JNT",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'GoSend SameDay',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _goSendSameDay,
                          onChanged: (value) {
                            setState(() {
                              _goSendSameDay = value;
                              if (_goSendSameDay == true) {
                                userProvider.manipulateShipping(
                                    id: "GoSendSameDay",
                                    name: "GoSend",
                                    type: "SameDay",
                                    duration: "1-2 hari",
                                    price: 10000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "GoSendSameDay",
                                    name: "GoSend",
                                    type: "SameDay",
                                    duration: "1-2 hari",
                                    price: 10000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'GoSend Instant',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _goSendInstant,
                          onChanged: (value) {
                            setState(() {
                              _goSendInstant = value;
                              if (_goSendInstant == true) {
                                userProvider.manipulateShipping(
                                    id: "GoSendInstant",
                                    name: "GoSend",
                                    type: "Instant",
                                    duration: "2-3 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "GoSendInstant",
                                    name: "GoSend",
                                    type: "Instant",
                                    duration: "2-3 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'GrabExpress SameDay',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _grabExpressSameDay,
                          onChanged: (value) {
                            setState(() {
                              _grabExpressSameDay = value;
                              if (_grabExpressSameDay == true) {
                                userProvider.manipulateShipping(
                                    id: "GrabExpressSameDay",
                                    name: "GrabExpress",
                                    type: "SameDay",
                                    duration: "2-3 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "GrabExpressSameDay",
                                    name: "GrabExpress",
                                    type: "SameDay",
                                    duration: "2-3 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'GrabExpress Instant',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _grabExpressInstant,
                          onChanged: (value) {
                            setState(() {
                              _grabExpressInstant = value;
                              if (_grabExpressInstant == true) {
                                userProvider.manipulateShipping(
                                    id: "GrabExpressInstant",
                                    name: "GrabExpress",
                                    type: "Instant",
                                    duration: "2-3 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "GrabExpressInstant",
                                    name: "GrabExpress",
                                    type: "Instant",
                                    duration: "2-3 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'LionParcel Reguler',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _lionParcelReg,
                          onChanged: (value) {
                            setState(() {
                              _lionParcelReg = value;
                              if (_lionParcelReg == true) {
                                userProvider.manipulateShipping(
                                    id: "LionParcelReg",
                                    name: "LionParcel",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "LionParcelReg",
                                    name: "LionParcel",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'NinjaExpress Reguler',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _ninjaExpressReg,
                          onChanged: (value) {
                            setState(() {
                              _ninjaExpressReg = value;
                              if (_ninjaExpressReg == true) {
                                userProvider.manipulateShipping(
                                    id: "NinjaExpressReg",
                                    name: "NinjaExpress",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "NinjaExpressReg",
                                    name: "NinjaExpress",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 7500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'PosKilat Khusus',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _posKilatKhusus,
                          onChanged: (value) {
                            setState(() {
                              _posKilatKhusus = value;
                              if (_posKilatKhusus == true) {
                                userProvider.manipulateShipping(
                                    id: "PosKilatKhusus",
                                    name: "PosKilat",
                                    type: "Khusus",
                                    duration: "3-4 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "PosKilatKhusus",
                                    name: "PosKilat",
                                    type: "Khusus",
                                    duration: "3-4 hari",
                                    price: 9000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'Tiki Reguler',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _tikiReg,
                          onChanged: (value) {
                            setState(() {
                              _tikiReg = value;
                              if (_tikiReg == true) {
                                userProvider.manipulateShipping(
                                    id: "TikiReg",
                                    name: "Tiki",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 8500,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "TikiReg",
                                    name: "Tiki",
                                    type: "Reguler",
                                    duration: "5-7 hari",
                                    price: 8500,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'Tiki Over Night Service',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _tikiOverNightService,
                          onChanged: (value) {
                            setState(() {
                              _tikiOverNightService = value;
                              if (_tikiOverNightService == true) {
                                userProvider.manipulateShipping(
                                    id: "TikiOverNightService",
                                    name: "Tiki",
                                    type: "Over Night Service",
                                    duration: "2-3 hari",
                                    price: 10000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "TikiOverNightService",
                                    name: "Tiki",
                                    type: "Over Night Service",
                                    duration: "2-3 hari",
                                    price: 10000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'WahanaNormalService',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _wahanaNormalService,
                          onChanged: (value) {
                            setState(() {
                              _wahanaNormalService = value;
                              if (_wahanaNormalService == true) {
                                userProvider.manipulateShipping(
                                    id: "WahanaNormalService",
                                    name: "Wahana",
                                    type: "Normal Service",
                                    duration: "5-7 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "WahanaNormalService",
                                    name: "Wahana",
                                    type: "Normal Service",
                                    duration: "5-7 hari",
                                    price: 8000,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: CustomText(
                          text: 'COD',
                          weight: FontWeight.w600,
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: blue,
                          value: _cod,
                          onChanged: (value) {
                            setState(() {
                              _cod = value;
                              if (_cod == true) {
                                userProvider.manipulateShipping(
                                    id: "cashondelivery",
                                    name: "COD",
                                    type: "SameDay",
                                    duration: "1-2 hari",
                                    price: 0,
                                    userId: widget.userModel.id,
                                    status: "add");
                                print('Added!');
                              } else {
                                userProvider.manipulateShipping(
                                    id: "cashondelivery",
                                    name: "COD",
                                    type: "SameDay",
                                    duration: "1-2 hari",
                                    price: 0,
                                    userId: widget.userModel.id,
                                    status: "deleted");
                                print('Deleted!');
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ).toList(),
                ),
              ),
            ),
          );
  }
}
