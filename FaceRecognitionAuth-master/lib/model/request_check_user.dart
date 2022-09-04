class RequestCheckUser {
  RequestCheckUser({
      this.mobile, 
      this.version,});

  RequestCheckUser.fromJson(dynamic json) {
    mobile = json['mobile'];
    version = json['version'];
  }
  String? mobile;
  String? version;
RequestCheckUser copyWith({  String? mobile,
  String? version,
}) => RequestCheckUser(  mobile: mobile ?? this.mobile,
  version: version ?? this.version,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['version'] = version;
    return map;
  }

}