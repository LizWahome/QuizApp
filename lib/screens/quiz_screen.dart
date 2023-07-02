import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final controllers =
      List.generate(getQuestion().length, (index) => TextEditingController());
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;

  static const values = <String>["Yes", "No"];
  String selectedValue = values.first;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 175, 175),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              qWidget(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Save")),
                  ElevatedButton(
                      onPressed: () async {
                        final answers = controllers
                            .map((controller) => controller.text)
                            .toList();
                        await FirebaseFirestore.instance
                            .collection("Answers")
                            .add({
                          "answers": answers
                        });
                      },
                      child: const Text("Submit")),
                ],
              )
            ],
          )),
    );
  }

  qWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Color(0xFF414046), offset: Offset(3, 3))
                ]),
            child: Column(
              children: [
                Text(questionList[index].questionText),
                //Text(questionList[currentQuestionIndex].questionText[index]),
                buildAnswer(),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Measures Taken"),
                  onSaved: (value) {
                    // save your value here
                  },
                  controller: controllers[index],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAnswer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: values.map((value) {
        return Container(
          width: 150,
          child: RadioListTile<String>(
              value: value,
              groupValue: selectedValue,
              title: Text(value),
              onChanged: (value) => setState(() {
                    selectedValue = value!;
                  })),
        );
      }).toList(),
    );
  }
}

 // questionWidget() {
  //   return Column(
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.all(16),
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(20),
  //             boxShadow: const [
  //               BoxShadow(color: Color(0xFF414046), offset: Offset(3, 3))
  //             ]),
  //         child: Column(
  //           children: [
  //             Text(questionList[currentQuestionIndex].questionText),
  //             buildAnswer(),
  //             TextFormField(
  //               decoration: const InputDecoration(labelText: "Feedback"),
  //               controller: feedbackController,
  //             )
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
