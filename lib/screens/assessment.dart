import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ohsapp/screens/home_user.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  TextEditingController assessmentDate = TextEditingController(
      text: DateFormat('d-M-y').format(DateTime.now()).toString());
  TextEditingController room = TextEditingController();

  final List<bool> _number1 = [false, false, false, false];
  final List<bool> _number2 = [false, false, false];
  final List<bool> _number3 = [false, false, false];
  final List<bool> _number4 = [false, false, false];
  final List<bool> _number5 = [false];
  final List<bool> _number6 = [false];
  final List<bool> _number7 = [false];
  final List<bool> _number8 = [false];
  final List<bool> _number9 = [false];
  final List<bool> _number3_1 = [false];
  final List<bool> _number3_2 = [false, false, false, false];
  final List<bool> _number3_3 = [false, false, false];
  final List<bool> _number3_4 = [false, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF41D207),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'ประเมินห้องปฏิบัติการ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Open Sans',
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
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
        // toolbarHeight: MediaQuery.of(context).size.height * 0.15,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SizedBox(
            // width: MediaQuery.of(context).size.width * 0.8,

            child: ListView(
              shrinkWrap: true,
              children: [
                ExpansionTile(
                  title: const Text(
                    "ส่วนที่ 1",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "ข้อมูลห้องปฏิบัติการ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  textColor: const Color(0xFF41D207),
                  iconColor: const Color(0xFF41D207),
                  childrenPadding: const EdgeInsets.all(8),
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: assessmentDate,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "วันที่ทำประเมิน",
                            floatingLabelStyle: TextStyle(fontSize: 18),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: room,
                          decoration: const InputDecoration(
                            hintText: "หมายเลขห้องปฏิบัติการเคมี",
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ส่วนที่ 2
                ExpansionTile(
                  title: const Text(
                    "ส่วนที่ 2",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "แบบประเมินกฎหมายกระทรวง",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  textColor: const Color(0xFF41D207),
                  iconColor: const Color(0xFF41D207),
                  childrenPadding: const EdgeInsets.all(8),
                  children: [
                    sectionTitle(
                        leading: "1", subtitle: "ข้อมูลความปลอดภัยสารเคมี"),
                    createSwitchTile(
                      leading: "1.1",
                      title:
                          "จัดทำบัญชีชื่อสารเคมีอันตรายและรายละเอียดความปลอดภัยของสารเคมีอันตราย",
                      boolvar: _number1,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "1.2",
                      title:
                          "อธิบายให้พนักงานเข้าใจข้อมูลความปลอดภัยของสารเคมีอันตราย ได้แก่ข้อความและเครื่องหมายต่าง ๆ",
                      boolvar: _number1,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "1.3",
                      title:
                          "จัดให้พนักงานที่ทำงานเกี่ยวกับสารเคมีอันตรายทราบและเข้าใจวิธีการในการทำงานที่ถูกต้องและปลอดภัย",
                      boolvar: _number1,
                      index: 2,
                    ),
                    createSwitchTile(
                      leading: "1.4",
                      title:
                          "พนักงานปฏิบัติตามวิธีการทำงานที่ถูกต้องและปลอดภัยตามคู่มือการปฏิบัติงาน",
                      boolvar: _number1,
                      index: 3,
                    ),
                    sectionTitle(leading: "2", subtitle: "ฉลากและป้าย"),
                    createSwitchTile(
                      leading: "2.1",
                      title:
                          "มีการติดฉลากที่เป็นภาษาไทยที่มีขนาดใหญ่พอสมควร อ่านง่าย คงทนไว้ที่ภาชนะบรรจุสารเคมีอันตราย",
                      boolvar: _number2,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "2.2",
                      title:
                          "มีป้ายห้าม ป้ายให้ปฏิบัติ หรือป้ายเตือนในการทำงานเกี่ยวกับสารเคมีไว้ชัดเจน",
                      boolvar: _number2,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "2.3",
                      title:
                          "มีป้ายแจ้งข้อความ ห้ามสูบบุหรี่ บริเวณสถานที่ทำงานเกี่ยวกับสารเคมี",
                      boolvar: _number2,
                      index: 2,
                    ),
                    sectionTitle(
                        leading: "3", subtitle: "การคุ้มครองความปลอดภัย"),
                    createSwitchTile(
                      leading: "3.1",
                      title:
                          "พื้นที่ปฏิบัติงาน เรียบ สม่ำเสมอ ไม่ลื่น ไม่มีวัสดุกีดขวางทางเดิน",
                      boolvar: _number3,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "3.2",
                      title: "มีระบบระบายอากาศแบบทั่วไป",
                      boolvar: _number3,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "3.3",
                      title:
                          "มีสถานที่ชำระล้างสารเคมีที่สมารถใช้ได้ทัน กรณีฉุกเฉิน",
                      boolvar: _number3,
                      index: 2,
                    ),
                    sectionTitle(
                        leading: "4",
                        subtitle: "การเก็บรักษา การบรรจุ และการถ่ายเทสารเคมี"),
                    createSwitchTile(
                      leading: "4.1",
                      title:
                          "มีทางเข้าออกสถานที่เก็บรักษาสารเคมีอันตรายไม่น้อยว่า 2 ทาง",
                      boolvar: _number4,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "4.2",
                      title:
                          "จัดทำรั้วล้อมรอบสถานที่เก็บรักษาสารเคมี อันตรายที่อยู่นอกอาคาร",
                      boolvar: _number4,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "4.3",
                      title:
                          "มีป้ายข้อความว่า สถานที่เก็บสารเคมีอันตราย ห้ามเข้าก่อนได้รับอนุญาต",
                      boolvar: _number4,
                      index: 2,
                    ),
                    sectionTitle(
                        leading: "6",
                        subtitle: "การขนถ่าย การเคลื่อนย้าย หรือการขนส่ง"),
                    createSwitchTile(
                      leading: "5.1",
                      title:
                          "มีเครื่องดับเพลิงชนิดเคลื่อนย้ายได้ที่มีคุณสมบัติ สามารถดับเพลิงจากสารเคมีอันตรายได้",
                      boolvar: _number5,
                      index: 0,
                    ),
                    sectionTitle(leading: "6", subtitle: "การจัดการและกำจัด"),
                    createSwitchTile(
                      leading: "6.1",
                      title:
                          "กำจัดสารเคมีอันตรายที่หก รั่วไหล หรือไม่ใช้แล้ว โดยการเผา หรือฝัง",
                      boolvar: _number6,
                      index: 0,
                    ),
                    sectionTitle(
                        leading: "7",
                        subtitle: "การควบคุมระดับความเข้มข้นของสารเคมี"),
                    createSwitchTile(
                      leading: "7.1",
                      title:
                          "มีการตรวจวัดและวิเคราะห์ความเข้มข้นของสารเคมีอันตรายในบรรยากาศของห้องปฏิบัติการ",
                      boolvar: _number7,
                      index: 0,
                    ),
                    sectionTitle(leading: "8", subtitle: "การดูแลสุภาพอนามัย"),
                    createSwitchTile(
                      leading: "8.1",
                      title:
                          "มีการประเมินความเสี่ยงต่อสุขภาพของพนักงานที่มี การใช้สารเคมีอันตรายเป็นประจำ",
                      boolvar: _number8,
                      index: 0,
                    ),
                    sectionTitle(
                        leading: "9",
                        subtitle: "การควบคุมและปฏิบัติการกรณีฉุกเฉิน"),
                    createSwitchTile(
                      leading: "9.1",
                      title: "มีการฝึกซ้อมแผนฉุกเฉินให้กับพนักงาน",
                      boolvar: _number9,
                      index: 0,
                    ),
                  ],
                ),
                // ส่วนที่ 3
                ExpansionTile(
                  title: const Text(
                    "ส่วนที่ 3",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "แบบประเมินมาตรฐาน",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  textColor: const Color(0xFF41D207),
                  iconColor: const Color(0xFF41D207),
                  childrenPadding: const EdgeInsets.all(8),
                  children: [
                    sectionTitle(
                        leading: "1",
                        subtitle: "การบริหารระบบจัดการด้านความปลอดภัย"),
                    createSwitchTile(
                      leading: "1.1",
                      title:
                          "จัดให้มีผู้รับผิดชอบดูแลด้านความปลอดภัยในเรื่อ การจัดสารเคมี",
                      boolvar: _number3_1,
                      index: 0,
                    ),
                    sectionTitle(leading: "2", subtitle: "การจัดระบบสารเคมี"),
                    createSwitchTile(
                      leading: "2.1",
                      title: "มีการบันทึกข้อมูลการนำเข้า-ออกสารเคมี",
                      boolvar: _number3_2,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "2.2",
                      title: "มีการปรับข้อมูลสารเคมีให้เป็นปัจจุบัน อยู่เสมอ",
                      boolvar: _number3_2,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "2.3",
                      title:
                          "มีการแยกเก็บสารเคมีตามสมบัติการเข้ากันไม่ได้ของสารเคมี",
                      boolvar: _number3_2,
                      index: 2,
                    ),
                    createSwitchTile(
                      leading: "2.4",
                      title:
                          "จัดเก็บสารเคมีทุกชนิดอย่างปลอดภัยตามตำแหน่งที่แน่นอน ไม่วางสารเคมีบริเวณทางเดิน",
                      boolvar: _number3_2,
                      index: 3,
                    ),
                    sectionTitle(
                        leading: "3", subtitle: "ระบบการจัดการของเสีย"),
                    createSwitchTile(
                      leading: "3.1",
                      title: " มีรายงานข้อมูลของเสียที่เกิดขึ้น",
                      boolvar: _number3_3,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "3.2",
                      title: "มีการแยกของเสียอันตรายออกจากของเสียทั่วไป",
                      boolvar: _number3_3,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "3.3",
                      title: "มีพื้นที่/บริเวณที่เก็บของเสียที่แน่นอน",
                      boolvar: _number3_3,
                      index: 2,
                    ),
                    sectionTitle(
                        leading: "4",
                        subtitle:
                            "ลักษณะทางกายภาพของห้องปฏิบัติการอุปกรณ์และเครื่องมือ"),
                    createSwitchTile(
                      leading: "4.1",
                      title: " มีหน้าต่างที่สามารถเปิดออกเพื่อระบายอากาศได้",
                      boolvar: _number3_4,
                      index: 0,
                    ),
                    createSwitchTile(
                      leading: "4.2",
                      title:
                          "บริเวณเส้นทางเดินสู่ทางออกไม่ผ่านส่วนอันตราย เช่น ตู้เก็บสารเคมี ตู้ดูดควัน",
                      boolvar: _number3_4,
                      index: 1,
                    ),
                    createSwitchTile(
                      leading: "4.3",
                      title:
                          "มีอ่างน้ำตั้งอยู่ในห้องปฏิบัติการอย่างน้อย 1 ตำแหน่ง",
                      boolvar: _number3_4,
                      index: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                submitBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createSwitchTile(
      {required String leading,
      required String title,
      required List<bool> boolvar,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CheckboxListTile(
          title: Text(title),
          secondary: Text(leading),
          value: boolvar[index],
          onChanged: (value) {
            setState(() {
              boolvar[index] = value!;
            });
          }),
    );
  }

  sectionTitle({required String leading, required String subtitle}) {
    return Container(
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 226, 210),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Text(leading),
        title: Text(subtitle),
      ),
    );
  }

  Widget submitBtn() {
    return SizedBox(
      height: 60,
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 40, 88, 20)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
            ),
            onPressed: () {},
            child: const Text('ส่งแบบประเมิน'),
          ),
        ),
      ),
    );
  }
}
