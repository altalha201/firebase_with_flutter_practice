import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
