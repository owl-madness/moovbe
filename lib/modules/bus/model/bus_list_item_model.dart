class BusListResponseModel {
    List<BusListItemModel>? bus;
    bool? status;

    BusListResponseModel({
        this.bus,
        this.status,
    });

    factory BusListResponseModel.fromJson(Map<String, dynamic> json) => BusListResponseModel(
        bus: json["bus"] == null ? [] : List<BusListItemModel>.from(json["bus"]!.map((x) => BusListItemModel.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "bus": bus == null ? [] : List<dynamic>.from(bus!.map((x) => x.toJson())),
        "status": status,
    };
}

class BusListItemModel {
    int? id;
    String? image;
    String? name;
    String? type;
    String? driverName;
    String? driverLicenseNo;

    BusListItemModel({
        this.id,
        this.image,
        this.name,
        this.type,
        this.driverName,
        this.driverLicenseNo,
    });

    factory BusListItemModel.fromJson(Map<String, dynamic> json) => BusListItemModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        type: json["type"],
        driverName: json["driver_name"],
        driverLicenseNo: json["driver_license_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "type": type,
        "driver_name": driverName,
        "driver_license_no": driverLicenseNo,
    };
}
