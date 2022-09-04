class ResponseActivateUser {
  ResponseActivateUser({
      this.empKey, 
      this.status, 
      this.statusDet,});

  ResponseActivateUser.fromJson(dynamic json) {
    empKey = json['empKey'];
    status = json['status'];
    statusDet = json['status_det'];
  }
  String? empKey;
  int? status;
  String? statusDet;
ResponseActivateUser copyWith({  String? empKey,
  int? status,
  String? statusDet,
}) => ResponseActivateUser(  empKey: empKey ?? this.empKey,
  status: status ?? this.status,
  statusDet: statusDet ?? this.statusDet,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empKey'] = empKey;
    map['status'] = status;
    map['status_det'] = statusDet;
    return map;
  }

}