import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:travelapp/auth/authservice.dart';

class Newtrip extends StatefulWidget {
  const Newtrip({super.key});

  @override
  State<Newtrip> createState() => _NewtripState();
}

class _NewtripState extends State<Newtrip> {
  TextEditingController CountryNameController = TextEditingController();
  TextEditingController CityNameController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController TitleController = TextEditingController();
  List<XFile>? MultiIamge;
  Authservice authservice = Authservice();
  Future<void> PickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        MultiIamge = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 20.h,
                  ),
                  Text(
                    "Add New Trip",
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextFiled(
                              'Contry Name',
                              'Enter Country Name',
                              CountryNameController,
                              Icons.public)),
                      Expanded(
                          child: _buildTextFiled('City Name', 'Enter City Name',
                              CityNameController, Icons.location_city)),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextFiled('Title', 'Enter Title',
                              TitleController, Icons.title)),
                      Expanded(
                          child: _buildTextFiled('Date', 'Enter Date',
                              DateController, Icons.date_range)),
                    ],
                  ),
                  _buildTextFiled('Description', 'Enter Description',
                      DescriptionController, Icons.description,
                      isdescription: true),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: PickImages,
                    child: Container(
                      height: 260.h,
                      width: 325.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.6), width: 1.w)),
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          if (MultiIamge != null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Image.file(
                                File(MultiIamge![index].path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            );
                          } else {
                            return Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo,
                                      size: 40.sp,
                                      color: Colors.black.withOpacity(0.6)),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Add Images Here",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        itemCount: MultiIamge == null ? 1 : MultiIamge!.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      authservice.InserTravelInfo(CountryNameController.text, CityNameController.text, DescriptionController.text, TitleController.text, MultiIamge);
                      Navigator.pop(context);
                    }
                    ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                            horizontal: 100.w, vertical: 15.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r))),
                    child: Text(
                      "Add Trip",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              )
            ],
          )),
        );
      },
    );
  }

  Widget _buildTextFiled(String labeltext, String hinttext,
      TextEditingController? controller, IconData? prefixicon,
      {isemail = false, isdescription = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      child: TextFormField(
        controller: controller,
        keyboardType: isemail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixicon,
              color: Colors.black.withOpacity(0.6),
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
            //labelText: labeltext,
            //labelStyle: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 17.sp,fontWeight: FontWeight.w400),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w, vertical: isdescription ? 60.h : 15.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.6), width: 1.w),
            )),
      ),
    );
  }
}
