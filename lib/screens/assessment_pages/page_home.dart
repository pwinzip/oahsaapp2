import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ohsapp/models/room_model.dart';
import 'package:ohsapp/services/room_service.dart';

import '../../models/assessment_model.dart';
import '../../models/result_model.dart';

class AssessmentHome extends StatefulWidget {
  const AssessmentHome({super.key});

  @override
  State<AssessmentHome> createState() => _AssessmentHomeState();
}

class _AssessmentHomeState extends State<AssessmentHome> {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final RoomDataRepository roomDataRepository = RoomDataRepository();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController(
      text: DateFormat('d-M-y').format(DateTime.now()).toString());

  final List<ListItem> _roomDropdownItems = [];

  List<DropdownMenuItem<ListItem>>? _roomDropdownMenuItems;
  ListItem? _roomSelectedItem;

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem item in dropdownItems) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.name),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    initialization();
    _roomDropdownMenuItems = buildDropdownMenuItem(_roomDropdownItems);
    _roomSelectedItem = _roomDropdownMenuItems![0].value;
  }

  void initialization() async {
    // Retrieve Room from firebase firestore and add to _roomDropdownItems
    var rooms = await roomDataRepository.getRoom();
    rooms.docs.map((data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
    );
  }

  // when press submit button, initial AssessmentModel Class
  // parameter: uid, date, room, avgScore=0.0, results=[]
  // final List<RoomModel> _rooms = [];
  // final List<ResultModel> _results = [];
  // final AssessmentModel assessment;
}

class ListItem {
  DocumentReference value;
  String name;

  ListItem(this.value, this.name);
}
