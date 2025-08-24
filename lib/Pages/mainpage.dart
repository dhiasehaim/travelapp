import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:travelapp/Pages/Account.dart';
import 'package:travelapp/Pages/InformationPage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<Map<String, dynamic>> images = [
    {
      'name': 'Algeris',
      'image': 'assets/page1.jpg',
      'country': "Algeria",
      'countryicon': 'assets/algeria.png',
      'description': 'Peacful and beautiful city',
      'isLiked': false,
      'desc': "The Capital charm",
      'rating': "4.6"
    },
    {
      'name': 'Setif',
      'image': 'assets/setif.jpg',
      'country': "Algeria",
      'countryicon': 'assets/algeria.png',
      'description': 'The High Plateau Capital',
      'isLiked': false,
      'desc': "The Beatiful city",
      'rating': "4.9"
    },
    {
      'name': 'Oran',
      'image': 'assets/oran.jpg',
      'country': "Algeria",
      'countryicon': 'assets/algeria.png',
      'description': ' The Radiant City',
      'isLiked': false,
      'desc': "The Capital charm",
      'rating': "4.6"
    },
    {
      'name': 'Tamanrasset',
      'image': 'assets/tmanraset.jpg',
      'country': "Algeria",
      'countryicon': 'assets/algeria.png',
      'description': 'The Gateway to the Sahara',
      'isLiked': false,
      'desc': "The Sahara",
      'rating': "4.6"
    },
    {
      'name': 'Constantine',
      'image': 'assets/Constantine.jpg',
      'country': "Algeria",
      'countryicon': 'assets/algeria.png',
      'description': 'The City of Bridges',
      'isLiked': false,
      'desc': "The Knowledge City",
      'rating': "4.5"
    },
  ];
  List<String> Persons = [
    'assets/male1.jpg',
    'assets/male3.jpg',
    'assets/female2.jpg',
    'assets/female1.jpg',
  ];
  final SwipableStackController _controller = SwipableStackController();
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
          backgroundColor: Color.fromARGB(255, 230, 240, 233),
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Expanded(
            child: SafeArea(
                child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        leading: GestureDetector(
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
                                        Account()));
                          },
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundImage: AssetImage('assets/male3.jpg'),
                          ),
                        ),
                        title: Text('Hello , Jack Elves 👋',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Image.asset('assets/algeria.png',
                              height: 30.h, width: 30.w),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'ALGERIA',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'The Nature ',
                        style: TextStyle(
                          fontSize: 37.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Out of Power',
                        style: TextStyle(
                          fontSize: 38.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SearchBar(
                        leading: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search for places, activities...',
                        hintStyle: WidgetStateProperty.all(
                          TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shadowColor:
                            WidgetStateProperty.all(Colors.transparent),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 143.h,
                      child: ListView.builder(
                          itemCount: images.length,
                          //physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 170.h,
                                    width: 280.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20.r),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(images[index]['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(height: 10.h),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    images[index]
                                                        ['countryicon'],
                                                    height: 25.h,
                                                    width: 25.w,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text(
                                                      '${images[index]['name']} , ${images[index]['country']}',
                                                      style: TextStyle(
                                                        fontSize: 19.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: Text(
                                                images[index]['description'],
                                                style: TextStyle(
                                                  fontSize: 21.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Find out more',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Spacer(),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.h),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  165,
                                                                  169,
                                                                  59),
                                                          shape:
                                                              CircleBorder()),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        PageRouteBuilder(
                                                            transitionDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            transitionsBuilder:
                                                                (_, animation,
                                                                    __, child) {
                                                              return FadeTransition(
                                                                opacity:
                                                                    animation,
                                                                child: child,
                                                              );
                                                            },
                                                            pageBuilder: (_, __,
                                                                    ___) =>
                                                                Informationpage()));
                                                  },
                                                  child: Image.asset(
                                                    'assets/next.png',
                                                    height: 15.h,
                                                    width: 15.w,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Popular Destinations',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: 255.h,
                        width: 320.w,
                        child: SwipableStack(
                          controller: _controller,
                          itemCount: images.length,
                          builder: (context, properties) {
                            final index = properties.index;
                            if (index >= images.length) {
                              return Center(child: Text("No more cards"));
                            }
                            return Card(
                              shadowColor: Colors.black.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33.r),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    images[index]['image'],
                                    fit: BoxFit.cover,
                                    height: 255.h,
                                    width: 320.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40.h,
                                          width: 130.w,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(17.r),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ' ${images[index]['name']}',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent
                                                .withOpacity(0.15),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    images[index]['isLiked'] =
                                                        !images[index]
                                                            ['isLiked'];
                                                  });
                                                },
                                                child: Image.asset(
                                                  images[index]['isLiked']
                                                      ? 'assets/heartfilled.png'
                                                      : 'assets/heart.png',
                                                  fit: BoxFit.contain,
                                                  height: 30.h,
                                                  width: 30.w,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 220,
                                    bottom: 0,
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.w, vertical: 5.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  images[index]['desc'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color: Colors.amber,
                                                    ),
                                                    Text(
                                                      images[index]['rating'],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40.h,
                                              width: 110.w,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  for (int i = 0;
                                                      i < Persons.length;
                                                      i++)
                                                    Positioned(
                                                      left: i * 26.w,
                                                      child: CircleAvatar(
                                                        radius: 16.r,
                                                        backgroundImage:
                                                            AssetImage(
                                                                Persons[i]),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
