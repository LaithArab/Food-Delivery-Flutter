import 'package:flutter/material.dart';

class ProItem extends StatelessWidget {
  final String title;
  final String description;
  const ProItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: size.width * 0.04,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
