import 'package:flutter/material.dart';

class EcoWiseUser {
  final String name;
  final int rank;
  final int points;
  final String profileImage;
  final bool isTopUser;
  final Color color;

  EcoWiseUser({
    required this.name,
    required this.points,
    required this.rank,
    required this.profileImage,
    required this.isTopUser,
    required this.color,
  });
}
