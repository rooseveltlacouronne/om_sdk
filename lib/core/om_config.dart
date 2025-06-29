class OMConfig {
  static String clientId = "";
  static String clientSecret = "";
  static String merchantKey = "";
  static String callbackUrl = "";
  static bool isSandbox = true;

  static void init({
    required String clientIdParam,
    required String clientSecretParam,
    required String merchantKeyParam,
    required String callbackUrlParam,
    bool sandbox = true,
  }) {
    clientId = clientIdParam;
    clientSecret = clientSecretParam;
    merchantKey = merchantKeyParam;
    callbackUrl = callbackUrlParam;
    isSandbox = sandbox;
  }
}
