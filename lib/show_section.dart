import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ohsapp/models/question_model.dart';
import 'package:ohsapp/models/section_model.dart';
import 'package:ohsapp/services/section_service.dart';

class ShowSection extends StatefulWidget {
  const ShowSection({super.key});

  @override
  State<ShowSection> createState() => _ShowSectionState();
}

class _ShowSectionState extends State<ShowSection> {
  final SectionDataRepository sectionRepository = SectionDataRepository();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();

    // Check User logged in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("show section"),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: sectionRepository.getStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();

            print(snapshot.data?.docs);
            // return Text("OK");
            return _buildList(context, snapshot.data?.docs ?? []);
          },
        ),
      ),
    );
  }

  Widget _buildList(
      BuildContext context, List<QueryDocumentSnapshot<Object?>> snapshot) {
    // print(snapshot);
    // print("_in Build");
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, QueryDocumentSnapshot snapshot) {
    final section =
        SectionModel.fromJson(snapshot.data() as Map<String, dynamic>);
    // print(section.questions.isEmpty ? "no element" : section.questions[0]);
    return Card(
      child: Column(
        children: [
          Text(section.title),
          Text(section.sectionName),
          Column(
            children: section.questions
                .map((question) => _buildQuestionList(question))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionList(DocumentReference<Object?> question) {
    Future<DocumentSnapshot<Object?>> q = question.get();

    return FutureBuilder(
      future: q,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();
        return _buildQuestionListItem(snapshot.data);
      },
    );
  }

  Widget _buildQuestionListItem(DocumentSnapshot<Object?>? snapshot) {
    // print(snapshot!.data());
    final question =
        Question.fromJson(snapshot!.data() as Map<String, dynamic>);

    return Column(
      children: [
        Text(question.questionNo),
        Text(question.description),
      ],
    );
  }
}
