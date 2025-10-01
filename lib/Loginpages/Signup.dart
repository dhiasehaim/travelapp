import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/Loginpages/Login.dart';
import 'package:travelapp/auth/authservice.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool obscureText = false;
  TextEditingController FullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswrodController = TextEditingController();
  Authservice authservice=Authservice();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
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
                      height: 15.h,
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
                    
                    Text(
                      'Start your Journy !',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Discover amazing destinations around the world',
                      style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    _buildTextFiled('Full name', 'Enter your full name',
                        FullNameController, Icons.person_rounded),
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
                    _buildTextFiled('Eamil', 'Enter your Email',
                        emailController, Icons.email_rounded,
                        isemail: true),
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
                    _buildTextFiled('Full name', 'Enter your Passwrod',
                        passwordController, Icons.lock_rounded,
                        ispassword: true),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    _buildTextFiled('Full name', 'Confirm your Passwrod',
                        passwordController, Icons.lock_rounded,
                        ispassword: true),
                        SizedBox(height: 10.h,),
                         Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          authservice.signUpWithPassword(FullNameController.text, emailController.text, passwordController.text);
                          Navigator.push(context, PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 400),
                            pageBuilder: (_,__,___)=>Login(),
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
                              'Sign Up',
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
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account ? ",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              transitionsBuilder: (_,animation,__,child){
                                return FadeTransition(opacity: animation,child: child,);
                              },
                              pageBuilder: (_,__,___)=>Login()));
                          },
                            child: Text(
                          " Sign in",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                  )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextFiled(String labeltext, String hinttext,
      TextEditingController? controller, IconData? prefixicon,
      {isemail = false, ispassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
