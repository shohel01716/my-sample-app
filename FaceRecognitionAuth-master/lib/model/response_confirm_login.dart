class ResponseConfirmLogin {
  ResponseConfirmLogin({
      this.mobile, 
      this.empKey, 
      this.validLogin, 
      this.crSession, 
      this.lat, 
      this.lon, 
      this.attDate, 
      this.login, 
      this.logout, 
      this.todayLoginStatus, 
      this.todayLoginRemarks,});

  ResponseConfirmLogin.fromJson(dynamic json) {
    mobile = json['mobile'];
    empKey = json['empKey'];
    validLogin = json['valid_login'];
    crSession = json['cr_session'];
    lat = json['lat'];
    lon = json['lon'];
    attDate = json['att_date'];
    login = json['login'];
    logout = json['logout'];
    todayLoginStatus = json['todayLoginStatus'];
    todayLoginRemarks = json['todayLoginRemarks'];
  }
  String? mobile;
  String? empKey;
  int? validLogin;
  String? crSession;
  String? lat;
  String? lon;
  String? attDate;
  String? login;
  String? logout;
  String? todayLoginStatus;
  String? todayLoginRemarks;
ResponseConfirmLogin copyWith({  String? mobile,
  String? empKey,
  int? validLogin,
  String? crSession,
  String? lat,
  String? lon,
  String? attDate,
  String? login,
  String? logout,
  String? todayLoginStatus,
  String? todayLoginRemarks,
}) => ResponseConfirmLogin(  mobile: mobile ?? this.mobile,
  empKey: empKey ?? this.empKey,
  validLogin: validLogin ?? this.validLogin,
  crSession: crSession ?? this.crSession,
  lat: lat ?? this.lat,
  lon: lon ?? this.lon,
  attDate: attDate ?? this.attDate,
  login: login ?? this.login,
  logout: logout ?? this.logout,
  todayLoginStatus: todayLoginStatus ?? this.todayLoginStatus,
  todayLoginRemarks: todayLoginRemarks ?? this.todayLoginRemarks,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['empKey'] = empKey;
    map['valid_login'] = validLogin;
    map['cr_session'] = crSession;
    map['lat'] = lat;
    map['lon'] = lon;
    map['att_date'] = attDate;
    map['login'] = login;
    map['logout'] = logout;
    map['todayLoginStatus'] = todayLoginStatus;
    map['todayLoginRemarks'] = todayLoginRemarks;
    return map;
  }

}