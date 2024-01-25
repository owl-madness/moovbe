class DriverAddResponseModel {
  String? message;
  bool? status;

  DriverAddResponseModel({
    this.message,
    this.status,
  });

  factory DriverAddResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverAddResponseModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}

class DriverDeleteResponseModel {
  String? message;
  bool? status;

  DriverDeleteResponseModel({
    this.message,
    this.status,
  });

  factory DriverDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      DriverDeleteResponseModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
