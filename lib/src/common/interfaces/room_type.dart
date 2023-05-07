import 'package:flutter/material.dart';

enum RoomType {
  kitchen("Kitchen"),
  livingRoom("Living Room"),
  bedroom("Bedroom"),
  bathroom("Bathroom"),
  garage("Garage"),
  garden("Garden"),
  kidsRoom("Kids Room"),
  other("Other");

  final String name;
  const RoomType(this.name);

  IconData get icon {
    switch (this) {
      case RoomType.kitchen:
        return Icons.kitchen;
      case RoomType.livingRoom:
        return Icons.living;
      case RoomType.bedroom:
        return Icons.bed;
      case RoomType.bathroom:
        return Icons.bathroom;
      case RoomType.garage:
        return Icons.garage;
      case RoomType.garden:
        return Icons.yard;
      case RoomType.kidsRoom:
        return Icons.child_friendly;
      case RoomType.other:
        return Icons.add_home;
    }
  }
}
