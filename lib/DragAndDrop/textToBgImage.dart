import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> qAnswerList = [
  {
    "BoxName": "1691653740454",
    "id": "1691653740454",
    "width": "68",
    "height": "56",
    "top": "3",
    "left": "3",
    "tabOptions": []
  },
  {
    "BoxName": "1691653768414",
    "id": "1691653768414",
    "width": "86",
    "height": "33",
    "top": "61",
    "left": "75",
    "tabOptions": []
  }
];

List<Map<String, dynamic>> correctAnswer = [
  {
    "BoxName": "1691653740454",
    "id": "1691653740454",
    "width": "68",
    "height": "56",
    "top": "3",
    "left": "3",
    "tabOptions": [
      {"id": "1691653740454", "name": "123"},
      {"id": "1691653750525", "name": "456"}
    ]
  },
  {
    "BoxName": "1691653768414",
    "id": "1691653768414",
    "width": "86",
    "height": "33",
    "top": "61",
    "left": "75",
    "tabOptions": [
      {"id": "1691653768414", "name": "food"},
      {"id": "1691653781503", "name": "9865"}
    ]
  }
];
List<Map<String, dynamic>> _getOriginalQAnswer = [
  {
    "BoxName": "1691653740454",
    "id": "1691653740454",
    "width": "68",
    "height": "56",
    "top": "3",
    "left": "3",
    "tabOptions": [
      {"id": "1691653740454", "name": "123"},
      {"id": "1691653750525", "name": "456"}
    ]
  },
  {
    "BoxName": "1691653768414",
    "id": "1691653768414",
    "width": "86",
    "height": "33",
    "top": "61",
    "left": "75",
    "tabOptions": [
      {"id": "1691653768414", "name": "food"},
      {"id": "1691653781503", "name": "9865"}
    ]
  }
];
List<Map<String, dynamic>> qAnswer = List.from(_getOriginalQAnswer);

class textToBgImage extends StatefulWidget {
  const textToBgImage({Key? key}) : super(key: key);

  @override
  State<textToBgImage> createState() => _textToBgImageState();
}

