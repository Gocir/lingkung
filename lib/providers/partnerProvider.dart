import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//models
import 'package:lingkung/models/partnerModel.dart';
//services
import 'package:lingkung/services/partnerService.dart';

class PartnerProvider with ChangeNotifier {
  PartnerServices _partnerService = PartnerServices();
  PartnerModel _partnerModel;
  List<PartnerModel> partners = [];

  // getter
  PartnerModel get partnerModel => _partnerModel;

  PartnerProvider.initialize(){
   // print("mthrfcjer");
    loadPartner();
  }

  loadPartner() async {
    partners = await _partnerService.getPartner();
    notifyListeners();
  }

  loadSinglePartner(String partnerId) async{
    _partnerModel = await _partnerService.getPartnerById(id: partnerId);
    notifyListeners();
  }
}
