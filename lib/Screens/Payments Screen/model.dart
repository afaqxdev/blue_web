class Payment {
  final String routesname;

  final String id;
  final String totalVist;

  final String deduction;
  final String next;
  final String amount;
  final String transfer;

  Payment({
    required this.routesname,
    required this.id,
    required this.amount,
    required this.totalVist,
    required this.deduction,
    required this.next,
    required this.transfer,
  });
}

List<Payment> paymentModel = [
  Payment(
    id: "1",
    amount: "12",
    routesname: "CQEOO2JJ",
    totalVist: "20",
    deduction: "12",
    next: "13",
    transfer: "14",
  ),
  Payment(
    id: "2",
    amount: "12",
    routesname: "ASDW23E",
    totalVist: "20",
    deduction: "12",
    next: "13",
    transfer: "14",
  ),
  Payment(
    id: "3",
    amount: "12",
    routesname: "LKJLQ3WE",
    totalVist: "20",
    deduction: "12",
    next: "13",
    transfer: "14",
  ),
  Payment(
    id: "4",
    amount: "12",
    routesname: "SFSDF212",
    totalVist: "20",
    deduction: "12",
    next: "13",
    transfer: "14",
  ),
];
