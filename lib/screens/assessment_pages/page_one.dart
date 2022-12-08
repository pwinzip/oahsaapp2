import 'package:flutter/material.dart';
import 'package:ohsapp/screens/assessment_pages/assessment_widget.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final String titleAppbar = "หน้าที่ 1";
  final String _sectionId = "section_1";

  // Think about they return the value

  // the answerList should be add to ResultModel.questionAnswer
  // create ResultModel Class: sectionId, score, questionAnswer
  // add ResultModel to list of _results -- index 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppbar),
      ),
      body: SafeArea(
        child: AssessmentWidget(sectionId: _sectionId),
      ),
    );
  }
}
