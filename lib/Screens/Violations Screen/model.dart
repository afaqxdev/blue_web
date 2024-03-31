class ViolationsModel {
  final String id;
  final String violation;
  final String violationprice;

  bool delete;
  bool edit;
  ViolationsModel({
    required this.violation,
    required this.id,
    required this.violationprice,
    required this.delete,
    required this.edit,
  });
}
