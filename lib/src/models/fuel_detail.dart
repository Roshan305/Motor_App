class FuelDetail {
  final String amount;
  final String reason;
  final DateTime dateTime;
  final String user;

  FuelDetail({required this.amount, required this.reason, required this.dateTime, required this.user});

  factory FuelDetail.fromJson(Map<String, dynamic> json) {
    return FuelDetail(
      amount: json['amount'],
      reason: json['reason'],
      dateTime: DateTime.parse(json['dateTime']),
      user: json['user'],
    );
  }
}
