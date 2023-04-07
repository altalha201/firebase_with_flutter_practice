import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/photo_view.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key, required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(PhotoView(url: url));
      },
      child: SizedBox(
        height: 100,
        width: 100,
        // color: ApplicationColor.colorBlack,
        child: Image.network(
          url,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}