import 'package:flutter/material.dart';

List<Map<String, dynamic>> qAnswerList = [
  {"id": "1694155882396", "question": "", "answer": "Flowers"},
  {"id": "1694155913000", "question": "", "answer": "Oranges"},
  {"id": "1694155949574", "question": "", "answer": "Puppy"},
  {"id": "1694165278660", "question": "", "answer": "Paris"}
];

List<Map<String, dynamic>> correctAnswer = [
  {
    "id": "1694155882396",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/4539173a-c004-4d00-ab1c-8fc69ddeddb6.png?w=100%&h=100%&carve=true&format=png"
  },
  {
    "id": "1694155913000",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/29f06f4d-29aa-4a1a-bb80-2814f56f8f2e.png?w=100%&h=100%&carve=true&format=png"
  },
  {
    "id": "1694155949574",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/82fa64c8-63d5-47a5-90a8-43cab1c75b58.jpg?w=100%&h=100%&carve=true&format=png"
  },
  {
    "id": "1694165278660",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/25a885f5-f128-45b9-9f99-05e6c6989b04.jpeg?w=100%&h=100%&carve=true&format=png"
  }
];

List<Map<String, dynamic>> _getOriginalQAnswer = [
  {
    "id": "1694155882396",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/4539173a-c004-4d00-ab1c-8fc69ddeddb6.png?w=100%&h=100%&carve=true&format=png"
  },
  {
    "id": "1694155913000",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/29f06f4d-29aa-4a1a-bb80-2814f56f8f2e.png?w=100%&h=100%&carve=true&format=png"
  },
  {
    "id": "1694155949574",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/82fa64c8-63d5-47a5-90a8-43cab1c75b58.jpg?w=100%&h=100%&carve=true&format=png"
  },
  {
    "id": "1694165278660",
    "name":
        "https://files.semanoor.com/cjyk4p7jm00hq0a92g6n5epsx/cl7frbio1bhs10860sb4lqoph/25a885f5-f128-45b9-9f99-05e6c6989b04.jpeg?w=100%&h=100%&carve=true&format=png"
  }
];
List<Map<String, dynamic>> qAnswer = List.from(_getOriginalQAnswer);

// Create a list of shuffled indices
List<int> shuffledIndices = List.generate(qAnswer.length, (index) => index)
  ..shuffle();

class imageToText extends StatefulWidget {
  const imageToText({Key? key}) : super(key: key);
  @override
  imageToTextState createState() => imageToTextState();
}

class imageToTextState extends State<imageToText> {
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
                                    child: Image.network(
                                      qAnswerName,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  feedback: Container(
                                    width: 80, // Adjust the width as needed
                                    height: 80,
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.black),
                                    ),
                                    child: Image.network(
                                      qAnswerName,
                                      fit: BoxFit.cover,
                                    ),
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
                                                      : Image.network(
                                                          qAnswerList[index]
                                                              ['question'],
                                                          fit: BoxFit.cover,
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
                                                    child: Image.network(
                                                      qAnswerList[index]
                                                          ['question'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                childWhenDragging:
                                                    Container(), // Empty container when dragging
                                                onDragCompleted: () {
                                                  qAnswerList[index]
                                                      ['question'] = "";
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
                                      setState(() {
                                        qAnswerList[index]['question'] = value;
                                        // qAnswer.remove(value);
                                        qAnswer.removeWhere(
                                            (item) => item['name'] == value);
                                      });
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
