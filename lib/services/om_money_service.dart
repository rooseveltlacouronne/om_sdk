import '../core/om_api_service.dart';
import '../models/om_transaction.dart';

class OMMoneyService {
  final _api = OMApiService();

  Future<OMTransaction> sendMoney({
    required String amount,
    required String phoneNumber,
    required String transactionId,
  }) async {
    final response = await _api.makePayment(
      amount: amount,
      phone: phoneNumber,
      externalId: transactionId,
    );

    return OMTransaction.fromJson(response);
  }
}
