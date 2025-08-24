import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Savedplaces extends StatefulWidget {
  const Savedplaces({super.key});

  @override
  State<Savedplaces> createState() => _SavedplacesState();
}

class _SavedplacesState extends State<Savedplaces> {
  List<Map<String, dynamic>> SavedPlaces = [
    {
      'image': 'assets/oran.jpg',
      'name': 'Oran City',
      'country': 'Algeria',
      'Addedby': 'Dhia Sehaim'
    },
    {
      'image': 'assets/tmanraset.jpg',
      'name': 'Tamanrasset Sahara',
      'country': 'Algeria',
      'Addedby': 'Joe Kelly'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
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
              'Saved Places',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          backgroundColor: Color.fromARGB(255, 230, 240, 233),
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    children: [
                      ...SavedPlaces.map((place) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), 
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r),
                                      bottomLeft: Radius.circular(15.r),
                                    ),
                                    child: Image.asset(
                                      place['image'],
                                      width: 100.w,
                                      //height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            place['name'],
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            place['country'],
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Added by ${place['Addedby']}',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                              Padding(
                                             padding: EdgeInsets.only(right: 10.w),
                                             child: Align(
                                              alignment: Alignment.centerRight,
                                               child: Image.asset(
                                                        'assets/saved.png',
                                                        height: 17.h,
                                                        width: 20.w,
                                                      ),
                                             ),
                                           ),
                                           
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )).toList(),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
