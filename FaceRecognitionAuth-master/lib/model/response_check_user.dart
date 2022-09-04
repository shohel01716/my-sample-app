class ResponseCheckUser {
  ResponseCheckUser({
      this.mobile, 
      this.status, 
      this.statusDetails, 
      this.organizationCode, 
      this.organizationName, 
      this.apiLocation, 
      this.empKey, 
      this.name, 
      this.empId, 
      this.designationShort, 
      this.designationFull, 
      this.branchCode, 
      this.branch, 
      this.deptCode, 
      this.dept, 
      this.accessPin, 
      this.profileImgLink, 
      this.imgData,});

  ResponseCheckUser.fromJson(dynamic json) {
    mobile = json['mobile'];
    status = json['status'];
    statusDetails = json['status_details'];
    organizationCode = json['organization_code'];
    organizationName = json['organization_name'];
    apiLocation = json['api_location'];
    empKey = json['empKey'];
    name = json['name'];
    empId = json['emp_id'];
    designationShort = json['designation_short'];
    designationFull = json['designation_full'];
    branchCode = json['branch_code'];
    branch = json['branch'];
    deptCode = json['dept_code'];
    dept = json['dept'];
    accessPin = json['access_pin'];
    profileImgLink = json['profile_img_link'];
    imgData = json['img_data'];
  }
  String? mobile;
  String? status;
  String? statusDetails;
  String? organizationCode;
  String? organizationName;
  String? apiLocation;
  String? empKey;
  String? name;
  String? empId;
  String? designationShort;
  String? designationFull;
  String? branchCode;
  String? branch;
  String? deptCode;
  String? dept;
  String? accessPin;
  String? profileImgLink;
  String? imgData;
ResponseCheckUser copyWith({  String? mobile,
  String? status,
  String? statusDetails,
  String? organizationCode,
  String? organizationName,
  String? apiLocation,
  String? empKey,
  String? name,
  String? empId,
  String? designationShort,
  String? designationFull,
  String? branchCode,
  String? branch,
  String? deptCode,
  String? dept,
  String? accessPin,
  String? profileImgLink,
  String? imgData,
}) => ResponseCheckUser(  mobile: mobile ?? this.mobile,
  status: status ?? this.status,
  statusDetails: statusDetails ?? this.statusDetails,
  organizationCode: organizationCode ?? this.organizationCode,
  organizationName: organizationName ?? this.organizationName,
  apiLocation: apiLocation ?? this.apiLocation,
  empKey: empKey ?? this.empKey,
  name: name ?? this.name,
  empId: empId ?? this.empId,
  designationShort: designationShort ?? this.designationShort,
  designationFull: designationFull ?? this.designationFull,
  branchCode: branchCode ?? this.branchCode,
  branch: branch ?? this.branch,
  deptCode: deptCode ?? this.deptCode,
  dept: dept ?? this.dept,
  accessPin: accessPin ?? this.accessPin,
  profileImgLink: profileImgLink ?? this.profileImgLink,
  imgData: imgData ?? this.imgData,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['status'] = status;
    map['status_details'] = statusDetails;
    map['organization_code'] = organizationCode;
    map['organization_name'] = organizationName;
    map['api_location'] = apiLocation;
    map['empKey'] = empKey;
    map['name'] = name;
    map['emp_id'] = empId;
    map['designation_short'] = designationShort;
    map['designation_full'] = designationFull;
    map['branch_code'] = branchCode;
    map['branch'] = branch;
    map['dept_code'] = deptCode;
    map['dept'] = dept;
    map['access_pin'] = accessPin;
    map['profile_img_link'] = profileImgLink;
    map['img_data'] = imgData;
    return map;
  }

}