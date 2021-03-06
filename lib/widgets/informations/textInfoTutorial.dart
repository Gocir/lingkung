import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lingkung/content/textInfoContent.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lingkung/widgets/webView.dart';

class TextInfoTutoriaList extends StatefulWidget {
  final ChromeSafariBrowser browser = MyChromeSafariBrowser(MyInAppBrowser());
  @override
  _TextInfoTutoriaListState createState() => _TextInfoTutoriaListState();
}

class _TextInfoTutoriaListState extends State<TextInfoTutoriaList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: textInfoTutorial.length,
      itemBuilder: (_, index) {
          return InkWell(
          onTap: () async {
                await widget.browser.open(
                    url: textInfoTutorial[index].linkUrl.toString(),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false)));
              },
          child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl:
                              textInfoTutorial[index].imageUrl.toString(),
                          imageBuilder: (context, imageProvider) => Container(
                              width: 110.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 3.0)
                                  ])),
                          placeholder: (context, url) => Container(
                            width: 110.0,
                            height: 90.0,
                            child: SpinKitThreeBounce(
                              color: black, size: 10.0)),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/noimage.png"),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              CustomText(
                                text:
                                    textInfoTutorial[index].name,
                                line: 3,
                                over: TextOverflow.ellipsis,
                                weight: FontWeight.w700,
                              ),
                              CustomText(
                                text: 'Sumber: ${textInfoTutorial[index].source}',
                                size: 12.0,
                                line: 1,
                                over: TextOverflow.fade,
                              ),
                              SizedBox(height: 5.0),
                              // Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: <Widget>[
                              //       CustomText(
                              //         text: 'Telusuri',
                              //         size: 12.0,
                              //         color: blue,
                              //         line: 1,
                              //         over: TextOverflow.fade,
                              //       ),
                              //       Icon(Icons.chevron_right,
                              //           size: 14.0, color: blue)
                              //     ])
                            ]))
                      ]))));
      });
  }
}
