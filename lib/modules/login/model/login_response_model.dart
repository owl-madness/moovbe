class LoginResponseModel {
    bool? status;
    bool? user;
    String? message;
    String? accessToken;
    String? refreshToken;

    LoginResponseModel({
        this.status,
        this.user,
        this.message,
        this.accessToken,
        this.refreshToken,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        status: json["status"],
        user: json["user"],
        message: json["message"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user,
        "message": message,
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}
