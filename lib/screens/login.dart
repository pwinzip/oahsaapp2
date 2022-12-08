import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ohsapp/services/auth_service.dart';
import 'package:ohsapp/screens/home_user.dart';
import 'package:ohsapp/screens/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();

    // Check User logged in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF42B48B),
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: const Text(
      //     'เข้าสู่ระบบ',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //       fontWeight: FontWeight.w900,
      //     ),
      //   ),
      //   // toolbarHeight: MediaQuery.of(context).size.height * 0.15,
      // ),
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                logo(),
                const SizedBox(height: 8),
                email(),
                const SizedBox(height: 12),
                password(),
                const SizedBox(height: 18),
                loginBtn(),
                const SizedBox(height: 18),
                actionBtn(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget logo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image.asset(
        "assets/images/logo_app.LSI.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget email() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   color: Colors.white70,
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "ระบุอีเมล์",
          // border: InputBorder.none,
          // focusedBorder: InputBorder.none,
          // enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: passController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "ระบุรหัสผ่าน",
          // border: InputBorder.none,
          // focusedBorder: InputBorder.none,
          // enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget loginBtn() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF42B48B)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          )),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            User? user = await AuthService.signInWithEmail(
                email: emailController.text, password: passController.text);
            if (!mounted) return;
            if (user != null) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserHomePage(),
              ));
            }
          }
        },
        child: const Text('เข้าสู่ระบบ'),
      ),
    );
  }

  Widget actionBtn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          registBtn(),
          forgotPassBtn(),
        ],
      ),
    );
  }

  Widget registBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 39, 49, 34)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromARGB(255, 39, 49, 34)),
              borderRadius: BorderRadius.circular(16),
            )),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ));
          },
          child: const Text("สมัครสมาชิก")),
    );
  }

  Widget forgotPassBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 35, 91, 7)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
          ),
          onPressed: () {},
          child: const Text("ลืมรหัสผ่าน")),
    );
  }
}
