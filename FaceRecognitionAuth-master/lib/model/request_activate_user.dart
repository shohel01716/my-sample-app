class RequestActivateUser {
  RequestActivateUser({
      this.empKey, 
      this.lat, 
      this.lon, 
      this.pinNumber,
      this.imageData,});

  RequestActivateUser.fromJson(dynamic json) {
    empKey = json['empKey'];
    lat = json['lat'];
    lon = json['lon'];
    pinNumber = json['pin_number'];
    imageData = json['image_data'];
  }
  String? empKey;
  String? lat;
  String? lon;
  String? pinNumber;
  String? imageData;
RequestActivateUser copyWith({  String? empKey,
  String? lat,
  String? lon,
  String? imageData,
}) => RequestActivateUser(  empKey: empKey ?? this.empKey,
  lat: lat ?? this.lat,
  lon: lon ?? this.lon,
  imageData: imageData ?? this.imageData,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empKey'] = empKey;
    map['lat'] = lat;
    map['lon'] = lon;
    map['pin_number'] = pinNumber;
    map['image_data'] = imageData;
    return map;
  }

}