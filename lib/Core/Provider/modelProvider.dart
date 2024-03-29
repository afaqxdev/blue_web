import 'package:flutter/foundation.dart';

import '../../Screens/Reg & Status Screen/model.dart';

class UserTableModel extends ChangeNotifier {
  List<MenuModel> menuModel = [
    MenuModel(
        id: "1",
        name: "Afaq",
        age: "20",
        nationality: "pakistani",
        city: "peshawar",
        country: "pakistan",
        mobileNo: "1112333",
        action: false,
        status: "Accept"),
    MenuModel(
        id: "2",
        name: "Ubaid",
        age: "21",
        nationality: "Arbic",
        city: "KOhat",
        country: "UEA",
        mobileNo: "111233",
        action: false,
        status: "Accept"),
    MenuModel(
        id: "2",
        name: "UZair",
        age: "20",
        nationality: "pakistani",
        city: "peshawar",
        country: "pakistan",
        mobileNo: "1112333",
        action: false,
        status: "Accept"),
    MenuModel(
        id: "3",
        name: "Asim",
        age: "20",
        nationality: "pakistani",
        city: "peshawar",
        country: "pakistan",
        mobileNo: "1112333",
        action: false,
        status: "Accept"),
    MenuModel(
        id: "4",
        name: "Zahir",
        age: "20",
        nationality: "pakistani",
        city: "peshawar",
        country: "pakistan",
        mobileNo: "1112333",
        action: false,
        status: "Accept"),
  ];

  List<MenuModel> get users => menuModel;
  void updateUserStatus(MenuModel menuModel, String newStatus) {
    menuModel.status = newStatus;
    notifyListeners();
  }

  void updateHover(MenuModel menuModel, bool action) {
    menuModel.action = action;
    notifyListeners();
  }
}
