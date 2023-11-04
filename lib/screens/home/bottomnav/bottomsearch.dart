import 'package:ctj/screens/home/useredit1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
                    borderSide: BorderSide(color: Colors.red, width: 2),
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
              height: 25.h,
            ),
            Container(
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard()
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class InviteCard extends StatelessWidget {
  const InviteCard({
    super.key,
  });

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/userpic.png',
              width: 80,
              height: 80,
            ),
            Text(
              'Name - Designation',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            /*   Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
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
              ),
            )
       */
          ],
        ),
      ),
    );
  }
}
