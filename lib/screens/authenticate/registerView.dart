import 'package:country_code_picker/country_code_picker.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/screens/authenticate/loginView.dart';
import 'package:lingkung/screens/helps/helpRegisterList.dart';
import 'package:lingkung/services/userService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  UserServices _userService = UserServices();

  String dialCode;
  String smsCode;
  String verificationId;
  String errorMessage;
  String phoneNumber;
  bool loading = false;

  List<UserModel> userByPhone = [];

  void _onCountryChange(CountryCode countryCode) {
    //T0D0 : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
    setState(() {
      dialCode = countryCode.toString();
    });
  }

  void _onInitCountry(CountryCode countryCode) {
    //T0D0 : manipulate the selected country code here
    print("on init ${countryCode.dialCode} ${countryCode.name}");
    dialCode = countryCode.toString();
    print(dialCode);
  }

  void _phoneNumberChange(String number) {
    //T0D0 : manipulate the selected country code here
    phoneNumber = dialCode + number;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // userProvider.loadUserByPhone(phoneNumber);
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
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.help_outline),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelpRegisterList(),
                                ));
                          })
                    ]),
                body: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(
                                      text: 'Lengkapi data dirimu di-bawah ini',
                                      size: 22.0,
                                      weight: FontWeight.w700),
                                  SizedBox(height: 20.0),
                                  CustomText(
                                      text: 'Nama', weight: FontWeight.w700),
                                  TextFormField(
                                      controller: userProvider.userName,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(
                                          fontFamily: "Poppins", color: black),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          counterStyle: TextStyle(
                                              fontFamily: "Poppins",
                                              color: black),
                                          hintText: 'Contoh: Aksara Melinkung',
                                          hintStyle:
                                              TextStyle(fontFamily: "Poppins"),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: blue))),
                                      validator: (val) => val.isEmpty
                                          ? 'Berikan nama pengguna akun'
                                          : null),
                                  SizedBox(height: 16.0),
                                  CustomText(
                                      text: 'Email', weight: FontWeight.w700),
                                  TextFormField(
                                      controller: userProvider.email,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontFamily: "Poppins", color: black),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          counterStyle: TextStyle(
                                              fontFamily: "Poppins",
                                              color: black),
                                          hintText:
                                              'Contoh: karolingkung@mail.com',
                                          hintStyle:
                                              TextStyle(fontFamily: "Poppins"),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: blue))),
                                      validator: (val) => val.isEmpty
                                          ? 'Masukkan alamat email dengan benar'
                                          : null),
                                  SizedBox(height: 16.0),
                                  CustomText(
                                      text: 'Nomor HP',
                                      weight: FontWeight.w700),
                                  SizedBox(height: 5.0),
                                  Row(children: <Widget>[
                                    Container(
                                        width: 70.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey[200]),
                                        child: CountryCodePicker(
                                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                            onChanged: (countryCode) {
                                              _onCountryChange(countryCode);
                                            },
                                            initialSelection: 'ID',
                                            favorite: ['ID'],
                                            // optional. Shows only country name and flag
                                            showCountryOnly: true,
                                            // optional. Shows only country name and flag when popup is closed
                                            showOnlyCountryWhenClosed: false,
                                            // optional. aligns the flag and the Text left
                                            alignLeft: false,
                                            onInit: (countryCode) {
                                              _onInitCountry(countryCode);
                                            },
                                            searchDecoration: InputDecoration(
                                                isDense: true,
                                                prefixIcon: Icon(Icons.search),
                                                hintText: 'Ketik nama negara',
                                                hintStyle: TextStyle(
                                                    fontFamily: "Poppins"),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        borderSide: BorderSide(
                                                            color: blue))),
                                            searchStyle: TextStyle(
                                                fontFamily: "Poppins",
                                                color: black,
                                                fontSize: 16.0),
                                            textStyle: TextStyle(
                                                fontFamily: "Poppins",
                                                color: black),
                                            dialogTextStyle: TextStyle(
                                                fontFamily: "Poppins",
                                                color: black,
                                                fontSize: 16.0))),
                                    SizedBox(width: 10.0),
                                    Flexible(
                                        flex: 2,
                                        child: TextFormField(
                                            controller: userProvider
                                                .phoNumberLogin,
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              LengthLimitingTextInputFormatter(
                                                  11),
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: black),
                                            decoration: InputDecoration(
                                                isDense: true,
                                                counterStyle: TextStyle(
                                                    fontFamily: "Poppins",
                                                    color: black),
                                                hintText: 'Contoh: 81234567890',
                                                hintStyle: TextStyle(
                                                    fontFamily: "Poppins"),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blue))),
                                            onChanged: (String str) {
                                              _phoneNumberChange(str);
                                            },
                                            validator: (value) => (value
                                                    .isEmpty)
                                                ? 'Masukkan Nomor Ponsel-mu'
                                                : (value.length > 11 ||
                                                        value.length < 10)
                                                    ? 'Batas Miinimal Nomor Ponsel adalah 11'
                                                    : null))
                                  ])
                                ])))),
                bottomNavigationBar: Container(
                    height: 80.0,
                    color: white,
                    padding: const EdgeInsets.all(16.0),
                    child: FlatButton(
                        color: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: CustomText(
                            text: 'BUAT AKUN',
                            color: white,
                            weight: FontWeight.w700),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() =>
                              loading = true);

                            if (phoneNumber == null && userProvider.phoNumberLogin != null) {
                              phoneNumber = dialCode + userProvider.phoNumberLogin.text;
                            }

                            userByPhone = await _userService.getUserByPhone(phoNumberLogin: phoneNumber);
                            print('phoneNumber:' + phoneNumber);
                            print('ubp:' + userByPhone.isNotEmpty.toString());

                            if (userByPhone.isNotEmpty) {
                              setState(() =>
                                loading = false);
                              _registeredBottomSheet(context);
                            }
                            else {
                              userProvider.verify(
                                  context,
                                  phoneNumber,
                                  userProvider.userName.text,
                                  userProvider.email.text);
                              setState(() =>
                                loading = false);
                            }
                          }
                        }))));
  }

  void _registeredBottomSheet(context) {
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        context: context,
        builder: (BuildContext context) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              child:
                                  Image.asset("assets/images/verifailed.png")),
                          CustomText(
                              text:
                                  'Eh, sepertinya nomor kamu sudah terdaftar di Lingkung',
                              size: 18.0,
                              weight: FontWeight.w700),
                          SizedBox(height: 5.0),
                          CustomText(
                              text:
                                  'Nomor ini ${phoneNumber.toString()} sudah terdaftar di Lingkung. Mau coba masuk?'),
                          SizedBox(height: 20.0),
                          Row(children: [
                            Expanded(
                                child: Container(
                                    height: 45,
                                    child: OutlineButton(
                                        color: green,
                                        highlightedBorderColor: green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        borderSide: BorderSide(
                                                    color: green, width: 2.5),
                                        child: CustomText(
                                            text: 'TIDAK',
                                            color: green,
                                            size: 16.0,
                                            weight: FontWeight.w700),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }))),
                            SizedBox(width: 15.0),
                            Expanded(
                                child: Container(
                                    height: 45,
                                    child: FlatButton(
                                        color: green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: CustomText(
                                            text: 'YA, MASUK',
                                            color: white,
                                            size: 16.0,
                                            weight: FontWeight.w700),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginView()));
                                        })))
                          ])
                        ]))
              ]);
        });
  }
}
