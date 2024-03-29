import 'package:flutter/foundation.dart';

import '../../Screens/Prices Screen/price_model.dart';
import '../../Screens/Violations Screen/model.dart';

class ViolationProvider extends ChangeNotifier {
  List<ViolationsModel> violationsModel = [
    ViolationsModel(
      id: "1",
      violation: "Uniform",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
    ViolationsModel(
      id: "2",
      violation: "Shelf Clean",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
    ViolationsModel(
      id: "3",
      violation: "Workflow Steps With",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
    ViolationsModel(
      id: "4",
      violation: "Entering From The W",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
    ViolationsModel(
      id: "5",
      violation: "Work Tools",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
    ViolationsModel(
      id: "6",
      violation: "Work Booklet",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
    ViolationsModel(
      id: "6",
      violation: "Hygien",
      violationprice: "150",
      delete: false,
      edit: false,
    ),
  ];

  List<ViolationsModel> get users => violationsModel;

  void updateDelete(ViolationsModel violationsModel, bool action) {
    violationsModel.delete = action;
    notifyListeners();
  }

  void updateEdit(ViolationsModel violationsModel, bool action) {
    violationsModel.edit = action;
    notifyListeners();
  }

  bool volition = false;
  void updateviolaton(bool action) {
    volition = action;
    notifyListeners();
  }

  bool palaty = false;
  void updatepalanty(bool action) {
    palaty = action;
    notifyListeners();
  }
}
