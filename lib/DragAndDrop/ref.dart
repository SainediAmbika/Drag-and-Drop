import 'dart:async';
import 'dart:js_util';
import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

bool divAnswerValidate = false;
String isResult = '';
double inputcount = 0;
bool? isUserSelection;
int? selectedIndex;
String res = '';

List<Map<String, dynamic>> qAnswering = //constant
    [
  {"name": "1"},
  {"name": "award"},
  {"name": "chair"},
  {"name": "flower"},
];
List<Map<String, dynamic>> qPreviewSelection = [
  // used as a quesion
  {
    "name":
        "https://files.semanoor.com/medialibrary/0a56f6c8-cf2b-4bcc-a893-d952fe189feb.jpg?w=100%&h=100%&carve=true&format=png",
    'ans': ""
  },
  {
    "name":
        "https://files.semanoor.com/medialibrary/1c2f6397-b7cd-47de-b8cb-5d08139c9145.jpg?w=100%&h=100%&carve=true&format=png",
    'ans': ""
  },
  {
    "name":
        "https://files.semanoor.com/medialibrary/a9bd9fdf-6dcd-4e97-a5ac-d6679c9b2529.jpg?w=100%&h=100%&carve=true&format=png",
    'ans': ""
  },

  {
    "name":
        "https://files.semanoor.com/medialibrary/8ac664b8-6596-4eff-bd70-5f1f0fd3cbd0.jpg?w=100%&h=100%&carve=true&format=png",
    'ans': ""
  }
];
List<Map<String, dynamic>> qQuestions = List.from(qAnswering); // changing
bool dragDisabler = false;
TextEditingController _controller =
    TextEditingController(text: "Drag and Drop");

