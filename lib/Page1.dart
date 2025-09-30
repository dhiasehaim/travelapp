import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:travelapp/Loginpages/Login.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          body: Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                //color: Colors.black.withOpacity(0.5),
                image: const DecorationImage(
                  image: AssetImage('assets/page1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Your Journey',
                      style: TextStyle(
                        fontSize: 37.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Begins Here',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Explore the most popular travel experiences and discover new adventures.',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SlideAction(
                      onSubmit: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => Login(),
                                transitionsBuilder: (_, animate, __, child) {
                                  return FadeTransition(
                                    opacity: animate,
                                    child: child,
                                  );
                                }));
                        return null;
                      },
                      innerColor: Color.fromARGB(255, 165, 169, 59),
                      outerColor: Colors.white.withOpacity(0.1),
                      sliderButtonIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      text: 'Swipe to Explore',
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
