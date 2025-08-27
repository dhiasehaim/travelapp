import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 230, 240, 233),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 230, 240, 233),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage('assets/dhia.jpg'),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Dhia Sehaim',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Adventurer Seeker',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    buildTextField(
                      'Name',
                      'Dhia ',
                      Icons.person,
                      false,
                      nameController,
                    ),
                    buildTextField(
                      'Family name',
                      'Sehaim',
                      Icons.family_restroom,
                      false,
                      familyNameController,
                    ),
                    buildTextField(
                      'Email',
                      'Email',
                      Icons.email,
                      false,
                      emailController,
                      isemail: true,
                    ),
                    buildTextField(
                      'Password',
                      '********',
                      Icons.lock,
                      obscureText,
                      passwordController,
                      ispassword: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Save profile changes
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 215, 224, 217),
                        padding: EdgeInsets.symmetric(
                            horizontal: 100.w, vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(String labelText, String hintText, IconData? prefixIcon, bool obscureText,
      TextEditingController? controller,
      {isemail = false, ispassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: TextFormField(
        controller: controller,
        obscureText: ispassword ? obscureText : false,
        keyboardType: isemail ? TextInputType.emailAddress : TextInputType.text,
        //validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.black.withOpacity(0.6))
              : null,
          suffixIcon: ispassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(Icons.visibility_off))
              : null,
          filled: true,
          fillColor: const Color.fromARGB(255, 230, 240, 233),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.4), width: 1.2.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.black, width: 1.5.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 1.w),
          ),
        ),
      ),
    );
  }
}
