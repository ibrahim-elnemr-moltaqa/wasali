import '../../../../../core/core.dart';
import 'api_user_model.dart';

class ApiLoggedUserResponse {
  final String accessToken;
  final ApiUserModel? user;

  const ApiLoggedUserResponse({
    required this.accessToken,
    this.user,
  });

  factory ApiLoggedUserResponse.fromJson(Map<String, dynamic> json) =>
      ApiLoggedUserResponse(
        accessToken: json["access_token"] ?? '',
        user: json["user"] != null ? ApiUserModel.fromJson(json["user"]) : null,
      );

  TokenModel get getTokenForSingleSession {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel.forSingleSession(token: accessToken);
  }

  factory ApiLoggedUserResponse.example() => ApiLoggedUserResponse(
        accessToken: "asdassssddasa",
        user: ApiUserModel.example(),
      );
  TokenModel get getAsValidTokenEntity {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel(token: accessToken);
  }
}
