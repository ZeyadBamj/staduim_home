import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/screens/owner_screens/owner_details_screen.dart';

class ImageGalleryScreen extends StatelessWidget {
  final List<LocalImage> images;
  final int initialIndex;
  final Function(int) onEdit;

  const ImageGalleryScreen({
    super.key,
    required this.images,
    required this.initialIndex,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: initialIndex);
    return Scaffold(
      backgroundColor: kBlackColor, // خلفية الصورة عند الضغط عليها
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            itemCount: images.length,
            itemBuilder: (context, index) {
              final image = images[index];
              final ImageProvider imageProvider =
                  image.file != null
                      ? FileImage(image.file!)
                      : AssetImage(image.assetPath!) as ImageProvider;

              return InteractiveViewer(
                panEnabled: true,
                scaleEnabled: true,
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(
                  child: Image(image: imageProvider, fit: BoxFit.contain),
                ),
              );
            },
          ),

          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.edit, color: kWhiteColor, size: 30),
              onPressed: () {
                int currentIndex = controller.page?.round() ?? initialIndex;
                onEdit(currentIndex);
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: kWhiteColor, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
