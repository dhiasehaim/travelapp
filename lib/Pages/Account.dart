import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/Pages/EditProfile.dart';
import 'package:travelapp/Pages/NewTrip.dart';
import 'package:travelapp/Pages/SavedPlaces.dart';
import 'package:travelapp/Pages/Settings.dart';
import 'package:travelapp/auth/authservice.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authservice authservice=Authservice();
  List<Map<String, dynamic>> travelStats = [
    {
      'image': 'assets/suitcase.png',
      'label': 'Trips',
      'count': 30,
      'color': Colors.black.withOpacity(0.6)
    },
    {
      'image': 'assets/globe.png',
      'label': 'Countries',
      'count': 24,
      'color': Colors.green
    },
    {
      'image': 'assets/checked.png',
      'label': 'Bucket List',
      'count': 7,
      'color': Colors.orange
    },
  ];
  List<Map<String, dynamic>> journals = [
    {
      'image': 'assets/Constantine2.jpg',
      'title': 'Constantine',
      'Date': "November 2024"
    },
    {'image': 'assets/setif3.jpg', 'title': 'Setif', 'Date': "Janury 2023"},
  ];
  List<Map<String, dynamic>> getsettings(BuildContext context) {
    return [
      {
        'image': 'assets/setting.png',
        'label': 'Account Settings',
        'ontap': () => {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 400),
                      pageBuilder: (_, __, ___) => Settings()))
            }
      },
      {
        'image': 'assets/location-pin.png',
        'label': 'Saved Palces',
        'ontap': () => {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 400),
                      pageBuilder: (_, __, ___) => Savedplaces()))
            }
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    final Settings = getsettings(context);
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 230, 240, 233),
            body: Center(
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        ' My Account',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CircleAvatar(
                        radius: 45.r,
                        backgroundImage: AssetImage('assets/male3.jpg'),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      FutureBuilder(
                        future: authservice.GetFullName(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final fullname = snapshot.data ?? 'User';
                            return Text(
                              fullname,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Adventure Lover',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color.fromARGB(255, 104, 104, 104),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '/',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color.fromARGB(255, 104, 104, 104),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '15 Trips logged',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color.fromARGB(255, 104, 104, 104),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 400),
                                      pageBuilder: (_, __, ___) => Editprofile()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 230, 240, 233),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                minimumSize: Size(130.w, 35.h),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 104, 104, 104),
                                  width: 1.w,
                                ),
                                shadowColor: Colors.black.withOpacity(0.2),
                                elevation: 5),
                            child: Text(
                              'Edit Profile',
                              style:
                                  TextStyle(fontSize: 16.sp, color: Colors.black),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 400),
                                  pageBuilder: (_, __, ___) => Newtrip()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 230, 240, 233),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            minimumSize: Size(130.w, 35.h),
                            side: BorderSide(
                              color: Color.fromARGB(255, 104, 104, 104),
                              width: 1.w,
                            ),
                            shadowColor: Colors.black.withOpacity(0.2),
                            elevation: 5),
                        child: Text(
                          'New Trip',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                      ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          child: Text(
                            'Travel Stats',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: travelStats.map((stat) {
                            return Container(
                              width: 100.w,
                              height: 100.h,
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 215, 224, 217),
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    stat['image'],
                                    width: 40.w,
                                    height: 40.h,
                                    color: stat['color'],
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    stat['label'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    stat['count'].toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          child: Text(
                            'My travel journals',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 90.h,
                        child: ListView.builder(
                          itemCount: journals.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Container(
                                height: 90.h,
                                width: 195.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  color: Color.fromARGB(255, 215, 224, 217),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14.r),
                                        bottomLeft: Radius.circular(14.r),
                                      ),
                                      child: Image.asset(
                                        journals[index]['image'],
                                        width: 70.w,
                                        height: 90.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journals[index]['title'],
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          journals[index]['Date'],
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          child: Text(
                            'Settings / Preferences',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 300.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Color.fromARGB(255, 215, 224, 217),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: Column(
                          children: Settings.map((setting) {
                            return  ListTile(
                                leading: Image.asset(
                                  setting['image'],
                                  width: 24.w,
                                  height: 24.h,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                title: Text(
                                  setting['label'],
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                onTap: setting['ontap'],
                              );
                            
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
