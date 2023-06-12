class OTPModel {
  OTPModel({
    required this.success,
    required this.title,
    required this.message,
    required this.otpData,
  });
  late final bool success;
  late final String title;
  late final String message;
  late final Data otpData;
  
  OTPModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    title = json['title'];
    message = json['message'];
    otpData = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['title'] = title;
    data['message'] = message;
    data['data'] = otpData.toJson();
    return data;
  }
}

class Data {
  Data({
    required this.accessToken,
    required this.user,
  });
  late final String accessToken;
  late final User user;
  
  Data.fromJson(Map<String, dynamic> json){
    accessToken = json['access_token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['user'] = user.toJson();
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
     this.emailVerifiedAt,
    required this.rating,
    required this.timeZone,
    required this.preferredRoleId,
    required this.ownerProfileCompleted,
    required this.renterProfileCompleted,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final dynamic emailVerifiedAt;
  late final int rating;
  late final String timeZone;
  late final int preferredRoleId;
  late final int ownerProfileCompleted;
  late final int renterProfileCompleted;
  late final int archived;
  late final String createdAt;
  late final String updatedAt;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = null;
    rating = json['rating'];
    timeZone = json['time_zone'];
    preferredRoleId = json['preferred_role_id'];
    ownerProfileCompleted = json['owner_profile_completed'];
    renterProfileCompleted = json['renter_profile_completed'];
    archived = json['archived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['rating'] = rating;
    data['time_zone'] = timeZone;
    data['preferred_role_id'] = preferredRoleId;
    data['owner_profile_completed'] = ownerProfileCompleted;
    data['renter_profile_completed'] = renterProfileCompleted;
    data['archived'] = archived;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}