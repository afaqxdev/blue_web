List<CompanyResquest> companyResquest = [
  CompanyResquest(
      name: "Panda", classes: "H", branches: "233", visitperWeek: "12"),
  CompanyResquest(
      name: "Panda", classes: "G", branches: "333", visitperWeek: "113"),
  CompanyResquest(
      name: "Panda", classes: "H", branches: "444", visitperWeek: "221"),
  CompanyResquest(
      name: "Panda", classes: "N", branches: "335", visitperWeek: "3"),
  CompanyResquest(
      name: "Panda", classes: "B", branches: "324", visitperWeek: "4"),
  CompanyResquest(
      name: "Panda", classes: "F", branches: "143", visitperWeek: "64"),
  CompanyResquest(
      name: "Panda", classes: "H", branches: "987", visitperWeek: "77"),
];

class CompanyResquest {
  final String name;

  final String classes;
  final String branches;
  final String visitperWeek;

  CompanyResquest({
    required this.name,
    required this.classes,
    required this.branches,
    required this.visitperWeek,
  });
}
