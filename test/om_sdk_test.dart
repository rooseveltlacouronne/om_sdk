import 'package:flutter_test/flutter_test.dart';
import 'package:om_sdk/om_sdk.dart';

void main() {
  test('Test init configuration', () {
    OMConfig.init(
      clientIdParam: "testClientId",
      clientSecretParam: "testSecret",
      merchantKeyParam: "testMerchant",
      callbackUrlParam: "https://callback.com",
    );

    expect(OMConfig.clientId, "testClientId");
    expect(OMConfig.callbackUrl, "https://callback.com");
  });
}
