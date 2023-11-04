import 'package:ctj/screens/home/message/chat.dart';
import 'package:ctj/screens/home/useredit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class BottomMsg extends StatefulWidget {
  const BottomMsg({super.key});

  @override
  State<BottomMsg> createState() => _BottomMsgState();
}

bool isMsg = false;

class _BottomMsgState extends State<BottomMsg> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    isMsg = false;
    super.initState();
  }

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
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.0.h),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontSize: 15.sp),
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      size: 25,
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 600,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InviteCard(),
                      InviteCard(),
                      InviteCard(),
                      InviteCard(),
                      InviteCard(),
                      InviteCard(),
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

class InviteCard extends StatefulWidget {
  const InviteCard({
    super.key,
  });

  @override
  State<InviteCard> createState() => _InviteCardState();
}

class _InviteCardState extends State<InviteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.h),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/userpic.png',
              width: 80,
              height: 80,
            ),
            Text(
              'Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: isMsg == false
                  ? Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isMsg = true;
                              });
                            },
                            icon: Icon(
                              Icons.check_circle_outline,
                              size: 45,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.dangerous_outlined,
                              size: 45,
                              color: Colors.black54,
                            ))
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(PageTransition(
                            child: LawChat(),
                            type: PageTransitionType.leftToRight,
                            duration: Duration(microseconds: 300)));
                      },
                      child: Text(
                        'Message',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
