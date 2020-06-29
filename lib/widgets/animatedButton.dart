// import 'package:flutter/material.dart';
// class ButtonStyle {
//   final TextStyle initialTextStyle, finalTextStyle;
//   final Color primaryColor, secondaryColor;
//   final double elevation, borderRadius;

//   ButtonStyle(
//       {this.primaryColor,
//       this.secondaryColor,
//       this.initialTextStyle,
//       this.finalTextStyle,
//       this.elevation,
//       this.borderRadius});
// }
// enum ButtonState { SHOW_ONLY_TEXT, SHOW_ONLY_ICON }

// class AnimatedButton extends StatefulWidget {
//   final String initialText, finalText;
//   final ButtonStyle buttonStyle;
//   final IconData iconData;
//   final double iconSize;
//   final Duration animationDuration;
//   final Function onTap;

//   AnimatedButton(
//       {this.initialText,
//       this.finalText,
//       this.iconData,
//       this.iconSize,
//       this.animationDuration,
//       this.buttonStyle, this.onTap});

//   @override
//   _AnimatedButtonState createState() => _AnimatedButtonState();
// }

// class _AnimatedButtonState extends State<AnimatedButton> with TickerProviderStateMixin {
//   AnimationController _controller;
//   ButtonState _currentState;

//   @override
//   void initState() {
//     super.initState();
//     _currentState = ButtonState.SHOW_ONLY_TEXT;
//     _controller = AnimationController(vsync: this, duration: widget.animationDuration);
//     _controller.addListener(() {
//       bool selected = false;
//       if (selected == true) {
//         setState(() {
//           _currentState = ButtonState.SHOW_ONLY_ICON;
//         });
//       } else {
//         setState(() {
//           _currentState = ButtonState.SHOW_ONLY_TEXT;
//         });
//       }
//     });

//     _controller.addStatusListener((currentStatus) {
//       if (currentStatus == AnimationStatus.completed) {
//         return widget.onTap();
//       }
//     });

//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: widget.buttonStyle.elevation,
//       borderRadius:
//           BorderRadius.all(Radius.circular(widget.buttonStyle.borderRadius)),
//       child: GestureDetector(
//         onTap: () {
//           _controller.forward();
//         },
//         child: AnimatedContainer(
//           duration: widget.animationDuration,
//           height: widget.iconSize + 10,
//           decoration: BoxDecoration(
//             color: (_currentState == ButtonState.SHOW_ONLY_ICON)
//                 ? widget.buttonStyle.secondaryColor
//                 : widget.buttonStyle.primaryColor,
//             borderRadius: BorderRadius.all(
//                 Radius.circular(widget.buttonStyle.borderRadius)),
//           ),
//           padding: EdgeInsets.symmetric(
//             horizontal: 10.0,
//             vertical: 5.0,
//           ),
//           child: AnimatedSize(
//             vsync: this,
//             curve: Curves.easeIn,
//             duration: widget.animationDuration,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 (_currentState == ButtonState.SHOW_ONLY_ICON)
//                     ? Icon(
//                         widget.iconData,
//                         size: widget.iconSize,
//                         color: Colors.red,
//                       )
//                     : Container(),
//                 getTextWidget()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getTextWidget() {
//     if (_currentState == ButtonState.SHOW_ONLY_TEXT) {
//       return Text(
//         widget.initialText,
//         style: widget.buttonStyle.initialTextStyle,
//       );
//     } else {
//       return Container();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

class AnimatedButton extends StatelessWidget {
  final selected, onChange, textSelected, textUnselected;

  AnimatedButton(
      {this.textSelected, this.textUnselected, this.selected, this.onChange});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 250),
      crossFadeState:
          selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: RaisedButton(
        elevation: 0.0,
        color: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.cancel, color: Colors.red),
            Text(textSelected)
          ],
        ),
        onPressed: () {
          onChange(false);
        },
      ),
      secondChild: RaisedButton(
        elevation: 0.0,
        color: green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: CustomText(
            text: textUnselected, color: white, weight: FontWeight.w600),
        onPressed: () {
          onChange(true);
        },
      ),
    );
  }
}
