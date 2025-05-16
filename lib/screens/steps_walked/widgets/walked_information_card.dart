import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steps_walked_ui/helpers/app_colors.dart';
import 'package:steps_walked_ui/helpers/size_extensions.dart';

class WalkedInformationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const WalkedInformationCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.white,
      child: Row(
        children: [
          Container(
              height: 24, width: 24, child: Image(image: AssetImage(icon))),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.Textcolor,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.roboto(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
