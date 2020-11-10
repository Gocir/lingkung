import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lingkung/models/addressModel.dart';
import 'package:lingkung/services/addressService.dart';
import 'package:uuid/uuid.dart';

class AddressProvider with ChangeNotifier {
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  LatLng _lastPosition = _initialPosition;
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  GoogleMapController _mapController;
  // CameraPosition _camPosition;
  String titleCurrentAddress;
  String currentAddress;
  bool locationServiceActive = true;
  
  AddressServices _addressService = AddressServices();
  AddressModel _addressModel;
  List<AddressModel> addresses = [];
  List<AddressModel> userAddress = [];
  List<AddressModel> addressByReceive = [];
  List<String> documents = [];

  // Getter
  // AddresServices get googleMapsServices => _googleMapsServices;
  AddressModel get addressModel => _addressModel;
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;
  GoogleMapController get mapController => _mapController;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polyLines => _polyLines;

  AddressProvider.initialize() {
    getUserLocation();
    _loadingInitialPosition();
    loadAddress();
  }

  // CREATE NEW ADDRESS
  Future<void> addAddress({String userId, String addressLabel,
      String recipientsName,
      String phoneNumber,
      String province,
      String city,
      String subDistrict,
      int postalCode,
      String addressDetail}) async {
    try {
      var uuid = Uuid();
      String addressId = uuid.v4();
      Map<String, dynamic> address = {
        "id": addressId,
        "userId": userId,
        "addressLabel": addressLabel,
        "recipientsName": recipientsName,
        "phoneNumber": phoneNumber,
        "province": province,
        "city": city,
        "subDistrict": subDistrict,
        "postalCode": postalCode,
        "addressDetail": addressDetail,
        "isPrimary": false,
        "isCheck": false,
      };
      
      _addressService.createAddress(data: address);

      print("USER ID IS: ${userId.toString()}");
      print("CART ITEM IS: ${address.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  // UPDATE ADDRESS
  Future<void> updateAddress({String userId,
      String id,
      String addressLabel,
      String recipientsName,
      String phoneNumber,
      String province,
      String city,
      String subDistrict,
      int postalCode,
      String addressDetail}) async {
    try {
      
      Map<String, dynamic> address = {
        "id": id,
        "userId": userId,
        "addressLabel": addressLabel,
        "recipientsName": recipientsName,
        "phoneNumber": phoneNumber,
        "province": province,
        "city": city,
        "subDistrict": subDistrict,
        "postalCode": postalCode,
        "addressDetail": addressDetail,
        "isPrimary": false,
        "isCheck": false,
      };
      
      _addressService.updateAddress(data: address);

      print("USER ID IS: ${addressModel.userId.toString()}");
      print("CART ITEM IS: ${address.toString()}");
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  // ! TO GET THE USERS LOCATION
  Future<void> getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> p = await Geolocator()
            .placemarkFromCoordinates(position.latitude, position.longitude);
    _initialPosition = LatLng(position.latitude, position.longitude);
    print("the latitude is: ${position.longitude} and th longitude is: ${position.longitude} ");
    print("initial position is : ${_initialPosition.toString()}");
    Placemark placemark = p[0];
    titleCurrentAddress = "${placemark.thoroughfare}";
    currentAddress = "${placemark.thoroughfare}, ${placemark.subThoroughfare}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}";
    _addMarker(_initialPosition, titleCurrentAddress);
    notifyListeners();
  }

  // ! TO CREATE ROUTE
  void createRoute(String encondedPoly) {
    _polyLines.add(Polyline(
        polylineId: PolylineId(_lastPosition.toString()),
        width: 10,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.black));
    notifyListeners();
  }

  // ! ADD A MARKER ON THE MAP
  void _addMarker(LatLng location, String address) {
    _markers.add(Marker(
        draggable: true,
        onDragEnd: (value) {
          print(value.latitude);
          print(value.longitude);
        },
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: location.toString()),
        icon: BitmapDescriptor.defaultMarker));
    notifyListeners();
  }

  // ! CREATE LATLNG LIST
  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  // !DECODE POLY
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  // ! SEND REQUEST
  // void sendRequest(String intendedLocation) async {
  //   List<Placemark> placemark =
  //       await Geolocator().placemarkFromAddress(intendedLocation);
  //   double latitude = placemark[0].position.latitude;
  //   double longitude = placemark[0].position.longitude;
  //   LatLng destination = LatLng(latitude, longitude);
  //   _addMarker(destination, intendedLocation);
  //   // String route = await _googleMapsServices.getRouteCoordinates(
  //   //     _initialPosition, destination);
  //   // createRoute(route);
  //   notifyListeners();
  // }

  // ! ON CAMERA MOVE
  void onCameraMove(CameraPosition cameraPosition) {
    _initialPosition = cameraPosition.target;
    notifyListeners();
  }

  // ! ON CREATE
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // _mapController.animateCamera(CameraUpdate.newCameraPosition(_camPosition));
    notifyListeners();
  }

//  LOADING INITIAL POSITION
  void _loadingInitialPosition()async{
    await Future.delayed(Duration(seconds: 5)).then((v) {
      if(_initialPosition == null){
        locationServiceActive = false;
        notifyListeners();
      }
    });
  }

  // void getProvince() async {
  //   final response = await http
  //       .get(baseUrl + "getProvince1"); //untuk melakukan request ke webservice
  //   var listData = jsonDecode(response.body); //lalu kita decode hasil datanya
  //   setState(() {
  //     dataProvince = listData; // dan kita set kedalam variable dataProvince
  //   });
  //   print("Data Province : $listData");
  // }

  // void getCity(String idProvince) async {
  //   final response =
  //       await http.post(baseUrl + "getCity", body: {'id': idProvince});

  //   var listData = jsonDecode(response.body);
  //   setState(() {
  //     dataCity = listData;
  //   });
  //   print("Data City : $listData");
  // }

  loadAddress() async {
    addresses = await _addressService.getAddress();
    notifyListeners();
  }

  loadAddressByDoc(String userId, String docId) async {
    _addressModel =
        await _addressService.getAddressByDoc(userId: userId, docId: docId);
  }

  loadTrashByReceive(String userId, String addressId) async {
    addressByReceive =
        await _addressService.getAddressByReceive(addressId: addressId);
  }
  
  loadUserAddress(String userId) async {
    userAddress =
        await _addressService.getUserAddress(userId: userId);
        notifyListeners();
  }

  getDocument(String userId) async {
    documents = await _addressService.getDocument(userId: userId);
    notifyListeners();
  }
}