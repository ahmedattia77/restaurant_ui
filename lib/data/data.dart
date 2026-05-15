import 'package:flutter/material.dart';

class Category {
  final String title;
  final IconData icon;

  Category({required this.title, required this.icon});
}

final List<Category> categories = [
  Category(title: "All", icon: Icons.local_fire_department),
  Category(title: "Pizza", icon: Icons.local_pizza),
  Category(title: "Hot Dog", icon: Icons.lunch_dining),
  Category(title: "Burger", icon: Icons.lunch_dining),
  Category(title: "Drinks", icon: Icons.local_drink),
  Category(title: "Dessert", icon: Icons.icecream),
];

class Restrant {
  final String title;
  final String image;
  final List<String> meals;
  final double rate;
  final int deleveryTime;
  final String deleveryCost;

  Restrant({
    required this.title,
    required this.image,
    required this.deleveryTime,
    required this.deleveryCost,
    required this.rate,
    required this.meals,
  });
}

final List<Restrant> restrantData = [
  Restrant(
    title: "South Sea Gourmet",
    rate: 7,
    deleveryTime: 20,
    deleveryCost: "Free",
    meals: ['Ceviche', 'Tacos', 'Cullen Skink', 'salmon'],
    image: 'assets/images/fish.jpg',
  ),

  Restrant(
    title: "Burger Hub",
    rate: 8,
    deleveryTime: 15,
    deleveryCost: "10",
    meals: ['Cheese Burger', 'Double Burger', 'Fries', 'Onion Rings'],
    image: 'assets/images/burger.jpg',
  ),

  Restrant(
    title: "Chicken House",
    rate: 9,
    deleveryTime: 10,
    deleveryCost: "15",
    meals: ['Fried Chicken', 'Grilled Chicken', 'Wings', 'Coleslaw'],
    image: 'assets/images/meat.jpg',
  ),
];
