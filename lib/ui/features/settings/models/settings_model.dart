import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SettingsModel extends Equatable {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsModel(
      {required this.title, required this.icon, required this.onTap});

  @override
  // TODO: implement props
  List<Object?> get props => [title, icon, onTap];
}
