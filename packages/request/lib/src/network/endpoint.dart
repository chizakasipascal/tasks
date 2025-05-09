class EndPoint {
  EndPoint._();
  static const String env =
      "development"; // Change to "production" for production environment

  static const String _baseUrl = "https://api.worklyn.com/";

  /// Endpoints
  static const String actionPoints = "$_baseUrl/konsul/actionPoints.list";
}
