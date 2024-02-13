part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class DeletePostState extends PostState {}

class PostUploadImageSuccessState extends PostState {}

class PostSuccess extends PostState {}

class PostError extends PostState {}

class PickedPostImageState extends PostState {}

class PickedPostVideoState extends PostState {}
