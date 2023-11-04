import 'package:ctj/screens/home/useredit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              HomePost(),
              HomePost(),
              HomePost()
            ],
          ),
        ),
      ),
    );
  }
}

class HomePost extends StatelessWidget {
  const HomePost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width.w,
            decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(20.0)),
          )
        ],
      ),
    );
  }
}
