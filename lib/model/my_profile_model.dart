class MyProfile {
  

  String? sId;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? phoneNumber;
  String? owner;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MyProfile(
      {this.sId,
      this.firstName,
      this.lastName,
      this.countryCode,
      this.phoneNumber,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MyProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
