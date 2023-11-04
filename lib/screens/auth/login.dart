import 'package:ctj/screens/auth/register.dart';
import 'package:ctj/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> logform = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String? selecttype = "Select";
  bool isShow = true;
  List<String> type = ['Select', 'Lawyer', 'Client'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xff8EAFC7),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Image.asset(
                      'assets/tplg.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 45.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                        key: logform,
                        child: Container(
                          height: 220.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                              SizedBox(
                                height: 5.h,
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
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
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
                                                ? Icon(
                                                    Icons.visibility_outlined,
                                                    size: 25)
                                                : Icon(
                                                    Icons
                                                        .visibility_off_outlined,
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
                              SizedBox(
                                height: 7.h,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black, width: 0),
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
                              SizedBox(
                                height: 5.h,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: HomePage(),
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          ),
                        )),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account? ",
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
                                  child: RegisterPage(),
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.leftToRight,
                                ),
                                (route) => true);
                          },
                          child: Text(
                            'Register',
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