class _textToBgImageState extends State<textToBgImage> {
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
        for (int j = 0; j < correctAnswer[i]['tabOptions'].length; j++) {
          for (int k = 0; k < qAnswerList[i]['tabOptions'].length; k++) {
            if (correctAnswer[i]['tabOptions'][j]['name'] ==
                qAnswerList[i]['tabOptions'][k]['name']) {
              count += 1;
            }
          }
        }
        if (count == correctAnswer[i]['tabOptions'].length) {
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
  void resetVariables() {
    isUserAnswer = false;
    clickCount = 0;
    isResult = '';
    dragDisabler = false;
    isContainerVisible = true;
    qAnswer = List.from(correctAnswer);
    for (int i = 0; i < qAnswerList.length; i++) {
      qAnswerList[i]['tabOptions'] = [];
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                        child: Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/birthdaypart.png"),
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
                                                  child: SingleChildScrollView(
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          children: List<
                                                              Widget>.generate(
                                                            item
                                                                .value[
                                                                    'tabOptions']
                                                                .length,
                                                            (index) {
                                                              var entry = item
                                                                          .value[
                                                                      'tabOptions']
                                                                  [index];
                                                              return Container(
                                                                height: 25,
                                                                child: Text(
                                                                    entry[
                                                                        'name'],
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        decoration:
                                                                            TextDecoration.none)),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
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
                      ),
                    ],
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
        width: 550,
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
          width: 400,
          height: 500,
          child: Column(
            children: [
              Container(
                height: 80,
                alignment: Alignment.centerLeft,
                color: Colors.lightGreen[400],
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Drag and Drop:',
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
                                  Future.delayed(const Duration(seconds: 1),
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
                        ),
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
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/birthdaypart.png"),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                color:
                                                    item.value['borderColor'] ??
                                                        Colors.black,
                                                strokeWidth: 1,
                                                borderType: BorderType.Rect,
                                                dashPattern: const [2, 2],
                                                child: Container(
                                                  width: double.parse(
                                                      item.value['width']),
                                                  height: double.parse(
                                                      item.value['height']),
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  child: SingleChildScrollView(
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List<
                                                              Widget>.generate(
                                                            qAnswerList[item
                                                                        .key][
                                                                    'tabOptions']
                                                                .length,
                                                            (index) {
                                                              // Check if the index is within bounds
                                                              if (index <
                                                                  qAnswerList[item
                                                                              .key]
                                                                          [
                                                                          'tabOptions']
                                                                      .length) {
                                                                var entry =
                                                                    qAnswerList[item.key]
                                                                            [
                                                                            'tabOptions']
                                                                        [index];
                                                                return IgnorePointer(
                                                                  ignoring:
                                                                      dragDisabler,
                                                                  child:
                                                                      Draggable<
                                                                          String>(
                                                                    data: entry[
                                                                        'name'],
                                                                    feedback:
                                                                        Container(
                                                                      height:
                                                                          40,
                                                                      width: 40,
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          entry[
                                                                              'name'],
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold,
                                                                              decoration: TextDecoration.none),
                                                                        ),
                                                                      ),
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
                                                                        qAnswerList[item.key]['tabOptions']
                                                                            .removeAt(index);
                                                                      });
                                                                    },
                                                                    // Change here height and width for the main container's accepted tabOptions
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          20,
                                                                      child:
                                                                          Text(
                                                                        entry[
                                                                            'name'],
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            decoration: TextDecoration.none),
                                                                      ),
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
                                                      ],
                                                    ),
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
//Adding id and name to the qAnswerList when dragTarget accepted the draggable item
                                              var opt = {
                                                "id": qAnswerList[targetIndex]
                                                        ['tabOptions']
                                                    .length
                                                    .toString(),
                                                "name": data,
                                              };
                                              qAnswerList[targetIndex]
                                                      ['tabOptions']
                                                  .add(opt);
                                              mouseOverColor = false;
                                              onChanged(qAnswerList);
                                            });
                                          },
                                        ),
                                      ]),
                                ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Spacer(),
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
                          height: 40,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.1,
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
                                        var tabOptions =
                                            qAnswer[index]['tabOptions'];
                                        tabOptions.add({'name': data});
                                        qAnswer[index]['name'] = tabOptions
                                            .map((tabOption) =>
                                                tabOption['name'])
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
                                        var tabOptions =
                                            qAnswer[index]['tabOptions'];
                                        return Wrap(
                                          spacing:
                                              5.0, // Horizontal spacing between tabOptions
                                          runSpacing:
                                              5.0, // Vertical spacing between rows

                                          children: List<Widget>.generate(
                                            tabOptions.length,
                                            (ind) {
                                              var name =
                                                  tabOptions[ind]['name'];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IgnorePointer(
                                                  ignoring: isResult ==
                                                      'correctanswer', // Set ignoring based on isResult
                                                  child: Draggable<String>(
                                                    data: name,
                                                    feedback: Container(
                                                      height: 40,
                                                      width: 40,
                                                      color: Colors.white,
                                                      child: Center(
                                                        child: Text(name,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none)),
                                                      ),
                                                    ),
                                                    onDragStarted: () {
                                                      setState(() {
                                                        itemsdragginng = true;
                                                        isUserAnswer = true;
                                                        isResult = '';
                                                      });
                                                    },
                                                    childWhenDragging:
                                                        Container(),
                                                    onDragCompleted: () {
                                                      setState(() {
                                                        tabOptions
                                                            .removeAt(ind);
                                                        qAnswer[index]['name'] =
                                                            tabOptions
                                                                .map((tabOption) =>
                                                                    tabOption[
                                                                        'name'])
                                                                .toList();
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 78,
                                                      width: 90,
                                                      child: Text(
                                                        name,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
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
