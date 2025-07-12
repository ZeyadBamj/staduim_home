import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/helper/custom_border.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';
import 'package:reservision_app/widgets/owner_widgets/owner_playground_input.dart';

class LocalImage {
  final String? assetPath;
  final File? file;

  LocalImage({this.assetPath, this.file});
}

class OwnerDetailsScreen extends StatefulWidget {
  const OwnerDetailsScreen({super.key});

  @override
  State<OwnerDetailsScreen> createState() => _OwnerDetailsScreenState();
}

class _OwnerDetailsScreenState extends State<OwnerDetailsScreen> {
  final List<LocalImage> images = [];
  final picker = ImagePicker();

  Future<void> _pickImagesFromGallery() async {
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        images.addAll(picked.map((x) => LocalImage(file: File(x.path))));
      });
    }
  }

  void _addImageFromAssets() {
    const assetOptions = [kEnamImage, kIconImage, kCategoryImage];
    final unusedAssets =
        assetOptions
            .where((e) => !images.any((img) => img.assetPath == e))
            .toList();
    if (unusedAssets.isNotEmpty) {
      setState(() {
        images.add(LocalImage(assetPath: unusedAssets.first));
      });
    }
  }

  void _removeImage(int index) {
    showConfirmDialog(
      context,
      title: 'تأكيد الحذف',
      content: Text('هل تريد حذف هذه الصورة؟'),
      noText: 'إلغاء',
      onNo: () {
        Navigator.of(context).pop();
      },
      yesText: 'نعم',
      onYes: () {
        setState(() => images.removeAt(index));
        Navigator.of(context).pop();
      },
    );
  }

  void _editImage(int index) async {
    final current = images[index];

    if (current.file != null) {
      final picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          images[index] = LocalImage(file: File(picked.path));
        });
      }
    } else {
      const assetOptions = [kEnamImage, kIconImage, kCategoryImage];
      final unusedAssets =
          assetOptions
              .where((e) => !images.any((img) => img.assetPath == e))
              .toList();
      if (unusedAssets.isNotEmpty) {
        setState(() {
          images[index] = LocalImage(assetPath: unusedAssets.first);
        });
      }
    }
  }

  void _openImageGallery(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => ImageGalleryScreen(
              images: images,
              initialIndex: index,
              onEdit: (editIndex) => _editImage(editIndex),
            ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController workingDaysController = TextEditingController();
  final TextEditingController workingHoursController = TextEditingController();
  final TextEditingController featuresController = TextEditingController();
  final TextEditingController accountsController = TextEditingController();
  final TextEditingController contactsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor.shade200,
      appBar: AppBar(title: const Text("تفاصيل الملعب"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "صور الملعب",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length + 2,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    if (index == images.length)
                      return _buildAddImageAssetButton();
                    if (index == images.length + 1)
                      return _buildAddImageGalleryButton();

                    final img = images[index];
                    return GestureDetector(
                      onTap: () => _openImageGallery(index),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:
                                img.file != null
                                    ? Image.file(
                                      img.file!,
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    )
                                    : Image.asset(
                                      img.assetPath!,
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                          ),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: InkWell(
                              onTap: () => _removeImage(index),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text('أيام العمل :', style: OwnerDetailsStyle.kTextField),
              _buildTextField("مثال: يومياً", workingDaysController),
              Text('أوقات العمل :', style: OwnerDetailsStyle.kTextField),
              _buildTextField("من - إلى", workingHoursController),
              const OwnerPlaygroundInput(),
              Text('مزايا الملعب :', style: OwnerDetailsStyle.kTextField),
              _buildTextField(
                "مثال: يوجد لدينا برادة مياه",
                featuresController,
              ),
              Text(
                'حسابات التحويل المالي :',
                style: OwnerDetailsStyle.kTextField,
              ),
              _buildTextField("حساب العمقي: 22222222222", accountsController),
              Text('أرقام التواصل :', style: OwnerDetailsStyle.kTextField),
              _buildTextField(
                "مثال: رقم صاحب الملعب: 771122334",
                contactsController,
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // معالجة البيانات
                      }
                    },
                    icon: const Icon(FontAwesomeIcons.fileCircleCheck),
                    label: const Text(
                      "  تثبيت   ",
                      style: OwnerControlStyle.kSnackBar,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddImageAssetButton() {
    return InkWell(
      onTap: _addImageFromAssets,
      child: _buildAddButtonContent(Icons.add_photo_alternate, "من Assets"),
    );
  }

  Widget _buildAddImageGalleryButton() {
    return InkWell(
      onTap: _pickImagesFromGallery,
      child: _buildAddButtonContent(Icons.photo_library, "من الجهاز"),
    );
  }

  Widget _buildAddButtonContent(IconData icon, String label) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.grey),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hintText,
    TextEditingController controller, {
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: kGreenColor),
        ),
        child: TextFormField(
          cursorColor: kBlackColor,
          maxLines: null,
          minLines: 1,
          controller: controller,
          keyboardType: keyboardType,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: customBorder(color: kGreenColor, width: 2),
            focusedBorder: customBorder(color: kPrimaryColor, width: 3),
          ),
          validator:
              (value) =>
                  value == null || value.isEmpty ? 'هذا الحقل مطلوب' : null,
        ),
      ),
    );
  }
}

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
      backgroundColor: Colors.black,
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
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white, size: 30),
              onPressed: () {
                int currentIndex = controller.page?.round() ?? initialIndex;
                onEdit(currentIndex);
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
