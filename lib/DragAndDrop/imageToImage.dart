import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> qAnswerList = [
  {
    "BoxName": "Bior",
    "id": "1691653090609",
    "width": "62",
    "height": "72",
    "top": "3",
    "left": "3",
    "images": []
  },
  {
    "BoxName": "feather",
    "id": "1691653132266",
    "width": "98",
    "height": "98",
    "top": "98",
    "left": "95",
    "images": []
  },
  {
    "BoxName": "896",
    "id": "1691653163977",
    "width": "95",
    "height": "88",
    "top": "0",
    "left": "97",
    "images": []
  }
];
List<Map<String, dynamic>> correctAnswer = [
  {
    "BoxName": "Bior",
    "id": "1691653090609",
    "width": "62",
    "height": "72",
    "top": "3",
    "left": "3",
    "images": [
      {
        "id": "0",
        "dropText":
            "https://files.semanoor.com/medialibrary/8626cd82-b6f7-4075-ada5-240fd2db484d.jpg"
      },
      {
        "id": "1",
        "dropText":
            "https://files.semanoor.com/medialibrary/688b54a1-79a7-4388-86e1-a7d68795e847.jpg"
      }
    ]
  },
  {
    "BoxName": "feather",
    "id": "1691653132266",
    "width": "98",
    "height": "98",
    "top": "98",
    "left": "95",
    "images": [
      {
        "id": "0",
        "dropText":
            "https://files.semanoor.com/medialibrary/27b4f7fb-67dd-41f2-8b18-0c8e660c2cfb.jpg"
      },
      {
        "id": "1",
        "dropText":
            "https://files.semanoor.com/medialibrary/1c2f6397-b7cd-47de-b8cb-5d08139c9145.jpg"
      },
      {
        "id": "2",
        "dropText":
            "https://files.semanoor.com/medialibrary/333f36ae-939c-4d11-bec4-b4de0f74cc55.jpg"
      }
    ]
  },
  {
    "BoxName": "896",
    "id": "1691653163977",
    "width": "95",
    "height": "88",
    "top": "0",
    "left": "97",
    "images": [
      {
        "id": "1",
        "dropText":
            "https://files.semanoor.com/medialibrary/17819830-b71f-4e00-8708-2c90b70f6656.jpg"
      }
    ]
  }
];
List<Map<String, dynamic>> _getOriginalQAnswer = [
  {
    "BoxName": "Bior",
    "id": "1691653090609",
    "width": "62",
    "height": "72",
    "top": "3",
    "left": "3",
    "images": [
      {
        "id": "0",
        "dropText":
            "https://files.semanoor.com/medialibrary/8626cd82-b6f7-4075-ada5-240fd2db484d.jpg"
      },
      {
        "id": "1",
        "dropText":
            "https://files.semanoor.com/medialibrary/688b54a1-79a7-4388-86e1-a7d68795e847.jpg"
      }
    ]
  },
  {
    "BoxName": "feather",
    "id": "1691653132266",
    "width": "98",
    "height": "98",
    "top": "98",
    "left": "95",
    "images": [
      {
        "id": "0",
        "dropText":
            "https://files.semanoor.com/medialibrary/27b4f7fb-67dd-41f2-8b18-0c8e660c2cfb.jpg"
      },
      {
        "id": "1",
        "dropText":
            "https://files.semanoor.com/medialibrary/1c2f6397-b7cd-47de-b8cb-5d08139c9145.jpg"
      },
      {
        "id": "2",
        "dropText":
            "https://files.semanoor.com/medialibrary/333f36ae-939c-4d11-bec4-b4de0f74cc55.jpg"
      }
    ]
  },
  {
    "BoxName": "896",
    "id": "1691653163977",
    "width": "95",
    "height": "88",
    "top": "0",
    "left": "97",
    "images": [
      {
        "id": "1",
        "dropText":
            "https://files.semanoor.com/medialibrary/17819830-b71f-4e00-8708-2c90b70f6656.jpg"
      }
    ]
  }
];
List<Map<String, dynamic>> qAnswer = List.from(_getOriginalQAnswer);

class imageToImage extends StatefulWidget {
  const imageToImage({Key? key}) : super(key: key);

