class CustomerDataModel {
  String name;
  String pricePerVisit;
  bool delete;
  bool edit;

  CustomerDataModel({
    required this.name,
    required this.pricePerVisit,
    required this.delete,
    required this.edit,
  });
}

List<CustomerDataModel> customerDataList = [
  CustomerDataModel(
      name: 'Muhammad Uzair', pricePerVisit: '121', edit: false, delete: false),
  CustomerDataModel(
      name: 'Afaq Zahir', pricePerVisit: '232', edit: false, delete: false),
  CustomerDataModel(
      name: 'Ubaid Ullah', pricePerVisit: '32', edit: false, delete: false),
  CustomerDataModel(
      name: 'Muhammad Uzair', pricePerVisit: '11', edit: false, delete: false),
  CustomerDataModel(
      name: 'Afaq Zahir', pricePerVisit: '21', edit: false, delete: false),
  CustomerDataModel(
      name: 'Ubaid Ullah', pricePerVisit: '1121', edit: false, delete: false),
  CustomerDataModel(
      name: 'Muhammad Uzair',
      pricePerVisit: '1541',
      edit: false,
      delete: false),
];
