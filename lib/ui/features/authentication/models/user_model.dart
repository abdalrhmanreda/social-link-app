import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? name;
  String? email;
  String? profileImage;
  String? address;
  String? phone;
  String? uId;
  String? coverImage;
  String? bio;

  UserModel(
      {this.name,
      this.email,
      this.profileImage,
      this.phone,
      this.address,
      this.uId,
      this.coverImage,
      this.bio});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['fullName'];
    email = json['email'];
    profileImage = json['profileImage'];
    phone = json['phone'];
    address = json['address'];
    uId = json['uId'];
    coverImage = json['coverImage'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['profileImage'] = profileImage;
    data['address'] = address;
    data['uId'] = uId;
    data['coverImage'] = coverImage;
    data['bio'] = bio;

    return data;
  }

  @override
  List<Object> get props =>
      [name!, email!, profileImage!, phone!, address!, uId!, coverImage!, bio!];
}
