import 'package:firebase_with_flutter_practice/ui/utility/ui_utility.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key, this.url}) : super(key: key);
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Image.network(url ?? UIUtility.noImg);
  }
}
