import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/Loginpages/Signup.dart';
import 'package:travelapp/Pages/mainpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 230, 240, 233),
          body: Center(
              child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 215, 224, 217),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/travel.png',
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Welcom Back !',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Ready for your next Adventure',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                  ),
                  _buildTextFiled('Email Address', 'Enter your Email',
                      emailController, Icons.email_outlined,
                      isemail: true),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                  ),
                  _buildTextFiled('Password', 'Enter your Password',
                      passwordController, Icons.lock,
                      ispassword: true),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remember me',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 15.sp),
                        ),
                        GestureDetector(
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 400),
                            pageBuilder: (_,__,___)=>Mainpage(),
                            transitionsBuilder: (_, animation, __, child){
                              return FadeTransition(
                                child: child,
                                opacity: animation,
                              );
                            }
                            ));
                        },
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                            color: Colors.blue,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              transitionsBuilder: (_,animation,__,child){
                                return FadeTransition(opacity: animation,child: child,);
                              },
                              pageBuilder: (_,__,___)=>Signup()));
                          },
                            child: Text(
                          " Sign up",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
        );
      },
    );
  }

  Widget _buildTextFiled(String labeltext, String hinttext,
      TextEditingController? controller, IconData? prefixicon,
      {isemail = false, ispassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      child: TextFormField(
        controller: controller,
        obscureText: ispassword ? obscureText : false,
        keyboardType: isemail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixicon,
              color: Colors.black.withOpacity(0.6),
            ),
            suffixIcon: ispassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        !obscureText ? Icons.visibility : Icons.visibility_off))
                : null,
            hintText: hinttext,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
            //labelText: labeltext,
            //labelStyle: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 17.sp,fontWeight: FontWeight.w400),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1.w),
            )),
      ),
    );
  }
}
