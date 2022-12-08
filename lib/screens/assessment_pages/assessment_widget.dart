import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/answer_model.dart';
import '../home_user.dart';

class AssessmentWidget extends StatefulWidget {
  const AssessmentWidget({super.key, required this.sectionId});

  final String sectionId;

  @override
  State<AssessmentWidget> createState() => _AssessmentWidgetState();
}

class _AssessmentWidgetState extends State<AssessmentWidget> {
  final formKey = GlobalKey<FormState>();
  // get DocumentReference from _sectionId
  final double sectionScore = 0.0;
  final List<QuestionAnswer> answerList = [];
  late final QuestionAnswer _sectionAnswer;

  // get questions by sectionId
  // define Question Model
  // do it through Assessment Widget

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // use Futurebuilder
    var section = await FirebaseFirestore.instance
        .collection("Section")
        .doc(widget.sectionId)
        .get()
        .then((value) {
      print(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ประเมินห้องปฏิบัติการ',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserHomePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SizedBox(),
        ),
      ),
    );
  }
}
