import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/secondBottom.dart';

class CustomBackBottom extends StatefulWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  const CustomBackBottom({
    required this.onTap,
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<CustomBackBottom> createState() => _CustomBackBottomState();
}

class _CustomBackBottomState extends State<CustomBackBottom> {
  @override
  Widget build(BuildContext context) {
    return SecondBottom(
      width: widget.width,
      height: widget.height,
      onTap: () => widget.onTap(),
      iconData: Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
    );
  }
}