class TexttoImageDrag extends StatefulWidget {
  const TexttoImageDrag({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TexttoImageDrag createState() => _TexttoImageDrag();
}

class _TexttoImageDrag extends State<TexttoImageDrag> {
  int targetIndex = -1;

  void onChangeds(List<Map<String, dynamic>> newList) {
    setState(() {
      qQuestions = newList;
    });
  }

  void onChanged(List<Map<String, dynamic>> newList) {
    setState(() {
      qPreviewSelection = newList;
    });
  }

  Map<int, Map<String, dynamic>?> droppedImages = {};
  Map<int, Map<String, dynamic>?> myImages = {};

  bool coloring = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        child: Container(
            height: isResult == 'correct' ? 450 : 600,
            width: 1000,
            // color: Colors.lightBlueAccent,
            child: Stack(children: [
              Align(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      height: 80,
                      width: 1000,
                      color: Colors.amberAccent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 1000,
                                child: TextField(
                                  // style: quesHeaderStyle,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.transparent),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.transparent),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                    ),
                                  ),
                                  controller: _controller,
                                  enabled: true,
                                ),
                              ),
                            ),
                            if (divAnswerValidate)
                              Align(
                                alignment: const Alignment(0.85, 1.8),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        isResult = validateAnswer();

                                        debugPrint("isResult $isResult");
                                        if (isResult == "correct" ||
                                            ((inputcount == 3 ||
                                                    inputcount == 4) &&
                                                isResult == "correct")) {
                                          Timer.periodic(
                                            const Duration(milliseconds: 5),
                                            (timer) {
                                              divAnswerValidate = false;
                                            },
                                          );
                                        }

                                        inputcount = inputcount + 1;
                                        if (inputcount == 4 &&
                                            isResult != "correct") {
                                          showValidationIcon();
                                        } else if (inputcount == 3) {
                                          dragDisabler = true;
                                        }
                                      });
                                    },
                                    color:
                                        inputcount == 3 && isResult != "correct"
                                            ? Colors.orange
                                            : isResult == ''
                                                ? Colors.white
                                                : isResult == 'correct'
                                                    ? const Color.fromARGB(
                                                        255, 32, 112, 36)
                                                    : Colors.red[600],
                                    textColor: isResult == ''
                                        ? Colors.grey
                                        : isResult == 'correct'
                                            ? Colors.white
                                            : Colors.white,
                                    padding: const EdgeInsets.all(0),
                                    shape: const CircleBorder(),
                                    child:
                                        inputcount == 3 && isResult != "correct"
                                            ? const Icon(
                                                Icons.refresh,
                                                size: 20,
                                              )
                                            : Icon(
                                                isResult == ''
                                                    ? Icons.check
                                                    : isResult == 'correct'
                                                        ? Icons.check
                                                        : Icons.close,
                                                size: 20,
                                              ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    isResult == 'correct'
                        ? Container()
                        : Container(
                            color: Colors.lightBlueAccent,
                            height: 100,
                            width: 1000,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: qQuestions.length,
                              itemBuilder: (BuildContext context, int index) {
                                var name = qQuestions[index]['name'];
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: IgnorePointer(
                                          ignoring: isResult == 'incorrect',
                                          child: DragTarget<String>(
                                            onWillAccept: (data) {
                                              return true;
                                            },
                                            onAccept: (data) {
                                              int existingIndex =
                                                  qPreviewSelection.indexWhere(
                                                      (entry) =>
                                                          entry['ans'] == data);
                                              debugPrint(
                                                  'existingIndex is $existingIndex');
                                              if (existingIndex != -1) {
                                                setState(() {
                                                  targetIndex = index;
                                                  var temps = qPreviewSelection[
                                                      existingIndex]['ans'];
                                                  qPreviewSelection[
                                                              existingIndex]
                                                          ['ans'] =
                                                      qQuestions[targetIndex]
                                                          ['name'];
                                                  // qPreviewSelection[index]['ans'] == qQuestions[existingIndex]['name'];
                                                  qQuestions[targetIndex]
                                                      ['name'] = temps;

                                                  onChangeds(qQuestions);
                                                });
                                              } else {
                                                setState(() {
                                                  targetIndex = index;
                                                  qQuestions[targetIndex]
                                                      ['name'] = data;
                                                  onChanged(qQuestions);
                                                });
                                              }
                                            },
                                            builder: (context, candidateData,
                                                rejectedData) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Draggable<String>(
                                                  data: name,
                                                  feedback: Container(
                                                    width: 50,
                                                    height: 50,
                                                    color: Colors.white,
                                                    child: Text(
                                                      name,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  childWhenDragging: SizedBox(
                                                    width: 50.0,
                                                    height: 50,
                                                    child: Text(name),
                                                  ),
                                                  onDragStarted: () {
                                                    setState(() {
                                                      divAnswerValidate = true;
                                                      isResult = '';
                                                    });
                                                  },
                                                  onDragCompleted: () {
                                                    setState(() {
                                                      qQuestions
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      name,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    Container(
                      height: 250,
                      width: 1000,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: qPreviewSelection.length,
                        itemBuilder: (BuildContext context, int index) {
                          var entry = qPreviewSelection[index];
                          var emptyAns = qPreviewSelection[index]['ans'];
                          return Container(
                            width: 150.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            height: 250.0,
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 150,
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Image.network(
                                    qPreviewSelection[index]['name'],
                                  ),
                                ),
                                Container(
                                    width: 150.0,
                                    height: 50,
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.centerLeft,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: DragTarget<String>(
                                      builder: (context,
                                          List<String?> candidateData,
                                          rejectedData) {
                                        return Container(
                                          padding: const EdgeInsets.all(10),
                                          child: IgnorePointer(
                                            ignoring: dragDisabler,
                                            child: Draggable<String>(
                                              data: emptyAns,
                                              feedback: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  width: 150.0,
                                                  height: 50,
                                                  child: Text(
                                                    emptyAns,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                  // color: Colors.grey,

                                                  ),
                                              childWhenDragging: Container(
                                                  width: 150.0,
                                                  height: 50,
                                                  child: Text(emptyAns)),
                                              onDragCompleted: () {
                                                setState(() {
                                                  // qPreviewSelection[index]['ans'] = "";
                                                });
                                              },
                                              child: SizedBox(
                                                  width: 150.0,
                                                  height: 50,
                                                  child: Text(emptyAns)),
                                            ),
                                          ),
                                        );
                                      },
                                      onWillAccept: (data) {
                                        return true;
                                      },
                                      onAccept: (data) {
                                        int existingIndex = qPreviewSelection
                                            .indexWhere((entry) =>
                                                entry['ans'] == data);
                                        debugPrint(
                                            'existingIndex is $existingIndex');
                                        if (existingIndex != -1) {
                                          setState(() {
                                            targetIndex = index;
                                            var temp =
                                                qPreviewSelection[existingIndex]
                                                    ['ans'];

                                            qPreviewSelection[existingIndex]
                                                    ['ans'] =
                                                qPreviewSelection[targetIndex]
                                                    ['ans'];
                                            qPreviewSelection[targetIndex]
                                                ['ans'] = temp;

                                            onChanged(qPreviewSelection);
                                          });
                                        } else {
                                          setState(() {
                                            targetIndex = index;

                                            qPreviewSelection[targetIndex]
                                                ['ans'] = data;
                                            onChanged(qPreviewSelection);
                                          });
                                        }
                                      },
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ])),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: (isResult != 'correct' && inputcount == 3)
              //       ? const MyCustomContainer()
              //       : null,
              // ),
            ])));
  }
}

showValidationIcon() {
  for (int i = 0; i < qPreviewSelection.length; i++) {
    qPreviewSelection[i]['ans'] = '';
    divAnswerValidate = false;
    inputcount = 0;
    isResult = '';
    dragDisabler = false;
    qQuestions = List.from(qAnswering);
  }
}

String validateAnswer() {
  int count = 0;
  for (int i = 0; i < qAnswering.length; i++) {
    for (int j = 0; j < qPreviewSelection.length; j++) {
      if (i == j && qPreviewSelection[i]['ans'] == qAnswering[j]['name']) {
        count++;
      }
    }
  }

  debugPrint('Count : $count');

  if (count == qPreviewSelection.length) {
    return 'correct';
  } else {
    return 'incorrect';
  }
}
