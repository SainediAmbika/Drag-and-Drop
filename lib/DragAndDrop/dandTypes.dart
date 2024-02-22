import 'package:flutter/material.dart';
import 'package:imagemapping/DragAndDrop/imageToImage.dart';
import 'package:imagemapping/DragAndDrop/imageToText.dart';
import 'package:imagemapping/DragAndDrop/texToImage.dart';
import 'package:imagemapping/DragAndDrop/textToBgImage.dart';
import 'package:imagemapping/DragAndDrop/textToText.dart';
import 'package:liquid_lib/util_widgets/ico_liquid.dart';

// All the Drag and Drop Models

enum dadQuesTypes {
  imageToImage,
  imageToText,
  textImage,
  textToText,
  textToBackgroundImage
}

// ignore: camel_case_extensions
extension dadQuesTypesUtils on dadQuesTypes {
  IconData get icon {
    switch (this) {
      case dadQuesTypes.imageToImage:
        return OldLiquidIcons.imageToImage;
      case dadQuesTypes.imageToText:
        return OldLiquidIcons.imageToText;
      case dadQuesTypes.textImage:
        return OldLiquidIcons.textImage;
      case dadQuesTypes.textToText:
        return OldLiquidIcons.fontSize;
      case dadQuesTypes.textToBackgroundImage:
        return OldLiquidIcons.textToImage;
    }
  }

  //For the Tooltip
  String get displayString {
    switch (this) {
      case dadQuesTypes.imageToImage:
        return 'Image To Image';
      case dadQuesTypes.imageToText:
        return 'Image To Text';
      case dadQuesTypes.textImage:
        return 'Text To Image';
      case dadQuesTypes.textToText:
        return 'Text To Text';
      case dadQuesTypes.textToBackgroundImage:
        return 'Text To Image';
    }
  }
}

class dandIconOptions extends StatefulWidget {
  const dandIconOptions({Key? key}) : super(key: key);

  @override
  State<dandIconOptions> createState() => _dandIconOptionsState();
}

class _dandIconOptionsState extends State<dandIconOptions> {
  Widget? selectedContent;
  Map<dadQuesTypes, bool> selectedStates = {};
  // dadQuesTypes? selectedIcon;
  dadQuesTypes? selectedIcon = dadQuesTypes.imageToImage;
  Color? defaultIconBackgroundColor = Colors.white;
  Color? selectedIconBackgroundColor = Colors.grey[300];
//For displaying Paricular Drag and Drop - Type Content or we are calling particular file based on Type selection
  Widget onTypeChange(dadQuesTypes selectedType) {
    switch (selectedType) {
      case dadQuesTypes.imageToImage:
        return const imageToImage();
      case dadQuesTypes.imageToText:
        return imageToText();
      // // Replace return container when that particular Drag and Drop file is available
      // return Container(
      //   height: 200,
      //   width: 400,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.lightGreenAccent,
      //       width: 2.0,
      //     ),
      //   ),
      //   child: const Center(
      //       child: Text(
      //     "Need to add Image To Text File",
      //     style: TextStyle(
      //         fontSize: 16,
      //         decoration: TextDecoration.none,
      //         color: Colors.deepOrange,
      //         fontWeight: FontWeight.w500),
      //   )),
      // );
      case dadQuesTypes.textImage:
        return textToImage();
      // return Container(
      //   height: 200,
      //   width: 400,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.lightGreenAccent,
      //       width: 2.0,
      //     ),
      //   ),
      //   child: const Center(
      //       child: Text(
      //     "Need to add Text To Image File",
      //     style: TextStyle(
      //         fontSize: 16,
      //         decoration: TextDecoration.none,
      //         color: Colors.purpleAccent,
      //         fontWeight: FontWeight.w500),
      //   )),
      // );
      case dadQuesTypes.textToText:
        return textToText();
      // return Container(
      //   height: 200,
      //   width: 400,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.lightGreenAccent,
      //       width: 2.0,
      //     ),
      //   ),
      //   child: const Center(
      //       child: Text(
      //     "Need to add Text To Text File",
      //     style: TextStyle(
      //         fontSize: 16,
      //         decoration: TextDecoration.none,
      //         color: Colors.lightBlue,
      //         fontWeight: FontWeight.w500),
      //   )),
      // );
      case dadQuesTypes.textToBackgroundImage:
        return const textToBgImage();
      default:
        return Container(); // Return a default widget for unknown cases
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the selected content widget
            selectedContent ??
                imageToImage(), //set the default ddtype as imagetoimage

            Row(
              children: [
                Wrap(
                  children: dadQuesTypes.values
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIcon == e
                                  ? selectedIconBackgroundColor
                                  : defaultIconBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 2.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Tooltip(
                                message: e.displayString,
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    color: Colors.grey,
                                    splashRadius: 5,
                                    onPressed: () {
                                      setState(() {
                                        selectedContent = onTypeChange(e);
                                        selectedIcon =
                                            e; // Set the selected icon

                                        // Reset the background color of all icons to default
                                        dadQuesTypes.values.forEach((type) {
                                          selectedStates[type] = false;
                                        });

                                        // Set the background color of the selected icon
                                        selectedStates[e] = true;
                                      });
                                    },
                                    icon: Icon(e.icon),
                                    iconSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                if (selectedIcon == dadQuesTypes.imageToText ||
                    selectedIcon == dadQuesTypes.textImage)
                  IgnorePointer(
                    child: MaterialButton(
                      onPressed: () {
                        // Handle button click
                      },
                      color: const Color.fromRGBO(43, 61, 81, 1),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      child: Tooltip(
                        message: "Add Options",
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
