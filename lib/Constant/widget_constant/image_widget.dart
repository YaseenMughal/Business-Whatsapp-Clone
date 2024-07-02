import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class ImageBuilderWidget extends StatelessWidget {
  final double height;
  final double width;
  final String image;

  const ImageBuilderWidget({super.key, this.height = 200, this.width = double.infinity, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColor.blackColor, width: 2.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              height: height,
              width: width,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              ),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return SizedBox(
              height: height,
              width: width,
              child: const Center(
                child: Icon(Icons.error_outline, color: AppColor.errorColor),
              ),
            );
          },
        ),
      ),
    );
  }
}