  @override
  State<imageToImage> createState() => _imageToImageState();
}

class _imageToImageState extends State<imageToImage> {
  int targetIndex = -1;
  bool isUserAnswer = false;
  bool isContainerVisible = false;
  bool itemsdragginng = false;
  bool borderColorChange = false;
  String isResult = '';
  double clickCount = 0;
  bool dragDisabler = false;
  bool mouseOverColor = false;
  void onChanged(List<Map<String, dynamic>> newList) {
    setState(() {
      qAnswerList = newList;
    });
  }

  String comparingForCorrectAnswer(List<Map<String, dynamic>> qAnswerList,
      List<Map<String, dynamic>> correctAnswer) {
    // Check if the length of both lists is the same
    if (qAnswerList.length != correctAnswer.length) {
      return "incorrectanswer";
    } else {
      // Iterate through the dynamic list and compare each item to the corresponding item in the static list
      int tabsCount = 0;
      for (int i = 0; i < qAnswerList.length; i++) {
        int count = 0;
        for (int j = 0; j < correctAnswer[i]['images'].length; j++) {
          for (int k = 0; k < qAnswerList[i]['images'].length; k++) {
            if (correctAnswer[i]['images'][j]['dropText'] ==
                qAnswerList[i]['images'][k]['dropText']) {
              count += 1;
            }
          }
        }
        if (count == correctAnswer[i]['images'].length) {
          tabsCount += 1;
          if (tabsCount == qAnswerList.length) {
            return "correctanswer";
          }
        } else {
          return "incorrectanswer";
        }
      }
    }
    return 'incorrectanswer';
  }

//When refresh button was clicked then resetVariables() called
  resetVariables() {
    isUserAnswer = false;
    clickCount = 0;
    isResult = '';
    dragDisabler = false;
    isContainerVisible = true;
    qAnswer = List.from(correctAnswer);
    for (int i = 0; i < qAnswerList.length; i++) {
      qAnswerList[i]['images'] = [];
    }
  }

//This is for toggling the feedbackpanel
  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  Widget feedbackpanel() {
    return Container(
      width: 850,
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: toggleContainerVisibility,
                child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.lightGreen[400],
                    child: Icon(
                      isContainerVisible
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 27,
                    ))),
          ),
          Visibility(
            visible: isContainerVisible,
            child: Container(
              // height: 240,
              width: 850,
              color: Colors.lightGreen[400],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Your correct answer is:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none)),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/crowimage.png"),
                                fit: BoxFit.fill),
                          ),
                          child: SizedBox(
                              width: 280,
                              child: Stack(
                                children: [
                                  for (final item
                                      in correctAnswer.asMap().entries)
                                    Positioned(
                                      top: double.parse(item.value['top']!),
                                      left: double.parse(item.value['left']!),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              DottedBorder(
                                                color: Colors.black,
                                                strokeWidth: 1,
                                                borderType: BorderType.Rect,
                                                dashPattern: const [2, 2],
                                                child: Container(
                                                  width: double.parse(item
                                                      .value['width']
                                                      .toString()),
                                                  height: double.parse(item
                                                      .value['height']
                                                      .toString()),
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children:
                                                        List<Widget>.generate(
                                                      item.value['images']
                                                          .length,
                                                      (index) {
                                                        var entry =
                                                            item.value['images']
                                                                [index];
                                                        return Flexible(
                                                          child: Image.network(
                                                              entry[
                                                                  'dropText']),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                height: 20,
                                                child: Center(
                                                  child: Text(
                                                    item.value['BoxName'],
                                                    style: const TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 750,
        // height: 500,
        height: ((isResult != 'correctanswer' && clickCount == 3) &&
                (isContainerVisible == true))
            ? 800
            : 510,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Container(
          color: const Color.fromARGB(255, 241, 240, 240).withOpacity(0.5),
          width: 500,
          height: 500,
          child: Column(
            children: [
              Container(
                height: 80,
                // width: 500,
                alignment: Alignment.centerLeft,
                color: Colors.lightGreen[400],
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Drag and drop:',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      // Validation ICon
                      if (isUserAnswer)
                        Container(
                          height: 40,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                isResult = comparingForCorrectAnswer(
                                    qAnswerList, correctAnswer);
                                if (isResult == "correctanswer" ||
                                    clickCount >= 3) {
                                  Future.delayed(const Duration(seconds: 5),
                                      () {
                                    setState(() {
                                      isUserAnswer = false;
                                    });
                                  });
                                }
                                clickCount = clickCount + 1;
                                if (clickCount == 4 &&
                                    isResult != "correctanswer") {
                                  resetVariables();
                                } else if (clickCount == 3 ||
                                    isResult == "correctanswer") {
                                  dragDisabler = true;
                                }
                              });
                            },
                            color: clickCount == 3 &&
                                    isResult != "correctanswer"
                                ? Colors.orange
                                : isResult == ''
                                    ? Colors.white
                                    : isResult == 'correctanswer'
                                        ? const Color.fromARGB(255, 32, 112, 36)
                                        : Colors.red[600],
                            textColor: isResult == ''
                                ? Colors.grey
                                : isResult == 'correctanswer'
                                    ? Colors.white
                                    : Colors.white,
                            padding: const EdgeInsets.all(0),
                            shape: const CircleBorder(),
                            child:
                                clickCount == 3 && isResult != "correctanswer"
                                    ? const Icon(
                                        Icons.refresh,
                                        size: 20,
                                      )
                                    : Icon(
                                        isResult == ''
                                            ? Icons.check
                                            : isResult == 'correctanswer'
                                                ? Icons.check
                                                : Icons.close,
                                        size: 20,
                                      ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              //Main or Top Container
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      height: 280,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/crowimage.png"),
                            fit: BoxFit.fill),
                      ),
                      child: SizedBox(
                          height: 30,
                          width: 250,
                          child: Stack(
                            children: [
                              for (final item in qAnswerList.asMap().entries)
                                Positioned(
                                  top: double.parse(item.value['top']!),
                                  left: double.parse(item.value['left']!),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DragTarget<String>(
                                          builder: (context,
                                              List<String?> candidateData,
                                              rejectedData) {
                                            return MouseRegion(
                                              onEnter: (event) {
                                                setState(() {
                                                  if (mouseOverColor == true) {
                                                    // Change the border color when the mouse is over the container
                                                    item.value['borderColor'] =
                                                        Colors
                                                            .orange; // For example, change it to blue
                                                  }
                                                });
                                              },
                                              onExit: (event) {
                                                setState(() {
                                                  // Reset the border color when the mouse exits
                                                  item.value['borderColor'] = Colors
                                                      .black; // Reset it to the original color
                                                });
                                              },
                                              child: DottedBorder(
                                                color: item
                                                        .value['borderColor'] ??
                                                    Colors
                                                        .black, // Use the borderColor or default to black
                                                strokeWidth: 1,
                                                borderType: BorderType.Rect,
                                                dashPattern: const [2, 2],
                                                child: Container(
                                                  width: double.parse(
                                                      item.value['width']),
                                                  height: double.parse(
                                                      item.value['height']),
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: List<
                                                              Widget>.generate(
                                                            qAnswerList[item
                                                                        .key]
                                                                    ['images']
                                                                .length,
                                                            (index) {
                                                              // Check if the index is within bounds
                                                              if (index <
                                                                  qAnswerList[item
                                                                              .key]
                                                                          [
                                                                          'images']
                                                                      .length) {
                                                                var entry =
                                                                    qAnswerList[item.key]
                                                                            [
                                                                            'images']
                                                                        [index];
                                                                return Flexible(
                                                                  child:
                                                                      IgnorePointer(
                                                                    ignoring:
                                                                        dragDisabler,
                                                                    child: Draggable<
                                                                        String>(
                                                                      data: entry[
                                                                          'dropText'],
                                                                      feedback:
                                                                          Container(
                                                                        height:
                                                                            78,
                                                                        width:
                                                                            90,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(
                                                                            width:
                                                                                2,
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                53,
                                                                                125,
                                                                                241),
                                                                          ),
                                                                        ),
                                                                        child: Image.network(
                                                                            entry['dropText']),
                                                                      ),

                                                                      onDragStarted:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isResult =
                                                                              '';
                                                                        });
                                                                      },
                                                                      childWhenDragging:
                                                                          Container(),
                                                                      onDragCompleted:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          qAnswerList[item.key]['images']
                                                                              .removeAt(index);
                                                                        });
                                                                      },
                                                                      // Change here height and width for the main container's accepted images
                                                                      child: Image
                                                                          .network(
                                                                              entry['dropText']),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container(); // Placeholder or fallback widget
                                                              }
                                                            },
                                                            growable:
                                                                false, // List length won't change
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          onWillAccept: (data) {
                                            mouseOverColor = true;

                                            return true;
                                          },
                                          onAccept: (data) {
                                            mouseOverColor = true;
                                            setState(() {
                                              targetIndex = item.key;
                                              var opt = {
                                                "id": qAnswerList[targetIndex]
                                                        ['images']
                                                    .length
                                                    .toString(),
                                                "dropText": data,
                                              };
                                              qAnswerList[targetIndex]['images']
                                                  .add(opt);
                                              mouseOverColor = false;
                                              onChanged(qAnswerList);
                                            });
                                          },
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              item.value['BoxName'],
                                              style: const TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),

//Bottom Container
              (isResult == 'correctanswer')
                  ? SizedBox(
                      width: 10,
                      height: 10,
                    )
                  : IgnorePointer(
                      ignoring: dragDisabler,
                      child: MouseRegion(
                        onHover: (event) {
                          if (itemsdragginng == true) {
                            borderColorChange = true;
                          }
                        },
                        onExit: (event) {
                          setState(() {
                            borderColorChange = false;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 660,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: (borderColorChange == true)
                                    ? Colors.orange
                                    : Colors.black),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: DragTarget<String>(
                                  onWillAccept: (data) {
                                    itemsdragginng = true;
                                    return true;
                                  },
                                  onAccept: (data) {
                                    setState(() {
                                      int index = qAnswer.length - 1;
                                      if (index >= 0 &&
                                          index < qAnswer.length) {
                                        var images = qAnswer[index]['images'];
                                        images.add({'dropText': data});
                                        qAnswer[index]['dropTexts'] = images
                                            .map((image) => image['dropText'])
                                            .toList();
                                      }
                                    });
                                  },
                                  builder: (context,
                                      List<String?> candidateData,
                                      rejectedData) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: qAnswer.length,
                                      itemBuilder: (context, index) {
                                        var images = qAnswer[index]['images'];
                                        return Wrap(
                                          spacing:
                                              5.0, // Horizontal spacing between images
                                          runSpacing:
                                              5.0, // Vertical spacing between rows

                                          children: List<Widget>.generate(
                                            images.length,
                                            (ind) {
                                              var dropText =
                                                  images[ind]['dropText'];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IgnorePointer(
                                                  ignoring: isResult ==
                                                      'correctanswer', // Set ignoring based on isResult
                                                  child: Draggable<String>(
                                                    data: dropText,
                                                    feedback: Container(
                                                      height: 78,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color: const Color
                                                              .fromARGB(255, 53,
                                                              125, 241),
                                                        ),
                                                      ),
                                                      child: Image.network(
                                                          dropText),
                                                    ),
                                                    onDragStarted: () {
                                                      setState(() {
                                                        // coloring = true;
                                                        itemsdragginng = true;
                                                        isUserAnswer = true;
                                                        isResult = '';
                                                      });
                                                    },
                                                    childWhenDragging:
                                                        Container(),
                                                    onDragCompleted: () {
                                                      setState(() {
                                                        images.removeAt(ind);
                                                        qAnswer[index]
                                                                ['dropTexts'] =
                                                            images
                                                                .map((image) =>
                                                                    image[
                                                                        'dropText'])
                                                                .toList();
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 78,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color: const Color
                                                              .fromARGB(255, 53,
                                                              125, 241),
                                                        ),
                                                      ),
                                                      child: Image.network(
                                                          dropText),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

              Spacer(),
              Container(
                child: (isResult != 'correctanswer' && clickCount == 3)
                    ? feedbackpanel()
                    : SizedBox(
                        height: 2,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
