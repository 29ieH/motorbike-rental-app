import 'package:flutter/material.dart';

class FutureItem {
  String title;
  IconData icon;
  Function onTap;

  // Constructor sử dụng 'required' cho các tham số
  FutureItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
