import 'package:ctj/screens/home/bottomnav/bottomhome.dart';
import 'package:ctj/screens/home/home.dart';
import 'package:ctj/screens/home/useredit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final TextEditingController _postcontroller = TextEditingController();
  final selecttype = 'Lawyer';
  String? selectLawyer = "Select";
  List<String> type = ['Select', 'Lawyer 1', 'Lawyer 2'];
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
                  Image.asset('assets/htp.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: UserPage1(),
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300)));
                      },
                      child: Image.asset('assets/userpic.png'),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/userpic.png',
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Name \nLocation',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width.w,
                      decoration: BoxDecoration(
                          color: Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.add_box,
                            size: 55,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 150.0,
                      child: TextField(
                        controller: _postcontroller,
                        maxLines: null,
                        maxLength: 1200,
                        decoration: InputDecoration(
                          labelText: 'Enter Paragraph (max 1200 characters)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    if (selecttype != 'Lawyer')
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectLawyer,
                              onChanged: (String? newtype) {
                                setState(() {
                                  selectLawyer = newtype;
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
                      height: 25.h,
                    ),
                    selecttype == 'Lawyer'
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                      child: HomePage(),
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300)),
                                  (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text(
                              'Post',
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ))
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                      child: HomePage(),
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300)),
                                  (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text(
                              'Request',
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
