class MenuModel {
  final String id;
  final String name;
  final String age;
  final String nationality;
  final String mobileNo;
  final String country;
  final String city;
  String status;
  bool action;
  MenuModel(
      {required this.name,
      required this.id,
      required this.age,
      required this.nationality,
      required this.action,
      required this.city,
      required this.country,
      required this.mobileNo,
      required this.status});
}
