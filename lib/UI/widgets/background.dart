import 'package:firebase_with_flutter_practice/UI/utility/application_colors.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: ApplicationColor.colorOffWhite
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
