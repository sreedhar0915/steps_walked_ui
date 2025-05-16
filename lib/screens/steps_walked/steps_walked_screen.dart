import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steps_walked_ui/helpers/app_colors.dart';
import 'package:steps_walked_ui/helpers/screen_config.dart';
import 'package:steps_walked_ui/helpers/size_extensions.dart';
import 'package:steps_walked_ui/screens/steps_walked/widgets/walked_information_card.dart';

class StepsWalkedScreen extends StatefulWidget {
  @override
  State<StepsWalkedScreen> createState() => _StepsWalkedScreenState();
}

class _StepsWalkedScreenState extends State<StepsWalkedScreen> {
  int selectedIndex = 0;

  final List<String> labels = ['Days', 'Weeks', 'Months', 'All'];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: ColorConstants.uppercontainercolor,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 20.sp,
                              color: ColorConstants.white,
                            )),
                        SizedBox(width: 20),
                        Text(
                          'Steps walked',
                          style: GoogleFonts.roboto(
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorConstants.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Text(
                        "15 August 2024",
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: ColorConstants.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 56.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/days.png"),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 172.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/graph.png"),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(labels.length, (index) {
                            BorderRadius? borderRadius;
                            if (index == 0) {
                              borderRadius = BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  bottomLeft: Radius.circular(26));
                            } else if (index == labels.length - 1) {
                              borderRadius = BorderRadius.only(
                                  topRight: Radius.circular(26),
                                  bottomRight: Radius.circular(26));
                            }

                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 28.h,
                                    width: 73.w,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? ColorConstants.selectedcolor
                                          : ColorConstants.unselectedcolor,
                                      borderRadius: borderRadius,
                                    ),
                                    child: Center(
                                      child: Text(
                                        labels[index],
                                        style: TextStyle(
                                          color: selectedIndex == index
                                              ? ColorConstants
                                                  .uppercontainercolor
                                              : ColorConstants.selectedcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 1),
                              ],
                            );
                          }),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Spacer(),
                            Icon(Icons.fiber_manual_record,
                                size: 8, color: ColorConstants.white),
                            SizedBox(width: 5),
                            Icon(Icons.fiber_manual_record,
                                size: 8, color: ColorConstants.grey),
                            Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.grey.withOpacity(0.4),
                    spreadRadius: 1.r,
                    blurRadius: 8.r,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Steps walked information',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.Textcolor,
                      ),
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        Row(
                          children: [
                            WalkedInformationCard(
                              icon: "assets/images/steps.png",
                              title: "2500 steps",
                              subtitle: "Total steps today",
                            ),
                            Spacer(),
                            WalkedInformationCard(
                              icon: "assets/images/time_logo.png",
                              title: "9:15 AM",
                              subtitle: "Time  started walking",
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        WalkedInformationCard(
                          icon: "assets/images/alarm_logo.png",
                          title: "1h 5 min",
                          subtitle: "Active walking time",
                        ),
                        Spacer(),
                        WalkedInformationCard(
                          icon: "assets/images/distance_logo.png",
                          title: "5.4 km",
                          subtitle: "Distance covered",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.grey.withOpacity(0.4),
                    spreadRadius: 1.r,
                    blurRadius: 8.r,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Average Steps This Week',
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.Textcolor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "5000",
                            style: GoogleFonts.roboto(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.Textcolor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "steps per day",
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.Textcolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: 0.6,
                          strokeWidth: 12,
                          color: ColorConstants.Textcolor,
                          backgroundColor: ColorConstants.grey,
                        ),
                      ),
                      Center(
                        child: Text(
                          "5000/10000",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.Textcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
