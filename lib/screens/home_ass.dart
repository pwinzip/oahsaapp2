import 'package:flutter/material.dart';
import 'package:ohsapp/screens/assessment.dart';

import 'home_user.dart';

class AssessmentHomePage extends StatefulWidget {
  const AssessmentHomePage({super.key});

  @override
  State<AssessmentHomePage> createState() => _AssessmentHomePageState();
}

class _AssessmentHomePageState extends State<AssessmentHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 8),
                logo(),
                const SizedBox(height: 8),
                description(),
                const SizedBox(height: 16),
                confirmBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Image.asset(
        "assets/images/logo.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget description() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF41D207),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Text(
            "แบบประเมินชุดนี้เป็นส่วนหนึ่งของโครงการวิจัยเรื่องแอพพลิเคชั่นการประเมินทางด้าน "
            "อาชีวอนามัยและความปลอดภัยสำหรับห้อง ปฏิบัติการเคมีในมหาวิทยาลัยทักษิณ วิทยาเขตพัทลุง",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            "จัดทำขึ้นเพื่อตรวจสอบว่าห้องปฏิบัติการทาง เคมีนี้ได้ประเมินผ่านแอพพลิเคชั่นแล้วเป็นไปตาม"
            "กฎหมายและมาตรที่เกี่ยวข้องหรือไม่ที่จะอยู่ในระดับใด",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            "ข้อมูลนี้จะถือเป็นความลับไม่เปิดเผยต่อบุคคลอื่นโดยจะนำเสนอผลการศึกษาในภาพรวม "
            "การดำเนินงานวิจัยจะไม่มีผลกระทบใดๆ แก่ผู้ทำแบบประเมินผู้วิจัยจึงขอความกรุณา "
            "จากท่านได้ช่วยตอบแบบประเมินใช้ครบด้าน ทุกข้อตามความเป็นจริง",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget confirmBtn() {
    return SizedBox(
      height: 50,
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AssessmentPage(),
            ),
          );
        },
        child: const Text('ยืนยัน'),
      ),
    );
  }
}
