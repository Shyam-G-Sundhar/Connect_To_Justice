import 'package:ctj/screens/auth/login.dart';
import 'package:ctj/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> regform = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController lawid = TextEditingController();
  final TextEditingController cloc = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  String? selecttype = "Select";
  bool isShow = true;
  List<String> type = ['Select', 'Lawyer', 'Client'];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff8EAFC7),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Stack(
                      children: [
                        Image.asset('assets/regtp.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 35.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: regform,
                      child: Container(
                        height: 420.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              controller: name,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Name:',
                                  alignLabelWithHint: true,
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    size: 25,
                                  ),
                                  fillColor: Colors.grey[100],
                                  hintText: 'Enter Your Name',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1))),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selecttype,
                                    onChanged: (String? newtype) {
                                      setState(() {
                                        selecttype = newtype;
                                      });
                                    },
                                    items: type.map<DropdownMenuItem<String>>(
                                      (String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ),
                            ),
                            (selecttype == 'Lawyer')
                                ? TextFormField(
                                    controller: lawid,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        filled: true,
                                        labelText: 'Lawyer',
                                        alignLabelWithHint: true,
                                        prefixIcon: const Icon(
                                          Icons.info_outlined,
                                          size: 25,
                                        ),
                                        fillColor: Colors.grey[100],
                                        hintText: 'Enter Your Lawyer Id',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                strokeAlign: 1.0, width: 1)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                strokeAlign: 1.0, width: 1))),
                                  )
                                : TextFormField(
                                    controller: cloc,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        filled: true,
                                        labelText: 'Location',
                                        alignLabelWithHint: true,
                                        prefixIcon: const Icon(
                                          Icons.location_searching,
                                          size: 25,
                                        ),
                                        fillColor: Colors.grey[100],
                                        hintText: 'Enter Your Location',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                strokeAlign: 1.0, width: 1)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                strokeAlign: 1.0, width: 1))),
                                  ),
                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Email Id',
                                  alignLabelWithHint: true,
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    size: 25,
                                  ),
                                  fillColor: Colors.grey[100],
                                  hintText: 'Enter Your Email Id',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1))),
                            ),
                            TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Phone',
                                  alignLabelWithHint: true,
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    size: 25,
                                  ),
                                  fillColor: Colors.grey[100],
                                  hintText: 'Enter Your Phone',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1))),
                            ),
                            TextFormField(
                              controller: password,
                              keyboardType: TextInputType.name,
                              obscureText: isShow ? true : false,
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'Password',
                                  alignLabelWithHint: true,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text('Password Rules'),
                                                content: Text(
                                                  'Password must:\n- Be at least 8 characters long\n- Contain at least one capital letter\n- Contain at least one symbol',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.info_outline,
                                              size: 25),
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isShow = !isShow;
                                            });
                                          },
                                          child: isShow
                                              ? Icon(Icons.visibility_outlined,
                                                  size: 25)
                                              : Icon(
                                                  Icons.visibility_off_outlined,
                                                  size: 25),
                                        ),
                                      ],
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 25,
                                  ),
                                  fillColor: Colors.grey[100],
                                  hintText: 'Enter Your Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                          strokeAlign: 1.0, width: 1))),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: HomePage(),
                                          type: PageTransitionType.rightToLeft,
                                          duration:
                                              Duration(milliseconds: 300)));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                PageTransition(
                                  child: LoginPage(),
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.leftToRight,
                                ),
                                (route) => true);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15.sp,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
