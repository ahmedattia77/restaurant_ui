import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:restaurant_ui/data/data.dart';

class SectionCategories extends StatelessWidget {
  final String title;
  final String actionTitle;
  final VoidCallback? onClick;

  const SectionCategories({
    super.key,
    required this.title,
    required this.actionTitle,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
          ),

          InkWell(
            onTap: onClick,
            child: Row(
              children: [
                Text(
                  actionTitle,
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  final IconData icon;
  final String title;
  const CategoriesList({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 16, 31, 39),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 9, 18, 22),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(icon),
          ),
          SizedBox(width: 12),
          Text(title),
        ],
      ),
    );
  }
}

class ResratnteItem extends StatelessWidget {
  final Restrant restrant;

  const ResratnteItem({super.key, required this.restrant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              restrant.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
          ),
        ),

        Text(restrant.title, style: TextStyle(fontSize: 16)),

        const SizedBox(height: 4),

        Text(
          restrant.meals.join(' - '),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Icon(Icons.star_border_outlined),
              SizedBox(width: 4),
              Text(restrant.rate.toString()),
              SizedBox(width: 32),
              Icon(Icons.delivery_dining_outlined),
              SizedBox(width: 4),
              Text(restrant.deleveryCost),
              SizedBox(width: 32),
              Icon(Icons.timer_sharp),
              SizedBox(width: 4),
              Text(restrant.deleveryTime.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
