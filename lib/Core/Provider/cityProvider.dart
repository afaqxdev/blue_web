import 'package:flutter/foundation.dart';

import '../../Screens/Routes Screen/model.dart';

class RoutesProvider with ChangeNotifier {
  String _selectedCity = 'Karachi';
  bool action = false;
  List<DataModalRoute> _filteredRoutes =
      routeDataModelList.first['Karachi'] ?? [];

  String get selectedCity => _selectedCity;
  List<DataModalRoute> get filteredRoutes => _filteredRoutes;

  void setSelectedCity(String city) {
    _selectedCity = city;
    _filteredRoutes = routeDataModelList.first[city] ?? [];
    notifyListeners();
  }
}
