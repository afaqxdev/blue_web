class DataModalRoute {
  String route;
  String status;
  bool action;

  DataModalRoute({
    required this.route,
    required this.status,
    required this.action,
  });
}

final List<Map<String, List<DataModalRoute>>> routeDataModelList = [
  {
    'Karachi': [
      DataModalRoute(route: 'C001A2', status: 'Not Available', action: false),
      DataModalRoute(route: 'C001A3', status: 'Not Available', action: true),
      DataModalRoute(route: 'C001A24', status: 'Available', action: false),
    ],
    'Islamabd': [
      DataModalRoute(route: 'C001A25', status: 'Available', action: true),
      DataModalRoute(route: 'C001A32', status: 'Not Available', action: true),
      DataModalRoute(route: 'C001A23', status: 'Available', action: false),
    ],
    'Peshawar': [
      DataModalRoute(route: 'C001A45', status: 'Not Available', action: true),
      DataModalRoute(route: 'C001A11', status: 'Not Available', action: true),
      DataModalRoute(route: 'C001A23', status: 'Available', action: false),
    ],
    'Mengora': [
      DataModalRoute(route: 'C001B232', status: 'Not Available', action: true),
      DataModalRoute(route: 'C001C2', status: 'Available', action: true),
      DataModalRoute(route: 'C001D22', status: 'Not Available', action: false),
    ],
  },
];
