import 'dart:convert';
import 'package:http/http.dart' as http;
import 'om_config.dart';

class OMApiService {
  Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse("https://api.orange.com/oauth/v3/token"),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('${OMConfig.clientId}:${OMConfig.clientSecret}'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    );

    final json = jsonDecode(response.body);
    return json['access_token'];
  }

  Future<Map<String, dynamic>> makePayment({
    required String amount,
    required String phone,
    required String externalId,
  }) async {
    final token = await getAccessToken();
    final url = OMConfig.isSandbox
        ? "https://api.orange.com/orange-money-webpay/sandbox/v1/webpayment"
        : "https://api.orange.com/orange-money-webpay/ci/v1/webpayment";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "X-Callback-Url": OMConfig.callbackUrl,
        "X-Reference-Id": externalId,
        "X-Target-Environment": OMConfig.isSandbox ? "sandbox" : "production",
      },
      body: jsonEncode({
        "amount": amount,
        "currency": "XOF",
        "externalId": externalId,
        "payer": {
          "partyIdType": "MSISDN",
          "partyId": phone
        },
        "payerMessage": "Paiement via SDK",
        "payeeNote": "OM SDK"
      }),
    );

    return jsonDecode(response.body);
  }
}
