import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/Pages/mainpage.dart';

class Informationpage extends StatefulWidget {
  final Map<String, dynamic> tripData;
  const Informationpage({required this.tripData, super.key});

  @override
  State<Informationpage> createState() => _InformationpageState();
}

class _InformationpageState extends State<Informationpage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    List<Map<String, dynamic>> images = [
      {
        'name': 'Algeris',
        'image': 'assets/page1.jpg',
        'country': "Algeria",
        'countryicon': 'assets/algeria.png',
        'description': 'Peacful and beautiful city',
        'isLiked': false,
        'isSaved': false,
        'personname': 'Jessica Alves',
        'personimage': 'assets/dhia.jpg'
      },
    ];
    List<String> Persons = [
      'assets/male1.jpg',
      'assets/male3.jpg',
      'assets/female2.jpg',
      'assets/female1.jpg',
    ];

    List<String> Setif = [
      'assets/setif.jpg',
      'assets/setif1.jpg',
      'assets/setif2.jpg',
      'assets/setif3.jpg',
    ];
    double val = 0.28;
    final trip= widget.tripData;
    final Title= trip['title'] ?? 'No Title';
    final Description= trip['user_description'] ?? 'No Description';
    final MultiIamge= trip['image_list'] ?? [];
    final Country=trip['countryname'] ?? 'No Country';
    final City=trip['cityname'] ?? 'No City';
    final Name= trip['personname'] ?? 'No Name';
    void _showDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            insetPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: 360.h,
                width: 300.w,
                child: PageView.builder(
                  itemCount: Setif.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.network(
                        MultiIamge[i],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
    }

    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      //primary: false,
                      elevation: 0,
                      expandedHeight: 300.h,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          background: GestureDetector(
                        onTap: () {
                          _showDialog();
                        },
                        child: PageView.builder(
                            itemCount: MultiIamge == null ? 1 : MultiIamge.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                MultiIamge[index],
                                fit: BoxFit.cover,
                              );
                            }),
                      )),
                      leading: Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        transitionsBuilder:
                                            (_, animation, __, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                        pageBuilder: (_, __, ___) =>
                                            Mainpage()));
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ))),
                      actions: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 12.w, top: 8.h),
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        images[0]['isSaved'] =
                                            !(images[0]['isSaved'] as bool);
                                      });
                                    },
                                    child: Image.asset(
                                        images[0]['isSaved']
                                            ? 'assets/saved.png'
                                            : 'assets/unsave.png',
                                        fit: BoxFit.contain,
                                        color: Colors.white,
                                        height: 25.h,
                                        width: 25.w),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12.w, top: 8.h),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    images[0]['isLiked'] =
                                        !images[0]['isLiked'];
                                  });
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      images[0]['isLiked']
                                          ? 'assets/heartfilled.png'
                                          : 'assets/heart.png',
                                      fit: BoxFit.contain,
                                      color: images[0]['isLiked']
                                          ? Colors.red
                                          : Colors.white,
                                      height: 25.h,
                                      width: 25.w,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 400.h,
                        color: Color.fromARGB(255, 230, 240, 233),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 260.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 450.h,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 240, 233),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 14.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              Title,
                              style: TextStyle(
                                  fontSize: 27.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 17.r,
                                  backgroundImage:
                                      AssetImage(images[0]['personimage']),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Added by",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  Name,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                Container(
                                    height: 28.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                        color: Colors.grey.withOpacity(0.2)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        Text('4.2')
                                      ],
                                    )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 28.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.r),
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        'assets/austria.png',
                                        height: 25.h,
                                        width: 25.w,
                                      ),
                                      Text(Country)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '3.9+',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        'people liked this',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                    width: 110.w,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        for (int i = 0; i < Persons.length; i++)
                                          Positioned(
                                            left: i * 26.w,
                                            child: CircleAvatar(
                                              radius: 16.r,
                                              backgroundImage:
                                                  AssetImage(Persons[i]),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 7.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Container(
                              height: 2.h,
                              width: 305.w,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Stack(
                                children: [
                                  FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor: val,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              'What did the photographer said?',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              Description,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
