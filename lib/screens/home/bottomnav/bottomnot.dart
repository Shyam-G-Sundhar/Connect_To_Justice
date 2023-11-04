import 'package:ctj/screens/home/message/chat.dart';
import 'package:ctj/screens/home/useredit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class BottomNotify extends StatefulWidget {
  const BottomNotify({super.key});

  @override
  State<BottomNotify> createState() => _BottomNotifyState();
}

class _BottomNotifyState extends State<BottomNotify> {
  final TextEditingController _searchController = TextEditingController();
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
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InviteAccept(
                        status: 'Accept',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InviteAccept(
                        status: 'Reject',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InviteAccept(
                        status: 'Accept',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InviteAccept(
                        status: 'Reject',
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

class InviteAccept extends StatefulWidget {
  InviteAccept({
    super.key,
    required this.status,
  });
  final status;
  @override
  State<InviteAccept> createState() => _InviteAcceptState();
}

class _InviteAcceptState extends State<InviteAccept> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: Container(
        width: MediaQuery.of(context).size.width.w,
        child: Card(
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/userpic.png'),
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                widget.status == 'Accept'
                    ? Icon(
                        Icons.check_circle,
                        size: 35,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.dangerous_outlined,
                        size: 35,
                        color: Colors.red,
                      )
              ],
            ),
            children: [
              SizedBox(
                height: 25.h,
              ),
              widget.status == 'Accept'
                  ? Text(
                      'Congraluations,\nYour Invitation was Accepted\nBy the Lawyer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )
                  : Text(
                      'Sorry,\nYour Invitation was Rejected\nBy the Lawyer\nDue to Insufficient Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
