class OMTransaction {
  final String status;
  final String message;
  final String? paymentUrl;

  OMTransaction({
    required this.status,
    required this.message,
    this.paymentUrl,
  });

  factory OMTransaction.fromJson(Map<String, dynamic> json) {
    return OMTransaction(
      status: json['status'] ?? 'unknown',
      message: json['message'] ?? '',
      paymentUrl: json['payment_url'],
    );
  }
}
