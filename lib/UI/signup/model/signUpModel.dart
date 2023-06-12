class SignupModel {
  SignupModel({
    required this.success,
    required this.title,
    required this.message,
    required this.signupData,
  });
  late final bool success;
  late final String title;
  late final String message;
  late final Data signupData;
  
  SignupModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    title = json['title'];
    message = json['message'];
    signupData = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['title'] = title;
    data['message'] = message;
    data['data'] = signupData.toJson();
    return data;
  }
}

class Data {
  Data({
    required this.accessToken,
    required this.currentRole,
    required this.user,
  });
  late final String accessToken;
  late final CurrentRole currentRole;
  late final User user;
  
  Data.fromJson(Map<String, dynamic> json){
    accessToken = json['access_token'];
    currentRole = CurrentRole.fromJson(json['current_role']);
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['current_role'] = currentRole.toJson();
    data['user'] = user.toJson();
    return data;
  }
}

class CurrentRole {
  CurrentRole({
    required this.id,
    required this.name,
    required this.slug,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String about;
  late final String createdAt;
  late final String updatedAt;
  
  CurrentRole.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    required this.roles,
    required this.preferredRole,
    required this.userAddress,
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
  late final List<Roles> roles;
  late final PreferredRole preferredRole;
  late final UserAddress userAddress;
  
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
    roles = List.from(json['roles']).map((e)=>Roles.fromJson(e)).toList();
    preferredRole = PreferredRole.fromJson(json['preferred_role']);
    userAddress = UserAddress.fromJson(json['user_address']);
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
    data['roles'] = roles.map((e)=>e.toJson()).toList();
    data['preferred_role'] = preferredRole.toJson();
    data['user_address'] = userAddress.toJson();
    return data;
  }
}

class Roles {
  Roles({
    required this.id,
    required this.name,
    required this.slug,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String about;
  late final String createdAt;
  late final String updatedAt;
  
  Roles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PreferredRole {
  PreferredRole({
    required this.id,
    required this.name,
    required this.slug,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String about;
  late final String createdAt;
  late final String updatedAt;
  
  PreferredRole.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserAddress {
  UserAddress({
    required this.id,
    required this.userId,
     this.longitude,
     this.latitude,
     this.zipCode,
     this.city,
     this.state,
     this.country,
     this.address,
     this.phone,
     this.mobile,
    required this.defaultAddress,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int userId;
  late final dynamic longitude;
  late final dynamic latitude;
  late final dynamic zipCode;
  late final dynamic city;
  late final dynamic state;
  late final dynamic country;
  late final dynamic address;
  late final dynamic phone;
  late final dynamic mobile;
  late final int defaultAddress;
  late final String createdAt;
  late final String updatedAt;
  
  UserAddress.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    longitude = null;
    latitude = null;
    zipCode = null;
    city = null;
    state = null;
    country = null;
    address = null;
    phone = null;
    mobile = null;
    defaultAddress = json['default_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['zip_code'] = zipCode;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['address'] = address;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['default_address'] = defaultAddress;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}