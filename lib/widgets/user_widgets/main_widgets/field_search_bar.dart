import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/user_cubits/playground_cubit/playground_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/playground_cubit/playground_state.dart';
import 'package:reservision_app/helper/custom_border.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/screens/user_screens/details_screen.dart';

class FieldSearchBar extends StatefulWidget {
  const FieldSearchBar({super.key});

  @override
  State<FieldSearchBar> createState() => _FieldSearchBarState();
}

class _FieldSearchBarState extends State<FieldSearchBar> {
  final TextEditingController controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;

  void _showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder:
          (context) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _removeOverlay();
              _focusNode.unfocus();
            },
            child: Stack(
              children: [
                Positioned(
                  width: mediaQuerySubWidth(context, width: 32),
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    offset: const Offset(0, 70),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: BlocBuilder<PlaygroundCubit, PlayGroundState>(
                        builder: (context, state) {
                          if (!state.hasSearched) {
                            return const SizedBox.shrink();
                          }

                          final results = state.filteredPlaygrounds;

                          if (results.isEmpty) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: const Text(
                                  'لا توجد نتائج',
                                  style: TextStyle(
                                    color: kRedColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }

                          return Container(
                            height: mediaQueryHeight(context, height: 0.2),
                            decoration: BoxDecoration(
                              color: kGreenColor.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                              itemCount: results.length,
                              itemBuilder: (context, index) {
                                final field = results[index];
                                final city =
                                    BlocProvider.of<PlaygroundCubit>(
                                      context,
                                    ).playgroundCityMap[field];

                                return ListTile(
                                  title: Text(field.name),
                                  subtitle: Text('(${city})'),
                                  leading: Image.asset(field.image, width: 50),
                                  onTap: () {
                                    _removeOverlay();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => DetailsScreen(
                                              playground: field,
                                            ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _removeOverlay(); // ← إخفاء قائمة النتائج فقط
      } else {
        final text = controller.text.trim();
        if (text.isNotEmpty) {
          context.read<PlaygroundCubit>().searchAllCitiesPlaygrounds(text);
          _showOverlay(context);
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: kGreyColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            context.read<PlaygroundCubit>().searchAllCitiesPlaygrounds(value);

            // إظهار النتائج
            if (_overlayEntry == null) {
              _showOverlay(context);
            }
          },
          onTap: () {
            if (_overlayEntry == null) {
              _showOverlay(context);
            }
          },
          decoration: InputDecoration(
            hintText: 'ابحث عن ملعبك ...',
            hintStyle: const TextStyle(color: kBorderColor),
            suffixIcon: const Icon(Icons.search, color: kBlackColor, size: 30),
            enabledBorder: customBorder(color: kGreenColor, width: 2),
            focusedBorder: customBorder(color: kPrimaryColor, width: 3),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}
