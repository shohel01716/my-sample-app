class RequestConfirmLogin {
  RequestConfirmLogin({
      this.empKey, 
      this.lat, 
      this.lon, 
      this.mobile,});

  RequestConfirmLogin.fromJson(dynamic json) {
    empKey = json['empKey'];
    lat = json['lat'];
    lon = json['lon'];
    mobile = json['mobile'];
  }
  String? empKey;
  String? lat;
  String? lon;
  String? mobile;
RequestConfirmLogin copyWith({  String? empKey,
  String? lat,
  String? lon,
  String? mobile,
}) => RequestConfirmLogin(  empKey: empKey ?? this.empKey,
  lat: lat ?? this.lat,
  lon: lon ?? this.lon,
  mobile: mobile ?? this.mobile,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empKey'] = empKey;
    map['lat'] = lat;
    map['lon'] = lon;
    map['mobile'] = mobile;
    return map;
  }

}