class AppApi {
  static const String baseUrl = "http://localhost:8085/";
  static const String loginUrl = "${baseUrl}Auth/login";

  static const String registerUrl = "${baseUrl}Auth/register";
  static const String getEnfantsByParent =
      "$baseUrl/enfants/listEnfantsParParent";
}
