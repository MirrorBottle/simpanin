import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmptyComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const EmptyComponent(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          Text(title, style: Theme.of(context).textTheme.displayMedium),
          Text(subtitle, style: Theme.of(context).textTheme.titleMedium)
        ],
      ),
    );
  }
}
