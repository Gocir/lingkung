// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:lingkung/utilities/colorStyle.dart';
// import 'package:lingkung/utilities/textStyle.dart';

// class UpdatePinpoint extends StatefulWidget {
//   @override
//   _UpdatePinpointState createState() => _UpdatePinpointState();
// }

// class _UpdatePinpointState extends State<UpdatePinpoint> {
//   GoogleMapController mapController;

//   static const _initialPosition = LatLng(-7.424278, 109.239637);
//   LatLng _lastPosition = _initialPosition;
//   final Set<Marker> _markers = {};

//   void onCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }

//   void _onCameraMove(CameraPosition cameraPosition) {
//     setState(() {
//       _lastPosition = cameraPosition.target;
//     });
//   }

//   void _onAddMarkerPressed() {
//     setState(() {
//       _markers.add(Marker(
//           markerId: MarkerId(_lastPosition.toString()),
//           position: _lastPosition,
//           infoWindow: InfoWindow(title: "I'm Here", snippet: "In Good Place"),
//           icon: BitmapDescriptor.defaultMarker));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: 250.0,
//         color: white,
//         child: Stack(children: <Widget>[
//           GoogleMap(
//               initialCameraPosition:
//                   CameraPosition(target: _initialPosition, zoom: 10.0),
//               mapType: MapType.normal,
//               compassEnabled: true,
//               myLocationEnabled: true,
//               zoomControlsEnabled: false,
//               onMapCreated: onCreated,
//               onCameraMove: _onCameraMove,
//               markers: _markers),
//           Center(
//               child: Container(
//                   height: 45.0,
//                   margin: const EdgeInsets.only(top: 140.0),
//                   child: FlatButton(
//                       color: white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: CustomText(
//                           text: 'Ubah Pinpoint', color: black, size: 12.0),
//                       onPressed: () {})))
//         ]));
//   }
// }
