import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String username;
  final String name;
  final String profileImage;
  final String postImage;
  final String caption;
  final String time;
  final String? userId;

  const PostModel({
    required this.username,
    required this.profileImage,
    required this.postImage,
    required this.caption,
    required this.time,
    required this.name,
    required this.userId,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'profileImage': profileImage,
      'postImage': postImage,
      'caption': caption,
      'time': time,
      'name': name,
      'userId': userId,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [username, profileImage, postImage, caption, time, name, userId];
}
