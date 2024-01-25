class DriverListResponseModel {
    List<DriverListItemModel>? drivers;
    bool? status;

    DriverListResponseModel({
        this.drivers,
        this.status,
    });

    factory DriverListResponseModel.fromJson(Map<String, dynamic> json) => DriverListResponseModel(
        drivers: json["drivers"] == null ? [] : List<DriverListItemModel>.from(json["drivers"]!.map((x) => DriverListItemModel.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "drivers": drivers == null ? [] : List<dynamic>.from(drivers!.map((x) => x.toJson())),
        "status": status,
    };
}

class DriverListItemModel {
    int? id;
    String? name;
    String? mobile;
    String? licenseNo;

    DriverListItemModel({
        this.id,
        this.name,
        this.mobile,
        this.licenseNo,
    });

    factory DriverListItemModel.fromJson(Map<String, dynamic> json) => DriverListItemModel(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        licenseNo: json["license_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "license_no": licenseNo,
    };
}
