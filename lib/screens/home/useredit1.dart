import 'package:ctj/screens/home/home.dart';
import 'package:ctj/screens/home/useredit2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class UserPage1 extends StatefulWidget {
  const UserPage1({super.key});

  @override
  State<UserPage1> createState() => _UserPage1State();
}

class _UserPage1State extends State<UserPage1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/htp.png'),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                PageTransition(
                                    child: HomePage(),
                                    type: PageTransitionType.fade),
                                (route) => false);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                PageTransition(
                                  child: UserPage2(),
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.leftToRight,
                                ),
                                (route) => true);
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 30,
                          )))
                ],
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Image.asset(
                'assets/userpicbig.png',
              ),
              SizedBox(
                height: 45.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 25.h, left: 35.h),
                child: Container(
                  height: 185.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FieldVal(
                        fieldname: 'Name',
                        name: 'XXXXXXX',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FieldVal(
                        fieldname: 'Off. Loc',
                        name: 'XYXY',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FieldVal(
                        fieldname: 'Phone',
                        name: '+91-1234567890',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      FieldVal(
                        fieldname: 'E-mail',
                        name: 'abc@xyz.com',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FieldVal extends StatefulWidget {
  FieldVal({
    super.key,
    required this.fieldname,
    required this.name,
  });
  final name, fieldname;
  @override
  State<FieldVal> createState() => _FieldValState();
}

class _FieldValState extends State<FieldVal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.fieldname} :',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '${widget.name}',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp),
        ),
      ],
    );
  }
}
