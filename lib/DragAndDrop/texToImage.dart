import 'package:flutter/material.dart';

List<Map<String, dynamic>> qAnswerList = [
  {
    "id": "1694179398907",
    "question":
        "<div style=\"text-align:left;width:100%;\"><span style=\"text-align: inherit;\">book</span></div>",
    "answer": ""
  },
  {
    "id": "1694179446046",
    "question":
        "<div style=\"text-align:left;width:100%;\"><span style=\"text-align: inherit;\">kick</span></div>",
    "answer": ""
  },
  {
    "id": "1694179523296",
    "question":
        "<div style=\"text-align:left;width:100%;\"><span style=\"text-align: inherit;\">award</span></div>",
    "answer": ""
  },
  {
    "id": "1694179639895",
    "question":
        "<div style=\"text-align:left;width:100%;\"><span style=\"text-align: inherit;\">teddy</span></div>",
    "answer": ""
  }
];

List<Map<String, dynamic>> correctAnswer = [
  {"id": "1694179398907", "name": "book"},
  {"id": "1694179446046", "name": "kick"},
  {"id": "1694179523296", "name": "award"},
  {"id": "1694179639895", "name": "teddy"}
];

List<Map<String, dynamic>> _getOriginalQAnswer = [
  {"id": "1694179398907", "name": "book"},
  {"id": "1694179446046", "name": "kick"},
  {"id": "1694179523296", "name": "award"},
  {"id": "1694179639895", "name": "teddy"}
];
List<Map<String, dynamic>> qAnswer = List.from(_getOriginalQAnswer);

// Create a list of shuffled indices
List<int> shuffledIndices = List.generate(qAnswer.length, (index) => index)
  ..shuffle();

class textToImage extends StatefulWidget {
  const textToImage({Key? key}) : super(key: key);
  @override
  textToImageState createState() => textToImageState();
}

class textToImageState extends State<textToImage> {
  @override
  Widget build(BuildContext context) {
    // Shuffle the qAnswer list randomly
    qAnswer.shuffle();
    return Container(
      width: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 520,
            width: 700,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.lightGreen[400],
                  width: 700,
                  height: 80,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'Drag and Drop:',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 410,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),

                      //Main Container
                      Container(
                        height: 80,
                        width: 650,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: Colors.grey.withOpacity(0.5)),
                        ),
                        child: DragTarget<String>(
                          onAccept: (value) {
                            setState(() {
                              qAnswer.add({'name': value});
                            });
                          },
                          builder: (context, acceptedData, rejectedData) {
                            // This is the area where you can drop items
                            // Customize it according to your design
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: qAnswer.length,
                              itemBuilder: (context, index) {
                                String qAnswerName = qAnswer[index]['name'];
                                return Draggable(
                                  data: qAnswerName,
                                  child: Container(
                                    width: 80, // Adjust the width as needed
                                    height: 80,
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.black),
                                    ),
                                    child: Text(
                                        // qAnswerName,
                                        ""),
                                  ),
                                  feedback: Container(
                                    width: 80, // Adjust the width as needed
                                    height: 80,
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.black),
                                    ),
                                    // child: Text(qAnswerName),
                                    child: Text(" "),
                                  ),
                                  childWhenDragging: Container(),
                                );
                              },
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      // Bottom Container
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis
                                    .horizontal, // To make it scroll horizontally
                                itemCount: qAnswerList.length,
                                itemBuilder: (context, index) {
                                  String answer = qAnswerList[index]['answer'];
                                  return DragTarget<String>(
                                    builder: (context, accepted, rejected) {
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.black),
                                              ),
                                              child: Draggable<String>(
                                                data: qAnswerList[index][
                                                    'question'], // Data to be dragged
                                                child: Container(
                                                  margin: EdgeInsets.all(8.0),
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.black),
                                                  ),
                                                  child: qAnswerList[index]
                                                              ['question']
                                                          .isEmpty
                                                      ? Text("")
                                                      : Text(""
                                                          // qAnswerList[index]
                                                          //     ['question'],
                                                          ),
                                                ),
                                                feedback: Container(
                                                  // Customize the appearance of the dragged item
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.black),
                                                  ),
                                                  child: Center(
                                                    child: Text(""
                                                        // qAnswerList[index]
                                                        //     ['question'],
                                                        ),
                                                  ),
                                                ),
                                                childWhenDragging:
                                                    Container(), // Empty container when dragging
                                                onDragCompleted: () {
                                                  // qAnswerList[index]
                                                  //     ['question'] = "";
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.black),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  answer,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    onAccept: (value) {
                                      // setState(() {
                                      //   qAnswerList[index]['question'] = value;
                                      //   // qAnswer.remove(value);
                                      //   qAnswer.removeWhere(
                                      //       (item) => item['name'] == value);
                                      // });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
